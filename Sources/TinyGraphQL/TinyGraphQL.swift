import Foundation

struct TinyGraphQL {
    let url: URL
    let headers: [String: String]
    
    init(url: URL, headers: [String: String] = [:]) {
        self.url = url
        self.headers = headers
    }

    func request(for operation: Operation) -> URLRequest {
        switch operation.type {
        case .query:
            let query = "?query={\(operation)}".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
            let url = URL(string: "\(self.url.absoluteString)\(query)")!
            var urlRequest = URLRequest(url: url)
            urlRequest.allHTTPHeaderFields = headers
            return urlRequest
        case .mutation:
            var urlRequest = URLRequest(url: url)
            urlRequest.httpMethod = "POST"
            urlRequest.httpBody = """
            {
                "query": "\(operation.description.replacingOccurrences(of: "\"", with: "\\\""))"
            }
            """.data(using: .utf8)
            urlRequest.allHTTPHeaderFields = headers
            return urlRequest
        }
    }
    
    func mutation(_ name: String, _ arguments: [String: ArgumentRepresentable], buildClosure: @escaping (OperationBuilder) -> Void) -> URLRequest {
        let builder = OperationBuilder()
        builder.type = .mutation
        builder.name = name
        builder.arguments = arguments
        return request(for: builder.build(buildClosure: buildClosure))
    }
    
    func query(_ name: String, _ arguments: [String: ArgumentRepresentable], buildClosure: @escaping (OperationBuilder) -> Void) -> URLRequest {
        let builder = OperationBuilder()
        builder.type = .query
        builder.name = name
        builder.arguments = arguments
        return request(for: builder.build(buildClosure: buildClosure))
    }
}
