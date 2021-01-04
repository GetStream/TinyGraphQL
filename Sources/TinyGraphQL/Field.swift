struct Field: CustomStringConvertible {
    var name: String
    var arguments: [String: String]
    var fields: [Field]
    
    var description: String {
        var result = "\(name)"
        
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
}
