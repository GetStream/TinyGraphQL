import XCTest
@testable import TinyGraphQL

final class TinyGraphQLTests: XCTestCase {
    let graphQL = GraphQL(
        url: URL(string: "https://combase.app/graphql")!,
        headers: ["combase-organization": "orgid", "Content-Type": "application/json"]
    )
    
    func testInit() {
        XCTAssertEqual(graphQL.url.absoluteString, "https://combase.app/graphql")
        XCTAssertEqual(graphQL.headers["combase-organization"], "orgid")
        XCTAssertEqual(graphQL.headers["Content-Type"], "application/json")
    }
    
    func testQuery() {
        let operation = Query("hello", ["hey": "sup"]) {
            "string_outside"
            Field("hey", ["hey": "sup"]) {
                Field("hey", ["lala": "lala"])
                "string_inside_a_field"
            }
        }
        
        let request = graphQL.request(for: operation)
        
        XCTAssertEqual(request.httpMethod, "GET")
        
        guard let queryString = request.url?.query else {
            XCTFail("HTTP request url doesn't contain a query string")
            return
        }
        
        let expectedBody = "query=%7Bhello(hey:%20%22sup%22)%7Bstring_outside,%20hey(hey:%20%22sup%22)%7Bhey(lala:%20%22lala%22),%20string_inside_a_field%7D%7D%7D"
        
        XCTAssertEqual(queryString, expectedBody)
    }
    
    func testMutation() {
        let operation = Mutation("hello", ["hey": "sup"]) {
            "name"
            Field("hey", ["hey": "sup"]) {
                Field("hey", ["lala": "lala"])
            }
            "byebye"
        }
        
        let request = graphQL.request(for: operation)
        
        XCTAssertEqual(request.httpMethod, "POST")
        
        guard
            let httpBody = request.httpBody,
            let bodyString = String(data: httpBody, encoding: .utf8)
        else {
            XCTFail("HTTP request doesn't contain a body")
            return
        }
        
        let expectedBody = "{\n    \"query\": \"mutation { hello(hey: \\\"sup\\\"){name, hey(hey: \\\"sup\\\"){hey(lala: \\\"lala\\\")}, byebye} }\"\n}"
        
        XCTAssertEqual(bodyString, expectedBody)
    }
    
    func testQueryInheritance() {
        struct UserQuery: QueryOperation {
            struct Arguments: ArgumentListRepresentable, Encodable {
                let login: String
            }
            
            enum Fields: String {
                case name
                case id
            }
            
            var name: String = "user"
            var arguments: Arguments
            var fields: [Field]
            
            init(login: String, @Builder<Fields> fields: Builder<Fields>.Closure) {
                self.arguments = .init(login: login)
                self.fields = fields().map { $0.rawValue.fieldRepresentation }
            }
        }

        let operation = UserQuery(login: "cardoso") {
            UserQuery.Fields.name
            UserQuery.Fields.id
        }
        
        let request = graphQL.request(for: operation)
        
        XCTAssertEqual(request.httpMethod, "GET")
        
        guard let queryString = request.url?.query else {
            XCTFail("HTTP request url doesn't contain a query string")
            return
        }

        XCTAssertEqual(queryString, "query=%7Buser(login:%20%22cardoso%22)%7Bname,%20id%7D%7D")
    }

    static var allTests = [
        ("testInit", testInit),
    ]
}
