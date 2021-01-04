final class FieldBuilder: Builder {
    typealias T = Field

    var name: String = "fieldName"
    var arguments: [String: String] = [:]
    private var fields: [Field] = []
    
    func field(_ name: String, _ arguments: [String: String] = [:], _ buildClosure: ((FieldBuilder) -> Void)? = nil) {
        let builder = FieldBuilder()
        builder.name = name
        builder.arguments = arguments
        fields.append(builder.build(buildClosure: buildClosure))
    }

    func finish() -> Field {
        let field = Field(name: name, arguments: arguments, fields: fields)
        return field
    }
}
