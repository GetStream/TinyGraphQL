@_functionBuilder
public final class Builder<T> {
    public typealias Closure = () -> [T]
    static func buildBlock(_ children: T...) -> [T] {
        children
    }
}

public typealias FieldBuilder = Builder<FieldRepresentable>
