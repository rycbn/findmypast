import SwiftUI
import SharedUI

public struct PersonsSearchView: View {
    @ObservedObject var viewModel: PersonsSearchViewModel
    
    public init(viewModel: PersonsSearchViewModel) {
        self.viewModel = viewModel
    }
    
    public var body: some View {
        NavigationView {
            content
        }
        .accentColor(.black)
    }
    
    private var content: some View {
        VStack {
            UsernameTextField(text: $viewModel.username)
            submitButton
        }
        .padding(.horizontal)
        .navigationTitle("Find My Past")
        .accessibility(label: Text("Find My Past"))
    }
    
    private var submitButton: some View {
        Button(action: viewModel.submitButtonTapped) {
            NavigationLink(
                destination: destinationView,
                isActive: $viewModel.isNavigationActive
            ) {
                Text("Submit")
                    .accessibility(label: Text("Submit button"))
            }
        }
        .buttonStyle(PrimaryButtonStyle())
    }
    
    private var destinationView: some View {       
        PersonsListView(
            username: viewModel.username,
            viewModel: .init()
        )
    }
}

struct PersonsSearchView_Previews: PreviewProvider {
    static var previews: some View {
        PersonsSearchView(viewModel: .init())
    }
}
