protocol MutationOperation: Operation {
    
}

extension MutationOperation {
    var type: OperationType { .mutation }
    
    var description: String {
        return "mutation { \(parseBody()) }"
   }
}
