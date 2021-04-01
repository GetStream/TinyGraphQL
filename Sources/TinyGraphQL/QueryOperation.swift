protocol QueryOperation: Operation {
    
}

extension QueryOperation {
    var type: OperationType { .query }
}
