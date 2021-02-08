import SwiftUI
import SharedUI

public struct SearchView: View {
    @State private var username: String = ""
    
    public init() {}
    
    public var body: some View {
        NavigationView {
            VStack {
                TextField("Username", text: $username)
                    .autocapitalization(.none)
                    .textCase(.lowercase)
                    .disableAutocorrection(true)
                    .textFieldStyle(CustomRoundedBorderTextFieldStyle())
                    .accessibility(label: Text("Username text field"))
                
                NavigationLink(
                    destination: SearchResultListView(
                        username: username,
                        viewModel: .init(client: .live)
                    )
                ) {
                    Text("Submit")
                        .accessibility(label: Text("Submit button"))
                }
                .buttonStyle(PrimaryButtonStyle())
            }
            .padding(.horizontal)
            .navigationTitle("Find My Past")
            .accessibility(label: Text("Find My Past"))
        }
        .accentColor(.black)
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
