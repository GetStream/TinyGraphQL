import Foundation
#if canImport(FoundationNetworking)
import FoundationNetworking
#endif

public struct GraphQL {
    public var url: URL
    public var headers: [String: String]
    
    public init(url: URL, headers: [String: String] = [:]) {
        self.url = url
        self.headers = headers
    }

    public func request<O: Operation>(for operation: O) -> URLRequest {
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
}
