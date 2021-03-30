struct Query: Operation {
    var type: OperationType { .query }
    var name: String
    var arguments: [String: ArgumentRepresentable]
    var fields: [Field]
    
    init(
        _ name: String,
        _ arguments: [String: ArgumentRepresentable] = [:],
        @FieldBuilder fields: FieldBuilder.Closure
    ) {
        self.name = name
        self.arguments = arguments
        self.fields = fields().map { $0.fieldRepresentation }
    }
}
