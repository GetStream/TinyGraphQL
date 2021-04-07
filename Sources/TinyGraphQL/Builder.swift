@_functionBuilder
public final class Builder<T> {
    public typealias Closure = () -> [T]
    public static func buildBlock(_ children: T...) -> [T] {
        children
    }
}

public typealias FieldBuilder = Builder<FieldRepresentable>
