import FluentProvider

public final class TransactionHandler: Model {
  
  public let storage = Storage()
  
  public init(row: Row) throws {}
  public func makeRow() throws -> Row { return Row() }
}

// MARK: - Preparations

extension TransactionHandler: Preparation {
  public static func prepare(_ database: Database) throws {}
  public static func revert(_ database: Database) throws {}
}
