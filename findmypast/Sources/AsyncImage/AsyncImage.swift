import SwiftUI
import Combine

final class ImageLoader: ObservableObject {
    @Published var image: UIImage? = nil
    private var cancellable: AnyCancellable?
    
    deinit {
        cancellable?.cancel()
    }
    
    init(_ url: URL) {
        cancellable = URLSession
            .shared
            .dataTaskPublisher(for: url)
            .map(\.data)
            .map(UIImage.init)
            .receive(on: DispatchQueue.main)
            .replaceError(with: nil)
            .assign(to: \.image, on: self)
    }
}

public struct AsyncImage: View {
    @ObservedObject private var imageLoader: ImageLoader
    private var context: Context
    private let placeholder = UIImage(named: "placeholder", in: .module, with: .none)!
    private var uiImage: UIImage? { imageLoader.image }
    private var image: Image { Image(uiImage: uiImage ?? placeholder) }
    
    public init(_ url: URL) {
        imageLoader = ImageLoader(url)
        context = Context()
    }
    
    public var body: some View {
        context.configuratons.reduce(image) { current, config in
            config(current)
        }
    }
}

extension AsyncImage {
    struct Context {
        var configuratons: [(Image) -> Image] = []
        var placeholder: AnyView? = nil
    }
}

extension AsyncImage {
    public func placeholder<Content: View>(@ViewBuilder _ content: () -> Content) -> Self {
        let view = content()
        var result = self
        result.context.placeholder = AnyView(view)
        return result
    }
    
    public func configure(_ block: @escaping (Image) -> Image) -> Self {
        var result = self
        result.context.configuratons.append(block)
        return result
    }
    
    public func resizable(capInsets: EdgeInsets = EdgeInsets(), resizingMode: Image.ResizingMode = .stretch) -> Self {
        configure { $0.resizable(capInsets: capInsets, resizingMode: resizingMode) }
    }
    
    public func renderingMode(_ renderingMode: Image.TemplateRenderingMode?) -> Self {
        configure { $0.renderingMode(renderingMode) }
    }
}

struct AsyncImageDemoView_Previews: PreviewProvider {
    static let url = URL(string: "https://m.media-amazon.com/images/M/MV5BMTMwNTY2ODA4OV5BMl5BanBnXkFtZTcwOTE1NjAxMw@@._V1_UY317_CR15,0,214,317_AL_.jpg")!
    
    static var previews: some View {
        AsyncImage(url)
            .resizable()
            .aspectRatio(contentMode: .fit)
    }
}
