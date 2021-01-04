import XCTest
@testable import TinyGraphQL

final class TinyGraphQLTests: XCTestCase {
    func testInit() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        let graphQL = TinyGraphQL(
            url: URL(string: "https://combase.app/graphql")!,
            headers: ["combase-organization": "orgid", "Content-Type": "application/json"]
        )
        
        XCTAssertEqual(graphQL.url.absoluteString, "https://combase.app/graphql")
        XCTAssertEqual(graphQL.headers["combase-organization"], "orgid")
        XCTAssertEqual(graphQL.headers["Content-Type"], "application/json")
    }

    static var allTests = [
        ("testInit", testInit),
    ]
}
