import XCTest
@testable import PersonsFeature

final class PersonsSearchViewModelTests: XCTestCase {
 
    func testPersonsListViewModel_IsSet() {
        let username = "cgriswold"
        let sut = PersonsSearchViewModel(username: username)
        let expectedData = PersonsListViewModel(username: username)
        XCTAssertEqual(sut.personsList, expectedData)
    }
    
    func testSubmitButtonTapped() {
        let sut = PersonsSearchViewModel()
        XCTAssertFalse(sut.isNavigationActive)
        sut.submitButtonTapped()
        XCTAssertTrue(sut.isNavigationActive)
    }
}
