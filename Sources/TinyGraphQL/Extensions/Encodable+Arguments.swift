import Foundation

extension Encodable {
  var arguments: [String: Encodable & ArgumentRepresentable]? {
    guard let data = try? JSONEncoder().encode(self) else { return nil }
    return (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)).flatMap {
        $0 as? [String: Any]
    }?.compactMapValues { $0 as? String }.mapValues { $0 as Encodable & ArgumentRepresentable }
  }
}
