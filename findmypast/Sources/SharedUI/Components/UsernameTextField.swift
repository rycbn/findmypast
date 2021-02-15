import SwiftUI

public struct UsernameTextField: View {
    @Binding var text: String
    
    public init(text: Binding<String>) {
        self._text = text
    }
    
    public var body: some View {
        TextField("Username", text: $text)
            .autocapitalization(.none)
            .textCase(.lowercase)
            .disableAutocorrection(true)
            .textFieldStyle(CustomRoundedBorderTextFieldStyle())
            .accessibility(label: Text("Username text field"))
    }
}

struct UsernameTextField_Previews: PreviewProvider {
    static var previews: some View {
        UsernameTextField(text: .constant("cgriswold"))
    }
}
