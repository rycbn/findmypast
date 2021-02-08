import SwiftUI

public struct ActivityIndicator: UIViewRepresentable {
    public init() {}
    
    public func makeUIView(context: Context) -> UIActivityIndicatorView {
        let indicator = UIActivityIndicatorView()
        indicator.style = .medium
        indicator.startAnimating()
        return indicator
    }
    
    public func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {}
}

struct ActivityIndicator_Previews: PreviewProvider {
    static var previews: some View {
        ActivityIndicator()
    }
}
