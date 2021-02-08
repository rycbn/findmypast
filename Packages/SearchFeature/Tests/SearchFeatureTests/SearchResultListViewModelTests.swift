import XCTest
@testable import SearchFeature

final class SearchResultListViewModelTests: XCTestCase {
 
    func testHappyPath() {
        let sut = SearchResultListViewModel(client: .mock)
        
        sut.search(username: "happypath")
        
        XCTAssertNil(sut.error)
        XCTAssertEqual(sut.persons.count, 6)
        XCTAssertEqual(sut.persons.first?.id
                       , "001")
        XCTAssertEqual(sut.persons.first?.firstname, "Clark")
        XCTAssertEqual(sut.persons.first?.surname, "Griswold, Jr")
        XCTAssertEqual(sut.persons.first?.dob, "08101943")
        XCTAssertEqual(sut.persons.first?.image, "https://m.media-amazon.com/images/M/MV5BMTMwNTY2ODA4OV5BMl5BanBnXkFtZTcwOTE1NjAxMw@@._V1_UY317_CR15,0,214,317_AL_.jpg")
    }
    
    func testUnhappyPath() {
        let sut = SearchResultListViewModel(client: .error)
        
        sut.search(username: "unhappypath")
        
        XCTAssertNotNil(sut.error)
        XCTAssertEqual(sut.error, "Sorry, User doesn't exist.")
    }
}