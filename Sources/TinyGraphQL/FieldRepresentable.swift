public protocol FieldRepresentable: CustomStringConvertible {
    var fieldRepresentation: Field { get }
}

extension Field: FieldRepresentable {
    public var fieldRepresentation: Field {
        return self
    }
}

extension String: FieldRepresentable {
    public var fieldRepresentation: Field {
        return Field(self)
    }
}

extension Array where Element == FieldRepresentable {
    public func fieldRepresentation(name: String) -> Field {
        return Field(name: name, arguments: [:], fields: self.map { $0.fieldRepresentation })
    }
}
