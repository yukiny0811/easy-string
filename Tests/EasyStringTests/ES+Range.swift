import XCTest
@testable import EasyString

final class ESRangeTests: XCTestCase {
    
    let str = "0123456789"
    
    func testCountableRange() throws {
        let result = str[2..<5]
        XCTAssertEqual(result, "234")
    }
    
    func testCountableClosedRange() throws {
        let result = str[2...5]
        XCTAssertEqual(result, "2345")
    }
    
    func testPartialRangeUpTo() throws {
        let result = str[..<7]
        XCTAssertEqual(result, "0123456")
    }
    
    func testPartialRangeThrough() throws {
        let result = str[...7]
        XCTAssertEqual(result, "01234567")
    }
    
    func testPartialRangeFrom() throws {
        let result = str[5...]
        XCTAssertEqual(result, "56789")
    }
    
}
