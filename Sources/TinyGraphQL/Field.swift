public struct Field {
    public var name: String
    public var arguments: [String: ArgumentRepresentable]
    public var fields: [Field]
    
    public var description: String {
        var result = name
        
        if !arguments.isEmpty {
            result += "("
            result += arguments.map { "\($0.key): \"\($0.value)\"" }.joined(separator: ", ")
            result += ")"
        }

        if !fields.isEmpty {
            result += "{"
            result += fields.map { $0.description }.joined(separator: ", ")
            result += "}"
        }
        
        return result
    }
    
    public init(
        _ name: String,
        _ arguments: [String: ArgumentRepresentable] = [:],
        @FieldBuilder _ fields: FieldBuilder.Closure = { [] }
    ) {
        self.name = name
        self.arguments = arguments
        self.fields = fields().map { $0.fieldRepresentation }
    }
    
    init(
        name: String,
        arguments: [String: ArgumentRepresentable] = [:],
        fields: [Field]
    ) {
        self.name = name
        self.arguments = arguments
        self.fields = fields
    }
}
