import SwiftUI
import AsyncImage

public struct CircleThumbnailImage: View {
    private let shape = Circle()
    private let url: URL?

    public init(_ url: URL? = nil) {
        self.url = url
    }
    
    public var body: some View {
        Group {
            if let url = url {
                AsyncImage(url)
                    .placeholder {
                        ThumbnailImagePlaceholder()
                    }
                    .resizable()
                    .aspectRatio(contentMode: .fit)

            } else {
                ThumbnailImagePlaceholder()
            }
        }
        .clipShape(shape)
        .frame(width: 150, height: 150)
    }
}

struct CircleThumbnailImage_Previews: PreviewProvider {
    private static let url = URL(string: "https://m.media-amazon.com/images/M/MV5BNzQ2ODY0MTIwMV5BMl5BanBnXkFtZTcwNDQ2NzMzMw@@._V1_UX178_CR0,0,178,264_AL_.jpg")!

    static var previews: some View {
        Group {
            CircleThumbnailImage(url)
            CircleThumbnailImage()
        }
        .previewLayout(.sizeThatFits)
    }
}
