import XCTest
@testable import PersonsFeature
import ProfileFeature
import Shared

final class PersonsListViewModelTests: XCTestCase {
 
    func testHappyPath() {
        let sut = PersonsListViewModel(username: "happyPath", client: .mock)
        
        sut.search()
        
        _ = XCTWaiter.wait(for: [XCTestExpectation()], timeout: 0.5)

        XCTAssertNil(sut.error)
        XCTAssertEqual(sut.persons.count, 6)
        XCTAssertEqual(sut.persons.first?.id
                       , "001")
        XCTAssertEqual(sut.persons.first?.firstname, "Clark")
        XCTAssertEqual(sut.persons.first?.surname, "Griswold, Jr")
        XCTAssertEqual(sut.persons.first?.dob, "08101943")
        XCTAssertEqual(sut.persons.first?.image, "https://m.media-amazon.com/images/M/MV5BMTMwNTY2ODA4OV5BMl5BanBnXkFtZTcwOTE1NjAxMw@@._V1_UY317_CR15,0,214,317_AL_.jpg")
        
        let profile = sut.profile("101010")
    
        let exptectData = ProfileViewModel(
            personId: "101010",
            username: "happyPath",
            persons: Person.mock
        )
        
        XCTAssertEqual(profile, exptectData)
    }
    
    func testUnhappyPath() {
        let sut = PersonsListViewModel(username: "unhapptpath", client: .error)
        
        sut.search()
        
        _ = XCTWaiter.wait(for: [XCTestExpectation()], timeout: 0.5)
        
        XCTAssertNotNil(sut.error)
        XCTAssertEqual(sut.error, "Sorry, User doesn't exist.")
    }
}
