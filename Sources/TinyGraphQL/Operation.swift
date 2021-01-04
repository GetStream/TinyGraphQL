import Foundation

struct Operation: CustomStringConvertible {
    var type: OperationType
    var name: String
    var arguments: [String: ArgumentRepresentable]
    var fields: [Field]
    
    var description: String {
        var result = name

        if !arguments.isEmpty {
            result += "("
            result += arguments.map { "\($0.key): \($0.value.argumentRepresentation)" }.joined(separator: ", ")
            result += ")"
        }

        if !fields.isEmpty {
            result += "{"
            result += fields.map { $0.description }.joined(separator: ", ")
            result += "}"
        }
        
        switch type {
        case .query:
            return result
        case .mutation:
            return "mutation { \(result) }"
        }
    }
}
