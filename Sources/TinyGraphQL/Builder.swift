protocol Builder {    
    associatedtype T
    
    typealias BuilderClosure = (Self) -> ()
    
    init()
    
    static func build(buildClosure: BuilderClosure?) -> T
    func build(buildClosure: BuilderClosure?) -> T
    
    func finish() -> T
}

extension Builder {
    static func build(buildClosure: BuilderClosure? = nil) -> T {
        return Self().build(buildClosure: buildClosure)
    }
    func build(buildClosure: BuilderClosure? = nil) -> T {
        buildClosure?(self)
        return finish()
    }
}
