import SwiftUI
import Kingfisher

public struct RoundedRectangleThumbnailImage: View {
    private let shape = RoundedRectangle(cornerRadius: 16, style: .continuous)
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
        .clipShape(shape)
        .frame(width: 100, height: 150)
    }
}

struct RoundedRectangleThumbnailImage_Previews: PreviewProvider {
    private static let url = URL(string: "https://m.media-amazon.com/images/M/MV5BNzQ2ODY0MTIwMV5BMl5BanBnXkFtZTcwNDQ2NzMzMw@@._V1_UX178_CR0,0,178,264_AL_.jpg")!

    static var previews: some View {
        Group {
            RoundedRectangleThumbnailImage(url)
            RoundedRectangleThumbnailImage()
        }
        .previewLayout(.sizeThatFits)
    }
}
