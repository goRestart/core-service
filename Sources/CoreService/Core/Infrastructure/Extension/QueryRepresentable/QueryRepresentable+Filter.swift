import Fluent

extension QueryRepresentable where Self: ExecutorRepresentable {
  public func filter(_ field: String, equals to: String) throws -> Query<Self.E> {
    let query = "LOWER(\(field)) = LOWER('\(to)')"
    return try makeQuery().filter(raw: query)
  }
  
  public func filter(_ field: String, like: String) throws -> Query<Self.E> {
    let query = "LOWER(\(field)) ILIKE LOWER('%\(like)%')"
    return try makeQuery().filter(raw: query)
  }
}
