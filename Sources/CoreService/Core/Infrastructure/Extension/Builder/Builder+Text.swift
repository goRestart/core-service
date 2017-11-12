import FluentProvider

extension Builder {
  public func text(_ name: String, optional: Bool = false, unique: Bool = false, `default`: NodeRepresentable? = nil) {
    custom(name, type: "TEXT", optional: optional, unique: unique, default: `default`)
  }
}
