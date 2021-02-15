import SwiftUI
import SharedUI
import Shared

public struct ProfileView: View {
    @ObservedObject private(set) var viewModel: ProfileViewModel

    public init(viewModel: ProfileViewModel) {
        self.viewModel = viewModel
    }

    public var body: some View {
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
                selectedPerson
                childrenContainer
            }
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
    
    private var selectedPerson: some View {
        HStack {
            if let selectedPerson = viewModel.selectedPerson {
                ProfileThumbnail(person: selectedPerson, selected: true)
                if let spouse = viewModel.spouse {
                    ProfileThumbnail(person: spouse)
                }
            }
        }
    }
    
    private var childrenContainer: some View {
        Group {
            if let children = viewModel.children {
                if children.count > 2 {
                    ScrollView(.horizontal, showsIndicators: false) {
                        childrenContent(children)
                            .padding(.horizontal)
                    }
                } else {
                    childrenContent(children)
                }
            }
        }
    }
    
    private func childrenContent(_ children: [Person]) -> some View {
        HStack {
            ForEach(children) { child in
                ProfileThumbnail(person: child)
            }
        }
    }
    
    private func fetch() {
        viewModel.fetch()
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(
            viewModel: .init(
                client: .mockProfile1,
                personId: "010",
                username: "cgriswold",
                persons: []
            )
        )
    }
}
