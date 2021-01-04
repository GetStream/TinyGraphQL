final class OperationBuilder: Builder {
    typealias T = Operation

    var type: OperationType = .query
    var name: String = "operationName"
    var arguments: [String: ArgumentRepresentable] = [:]
    var fields: [Field] = []
    
    func field(_ name: String, _ arguments: [String: String] = [:], _ buildClosure: ((FieldBuilder) -> Void)? = nil) {
        let builder = FieldBuilder()
        builder.name = name
        builder.arguments = arguments
        fields.append(builder.build(buildClosure: buildClosure))
    }

    func finish() -> Operation {
        let operation = Operation(type: type, name: name, arguments: arguments, fields: fields)
        
        return operation
    }
}
