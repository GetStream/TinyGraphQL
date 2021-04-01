public protocol FieldRepresentable: CustomStringConvertible {
    var fieldRepresentation: Field { get }
}

extension FieldRepresentable {
    var description: String {
        return fieldRepresentation.description
    }
    
    public var field: FieldRepresentable {
        return self
    }
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
