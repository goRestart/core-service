import HTTP

public extension Response {
  public static let missingParameters = try! Response.error(
    status: .badRequest,
    message: "Missing parameters",
    identifier: "generic.error.missing_parameters"
  )
}
