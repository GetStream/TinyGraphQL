struct Mutation: Operation {
    var type: OperationType { .mutation }
    var name: String
    var arguments: [String: ArgumentRepresentable]
    var fields: [Field]
    
    var description: String {
        return "mutation { \(parseBody()) }"
   }
    
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
