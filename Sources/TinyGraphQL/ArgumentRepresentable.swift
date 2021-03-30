public protocol ArgumentRepresentable {
    var argumentRepresentation: String { get }
}

extension String: ArgumentRepresentable {
    public var argumentRepresentation: String {
        return "\"\(self)\""
    }
}

extension Dictionary: ArgumentRepresentable where Key == String, Value == String {
    public var argumentRepresentation: String {
        var result = "{"
        result += self.map { "\($0.key): \"\($0.value)\"" }.joined(separator: ", ")
        result += "}"
        return result
    }
}
