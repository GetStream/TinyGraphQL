import XCTest
@testable import TinyGraphQL

final class TinyGraphQLTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(TinyGraphQL().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
