import XCTest
@testable import Shared

final class SharedTests: XCTestCase {
    
    func testProfilesResponse_Decode_ReturnCorrectValue() {
        let bundle = Bundle(for: type(of: self))
        let filename = "persons.json"
        
        do {
            let sut = try bundle.decode(PersonsResponse.self, from: filename)
            XCTAssertEqual(sut.data?.first?.id, "001")
            XCTAssertEqual(sut.data?.first?.firstname, "Clark")
            XCTAssertEqual(sut.data?.first?.surname, "Griswold, Jr")
            XCTAssertEqual(sut.data?.first?.dob, "08101943")
            XCTAssertEqual(sut.data?.first?.image, "https://m.media-amazon.com/images/M/MV5BMTMwNTY2ODA4OV5BMl5BanBnXkFtZTcwOTE1NjAxMw@@._V1_UY317_CR15,0,214,317_AL_.jpg")

            XCTAssertEqual(sut.data?.last?.id, "016")
            XCTAssertEqual(sut.data?.last?.firstname, "Eddie, Jr.")
            XCTAssertEqual(sut.data?.last?.surname, "Johnson")
            XCTAssertEqual(sut.data?.last?.dob, "19021975")
            XCTAssertNil(sut.data?.last?.image)

        } catch {
            XCTFail("Failed to decode \(filename), error \(error.localizedDescription)")
        }
    }
    
    func testProfileResponse_Decode_ReturnCorrectValue() {
        let bundle = Bundle(for: type(of: self))
        let filename = "profile.json"
        
        do {
            let sut = try bundle.decode(ProfileResponse.self, from: filename)
            XCTAssertEqual(sut.data?.id, "001")
            XCTAssertEqual(sut.data?.firstname, "Clark")
            XCTAssertEqual(sut.data?.surname, "Griswold, Jr")
            XCTAssertEqual(sut.data?.dob, "08101943")
            XCTAssertEqual(sut.data?.image, "https://m.media-amazon.com/images/M/MV5BMTMwNTY2ODA4OV5BMl5BanBnXkFtZTcwOTE1NjAxMw@@._V1_UY317_CR15,0,214,317_AL_.jpg")
            XCTAssertEqual(sut.data?.relationships.spouse, "002")
            XCTAssertEqual(sut.data?.relationships.mother, "008")
            XCTAssertEqual(sut.data?.relationships.father, "007")
            XCTAssertEqual(sut.data?.relationships.children?.first, "009")
            XCTAssertEqual(sut.data?.relationships.children?.last, "010")
        } catch {
            XCTFail("Failed to decode \(filename), error \(error.localizedDescription)")
        }
    }
}
