struct Mutation: MutationOperation {
    typealias Arguments = [String: ArgumentRepresentable]

    let name: String
    let arguments: Arguments
    let fields: [Field]
    
    init(
        _ name: String,
        _ arguments: Arguments,
        @FieldBuilder fields: Builder<FieldRepresentable>.Closure
    ) {
        self.name = name
        self.arguments = arguments
        self.fields = fields().map { $0.fieldRepresentation }
    }
}
