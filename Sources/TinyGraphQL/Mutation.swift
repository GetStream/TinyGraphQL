public struct Mutation: MutationOperation {
    public typealias Arguments = [String: ArgumentRepresentable]

    public var name: String
    public var arguments: Arguments
    public var fields: [Field]
    
    public init(
        _ name: String,
        _ arguments: Arguments,
        @FieldBuilder fields: Builder<FieldRepresentable>.Closure
    ) {
        self.name = name
        self.arguments = arguments
        self.fields = fields().map { $0.fieldRepresentation }
    }
}
