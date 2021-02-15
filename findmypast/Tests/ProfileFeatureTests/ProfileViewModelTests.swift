import XCTest
@testable import ProfileFeature
import Shared

final class ProfileViewModelTests: XCTestCase {
 
    func testHappyPath_Profile1_withDynamicMemberLookup() {
        let sut = ProfileViewModel(
            client: .mockProfile1,
            personId: "010",
            username: "cgriswold",
            persons: Person.mock
        )
        
        sut.fetch()
        
        XCTAssertNil(sut.error)
        XCTAssertEqual(sut.profile?.id, "001")
        XCTAssertEqual(sut.profile?.firstname, "Clark")
        XCTAssertEqual(sut.profile?.surname, "Griswold, Jr")
        XCTAssertEqual(sut.profile?.dob, "08101943")
        XCTAssertEqual(sut.profile?.image, "https://m.media-amazon.com/images/M/MV5BMTMwNTY2ODA4OV5BMl5BanBnXkFtZTcwOTE1NjAxMw@@._V1_UY317_CR15,0,214,317_AL_.jpg")
        
        XCTAssertEqual(sut.profile?.relationships.spouse, "002")
        XCTAssertEqual(sut.profile?.relationships.mother, "008")
        XCTAssertEqual(sut.profile?.relationships.father, "007")
        XCTAssertEqual(sut.profile?.relationships.children?.first, "009")
        XCTAssertEqual(sut.profile?.relationships.children?.last, "010")

        XCTAssertEqual(sut.profile?.relationships.mother, sut.profile?.mother)
        XCTAssertEqual(sut.profile?.relationships.father, sut.profile?.father)
        
        XCTAssertNotNil(sut.isParent)
        XCTAssertEqual(sut.spouse, .person2)
        XCTAssertEqual(sut.mother, .person3)
        XCTAssertEqual(sut.father, .person4)
        XCTAssertEqual(sut.children?.first, .person5)
        XCTAssertEqual(sut.children?.last, .person6)
    }
    
    func testHappyPath_Profile2() {
        let sut = ProfileViewModel(
            client: .mockProfile2,
            personId: "010",
            username: "cgriswold",
            persons: Person.mock
        )
        
        sut.fetch()
                
        XCTAssertNil(sut.error)
        XCTAssertEqual(sut.profile?.id, "010")
        XCTAssertEqual(sut.profile?.firstname, "Russ")
        XCTAssertEqual(sut.profile?.surname, "Griswold")
        XCTAssertEqual(sut.profile?.dob, "30041975")
        XCTAssertEqual(sut.profile?.image, "https://m.media-amazon.com/images/M/MV5BNzQ2ODY0MTIwMV5BMl5BanBnXkFtZTcwNDQ2NzMzMw@@._V1_UX178_CR0,0,178,264_AL_.jpg")
        
        XCTAssertNil(sut.profile?.relationships.spouse)
        XCTAssertEqual(sut.profile?.relationships.mother, "002")
        XCTAssertEqual(sut.profile?.relationships.father, "001")
        XCTAssertNil(sut.profile?.relationships.children)
        
        XCTAssertEqual(sut.mother, .person2)
        XCTAssertEqual(sut.father, .person1)
    }
    
    func testUnhappyPath() {
        let sut = ProfileViewModel(
            client: .error,
            personId: "010",
            username: "cgriswold",
            persons: []
        )
        
        sut.fetch()
        
        XCTAssertNotNil(sut.error)
        XCTAssertEqual(sut.error, "Something is wrong with your tree")
    }
}
