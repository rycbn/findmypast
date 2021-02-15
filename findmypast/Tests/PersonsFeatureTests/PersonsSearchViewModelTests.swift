import XCTest
@testable import PersonsFeature

final class PersonsSearchViewModelTests: XCTestCase {
 
    func testSubmitButtonTapped() {
        let sut = PersonsSearchViewModel()
        XCTAssertFalse(sut.isNavigationActive)
        sut.submitButtonTapped()
        XCTAssertTrue(sut.isNavigationActive)
    }
}
