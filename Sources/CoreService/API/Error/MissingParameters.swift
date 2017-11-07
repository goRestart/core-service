import HTTP

public extension Response {
  public static let missingParameters = try! Response.error(
    status: .badRequest,
    message: "Missing parameters",
    identifier: "user.error.missing_parameters"
  )
}
