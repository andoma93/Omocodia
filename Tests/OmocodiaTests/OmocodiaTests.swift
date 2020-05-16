import XCTest
@testable import Omocodia

final class OmocodiaTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(Omocodia().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
