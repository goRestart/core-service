import Foundation

public struct Identifier<Entity> {
  public let value: String
  
  public init(_ value: String) {
    self.value = value
  }
}

// MARK: - Encodable

extension Identifier: Encodable {
  public func encode(to encoder: Encoder) throws {
    var container = encoder.singleValueContainer()
    try container.encode(value)
  }
}

extension Identifier: Decodable {
  public init(from decoder: Decoder) throws {
    value = try decoder.singleValueContainer().decode(String.self)
  }
}
