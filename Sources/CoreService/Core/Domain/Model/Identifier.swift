import Foundation

public struct Identifier<Entity> {
  public let value: String
  
  public init(_ value: String) {
    self.value = value
  }
}
