import SwiftUI
import SharedUI
import Shared

struct SearchResultListRowView: View {
    let person: Person
    
    var body: some View {
        HStack {
            RoundedRectangleThumbnailImage(person.imageURL)
            
            VStack(alignment: .leading) {
                Text(person.fullname)
                    .font(.title2)
                    .accessibility(label: Text(person.fullname))
                
                Text(person.dob)
                    .font(.title3)
                    .accessibility(label: Text("Date of birth"))
            }
        }
        .padding(.vertical, 8)
    }
}

struct PersonListRowView_Previews: PreviewProvider {
    static var previews: some View {
        SearchResultListRowView(person: .person1)
            .previewLayout(.sizeThatFits)
    }
}
