import SwiftUI

public struct LoadingErrorMessage: View {
    private let error: String
    
    public init(_ error: String) {
        self.error = error
    }
    
    public var body: some View {
        Text(error)
            .foregroundColor(.red)
            .font(.body)
            .bold()
            .accessibility(label: Text(error))
            .padding()
    }
}

struct LoadingErrorMessage_Previews: PreviewProvider {
    static var previews: some View {
        LoadingErrorMessage("Sorry, user doesn't exist")
    }
}
