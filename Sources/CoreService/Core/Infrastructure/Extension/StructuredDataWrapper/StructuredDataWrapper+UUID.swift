import Node
import Foundation

extension StructuredDataWrapper {
  public var uuid: UUID? {
    guard let id = self.string else {
      return nil
    }
    return UUID(uuidString: id)
  }
}
