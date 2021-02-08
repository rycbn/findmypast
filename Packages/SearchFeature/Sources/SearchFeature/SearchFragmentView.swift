import SwiftUI
import SharedUI
import Shared

struct SearchFragmentView: View {
    @ObservedObject private(set) var viewModel: SearchFragmentViewModel

    init(viewModel: SearchFragmentViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        ZStack {
            if viewModel.isLoading {
                ActivityIndicator()
                    .frame(maxWidth: .infinity)
            }
            if let error = viewModel.error {
                LoadingErrorMessage(error)
            } else {
                content
            }
        }
        .navigationTitle("Family Tree")
        .accessibility(label: Text("Family Tree"))
        .onAppear(perform: fetch)
    }
    
    private var content: some View {
        ScrollView {
            VStack {
                parents
                
                HStack {
                    if let selectedPerson = viewModel.selectedPerson {
                        ProfileThumbnail(person: selectedPerson, selected: true)
                        if let spouse = viewModel.spouse {
                            ProfileThumbnail(person: spouse)
                        }
                    }
                }
                
                children
                
            }
            .onAppear(perform: fetch)
        }
    }
    
    private var parents: some View {
        Group {
            if viewModel.isParent {
                HStack {
                    if let father = viewModel.father {
                        ProfileThumbnail(person: father)
                    }
                    if let mother = viewModel.mother {
                        ProfileThumbnail(person: mother)
                    }
                }
            }
        }
    }
    
    private var children: some View {
        Group {
            if let children = viewModel.children {
                if children.count > 2 {
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(children) { child in
                                ProfileThumbnail(person: child)
                            }
                        }
                        .padding(.horizontal)
                    }
                } else {
                    HStack {
                        ForEach(children) { child in
                            ProfileThumbnail(person: child)
                        }
                    }
                }
            }
        }
    }
    
    private func fetch() {
        viewModel.fetch()
    }
}

struct TreeFragmentView_Previews: PreviewProvider {
    static var previews: some View {
        SearchFragmentView(
            viewModel: .init(
                client: .mockProfile1,
                personId: "010",
                username: "cgriswold",
                persons: []
            )
        )
    }
}
