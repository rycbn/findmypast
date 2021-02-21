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
        NavigationLink(
            destination: destinationView,
            isActive: $viewModel.isNavigationActive
        ) {
            Button("Submit", action: viewModel.submitButtonTapped)
                .accessibility(label: Text("Submit button"))
        }
        .buttonStyle(PrimaryButtonStyle())
    }
    
    private var destinationView: some View {       
        PersonsListView(viewModel: viewModel.personsList)
    }
}

struct PersonsSearchView_Previews: PreviewProvider {
    static var previews: some View {
        PersonsSearchView(viewModel: .init())
    }
}
