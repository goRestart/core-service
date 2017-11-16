import Node
import Foundation

extension StructuredData {
  public var uuid: UUID? {
    guard let stringValue = self.string, let id = UUID(uuidString: stringValue) else { return nil }
    return id
  }
}
