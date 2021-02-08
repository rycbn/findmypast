import SwiftUI

public struct PrimaryButtonStyle: ButtonStyle {
    private(set) var fadeOnPressed: Bool
    
    public init(fadeOnPressed: Bool = true) {
        self.fadeOnPressed = fadeOnPressed
    }
    
    public func makeBody(configuration: Configuration) -> some View {
        configuration
            .label
            .frame(maxWidth: .infinity)
            .font(.body)
            .padding()
            .foregroundColor(.white)
            .background(Color.black)
            .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
            .opacity(configuration.isPressed && fadeOnPressed ? 0.75 : 1.0)
            .scaleEffect(configuration.isPressed ? 0.99 : 1.0)
    }
}

struct PrimaryButtonStyle_Previews: PreviewProvider {
    static var previews: some View {
        Button("Submit", action: {})
            .buttonStyle(PrimaryButtonStyle())
            .padding()
    }
}
