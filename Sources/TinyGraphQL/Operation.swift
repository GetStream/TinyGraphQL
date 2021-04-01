import Foundation

public protocol Operation: CustomStringConvertible {
    associatedtype Arguments: ArgumentListRepresentable
    
    var type: OperationType { get }
    var name: String { get }
    var arguments: Arguments { get }
    var fields: [Field] { get }
    
    var description: String { get }
}

extension Operation {
    var description: String {
        parseBody()
    }
    
    func parseBody() -> String {
        var result = name
        
        let arguments = self.arguments.argumentListRepresentation
        
        if !arguments.isEmpty {
            result += "("
            result += arguments.map { "\($0.key): \($0.value.argumentRepresentation)" }.joined(separator: ", ")
            result += ")"
        }
        
        let fields = self.fields.map { $0.field }

        if !fields.isEmpty {
            result += "{"
            result += fields.map { $0.description }.joined(separator: ", ")
            result += "}"
        }
        
        return result
    }
}
