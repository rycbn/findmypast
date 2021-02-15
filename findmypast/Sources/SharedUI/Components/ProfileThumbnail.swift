import SwiftUI
import Shared

public struct ProfileThumbnail: View {
    private let shape = RoundedRectangle(cornerRadius: 32, style: .continuous)
    private let person: Person
    private let selected: Bool
    
    public init(
        person: Person,
        selected: Bool = false
    ) {
        self.person = person
        self.selected = selected
    }

    public var body: some View {
        ZStack {
            Color.blue.opacity(selected ? 1.0 : 0.65)
            VStack {
                RoundedRectangleThumbnailImage(person.imageURL)
                    .clipShape(Circle())
                Text(person.firstname)
                    .accessibility(label: Text(person.firstname))
                Text(person.surname)
                    .accessibility(label: Text(person.surname))
                Text(person.dob)
                    .accessibility(label: Text("Date of birth: \(person.dob)"))
            }
            .padding(.bottom)
        }
        .clipShape(shape)
        .overlay(
            shape
                .inset(by: 0.5)
                .stroke(Color.black.opacity(0.8), lineWidth: 1.0)
        )
        .frame(width: 160, height: 245)
    }
}

struct ProfileThumbnail_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ProfileThumbnail(
                person: .person1,
                selected: true
            )
            
            ProfileThumbnail(
                person: .person2,
                selected: false
            )
        }
        .previewLayout(.sizeThatFits)
    }
}
