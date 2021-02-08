import XCTest
@testable import Networking

final class NetworkingTests: XCTestCase {
        
    func testPersonsEndpoint_withReplacementOfTarget() {
        let sut = Networking()
        let expectedURL = URL(string: "http://localhost:3001/profiles/cgriswold")
        let url = sut
            .request(.persons)?
            .replacingOccurrences(of: ":userId", with: "cgriswold")
        
        XCTAssertEqual(url, expectedURL)
    }
    
    func testProfileEndpoint_withReplacementOfTarget() {
        let sut = Networking()
        let expectedURL = URL(string: "http://localhost:3001/profile/001/cgriswold")
        let url = sut
            .request(.profile)?
            .replacingOccurrences(of: ":personId", with: "001")?
            .replacingOccurrences(of: ":userId", with: "cgriswold")
        
        XCTAssertEqual(url, expectedURL)
    }
}
