import SwiftUI

public struct CustomRoundedBorderTextFieldStyle: TextFieldStyle {
    private var shape = RoundedRectangle(cornerRadius: 8, style: .continuous)

    public init() {}

    public func _body(configuration: TextField<_Label>) -> some View {
        configuration
            .padding()
            .clipShape(shape)
            .overlay(
                shape
                    .inset(by: 0.5)
                    .stroke(Color.black.opacity(0.5), lineWidth: 1.0)
            )
            .contentShape(shape)
    }
}

struct CustomRoundedBorderTextFieldStyle_Previews: PreviewProvider {
    static var previews: some View {
        TextField("username", text: .constant(""))
            .autocapitalization(.none)
            .textCase(.lowercase)
            .textFieldStyle(CustomRoundedBorderTextFieldStyle())
            .padding()
    }
}
