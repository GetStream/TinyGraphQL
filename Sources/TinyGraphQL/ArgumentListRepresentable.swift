public protocol ArgumentListRepresentable {
    var argumentListRepresentation: [String: ArgumentRepresentable] { get }
}

extension Dictionary: ArgumentListRepresentable where Key == String, Value == ArgumentRepresentable {
    public var argumentListRepresentation: [String: ArgumentRepresentable] {
        return self
    }
}

extension Encodable where Self: ArgumentListRepresentable {
    public var argumentListRepresentation: [String: ArgumentRepresentable] {
        return self.arguments ?? [:]
    }
}
