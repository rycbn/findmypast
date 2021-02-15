import SwiftUI
import SharedUI
import Shared

struct PersonsListRowView: View {
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

struct PersonsListRowView_Previews: PreviewProvider {
    static var previews: some View {
        PersonsListRowView(person: .person1)
            .previewLayout(.sizeThatFits)
    }
}
