import XCTest
@testable import EasyString

final class ESUtilTests: XCTestCase {
    
    var str = "012ABCdef"
    
    // replace
    
    func testReplace1() throws {
        str.replace(2...5, with: "apple")
        XCTAssertEqual(str, "01appledef")
    }
    
    func testReplace2() throws {
        str.replace(2..<5, with: "apple")
        XCTAssertEqual(str, "01appleCdef")
    }
    
    func testReplace3() throws {
        str.replace(2..., with: "apple")
        XCTAssertEqual(str, "01apple")
    }
    
    func testReplace4() throws {
        str.replace(...2, with: "apple")
        XCTAssertEqual(str, "appleABCdef")
    }
    
    func testReplace5() throws {
        str.replace(..<2, with: "apple")
        XCTAssertEqual(str, "apple2ABCdef")
    }
    
    // lowercase
    
    func testLowercase() throws {
        str.lowercase(0...4)
        XCTAssertEqual(str, "012abCdef")
    }
    
    // uppercase
    
    func testUppercase() throws {
        str.uppercase(7...)
        XCTAssertEqual(str, "012ABCdEF")
    }
    
    // contains
    
    func testContains1() throws {
        XCTAssertTrue(str.contains("ABC"))
        XCTAssertFalse(str.contains("DEF"))
    }
    
    func testContains2() throws {
        XCTAssertTrue(str.contains("ABC", in: 3...5))
        XCTAssertFalse(str.contains("ABC", in: 2...4))
    }
    
    // deleteFirst & deleteLast
    
    func testDeleteFirst() throws {
        str.deleteFirst()
        XCTAssertEqual(str, "12ABCdef")
    }
    
    func testDeleteLast() throws {
        str.deleteLast()
        XCTAssertEqual(str, "012ABCde")
    }
    
    func testDeleteFirstAndLast() throws {
        str.deleteFirst()
        str.deleteFirst()
        str.deleteLast()
        str.deleteLast()
        XCTAssertEqual(str, "2ABCd")
    }
    
    var str2 = "012　ABC def\nあいう"
    
    // remove whitespace
    
    func testRemoveWhitespace() throws {
        str2.removeWhitespace()
        XCTAssertEqual(str2, "012ABCdef\nあいう")
    }
    
    // remove newline
    
    func testRemoveNewLine() throws {
        str2.removeNewLine()
        XCTAssertEqual(str2, "012　ABC defあいう")
    }
    
}
