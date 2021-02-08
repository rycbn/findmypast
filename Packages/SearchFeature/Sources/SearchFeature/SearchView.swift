import SwiftUI
import SharedUI

public struct SearchView: View {
    public init() {}
    
    public var body: some View {
        NavigationView {
            VStack {
                TextField("Username", text: .constant(""))
                    .autocapitalization(.none)
                    .textCase(.lowercase)
                    .textFieldStyle(CustomRoundedBorderTextFieldStyle())
                    .accessibility(label: Text("Username text field"))
                
                NavigationLink(destination: EmptyView()) {
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
