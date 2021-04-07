protocol MutationOperation: Operation {
    
}

extension MutationOperation {
    public var type: OperationType { .mutation }
    
    public var description: String {
        return "mutation { \(parseBody()) }"
   }
}
