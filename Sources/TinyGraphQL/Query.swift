public struct Query: QueryOperation {
    public typealias Arguments = [String: ArgumentRepresentable]
    
    public let name: String
    public let arguments: Arguments
    public let fields: [Field]
    
    public init(
        _ name: String,
        _ arguments: Arguments,
        @Builder<FieldRepresentable> fields: Builder<FieldRepresentable>.Closure
    ) {
        self.name = name
        self.arguments = arguments
        self.fields = fields().map { $0.fieldRepresentation }
    }
}
