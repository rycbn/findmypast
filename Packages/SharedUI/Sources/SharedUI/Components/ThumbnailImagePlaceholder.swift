import SwiftUI

public struct ThumbnailImagePlaceholder: View {
    
    public init() {}

    public var body: some View {
        Image("placeholder", bundle: .module)
            .resizable()
            .overlay(
                Image(systemName: "person.circle")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding()
            )
    }
}

struct ThumbnailImagePlaceholder_Previews: PreviewProvider {
    private static let shape = RoundedRectangle(cornerRadius: 16, style: .continuous)
    
    static var previews: some View {
        ThumbnailImagePlaceholder()
            .frame(width: 150, height: 250)
            .aspectRatio(contentMode: .fit)
            .clipShape(shape)
            .previewLayout(.sizeThatFits)
            .previewDisplayName("Rounded Rectangle")
        
        ThumbnailImagePlaceholder()
            .frame(width: 150, height: 150)
            .aspectRatio(contentMode: .fit)
            .clipShape(Circle())
            .previewLayout(.sizeThatFits)
            .previewDisplayName("Circle")
    }
}
