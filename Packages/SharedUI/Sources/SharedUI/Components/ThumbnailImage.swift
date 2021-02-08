import SwiftUI
import Kingfisher

public struct ThumbnailImage: View {
    private let url: URL?

    public init(_ url: URL? = nil) {
        self.url = url
    }
    
    public var body: some View {
        Group {
            switch url {
            case .none:
                ThumbnailImagePlaceholder()
            case .some:
                KFImage(url)
                    .placeholder {
                        ThumbnailImagePlaceholder()
                    }
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
        }
    }
}

struct ThumbnailImage_Previews: PreviewProvider {
    private static let url = URL(string: "https://m.media-amazon.com/images/M/MV5BNzQ2ODY0MTIwMV5BMl5BanBnXkFtZTcwNDQ2NzMzMw@@._V1_UX178_CR0,0,178,264_AL_.jpg")!
    private static let shape = RoundedRectangle(cornerRadius: 8, style: .continuous)
    
    static var previews: some View {
        Group {
            ThumbnailImage(url)
            ThumbnailImage()
        }
        .frame(width: 200)
        .clipShape(shape)
        .previewLayout(.sizeThatFits)
        .previewDisplayName("Rounded Rectangle")
        
        Group {
            ThumbnailImage(url)
            ThumbnailImage()
        }
        .frame(width: 200)
        .clipShape(Circle())
        .previewLayout(.sizeThatFits)
        .previewDisplayName("Circle")
    }
}
