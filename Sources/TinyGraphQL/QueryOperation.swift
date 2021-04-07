public protocol QueryOperation: Operation {
    
}

extension QueryOperation {
    public var type: OperationType { .query }
}
