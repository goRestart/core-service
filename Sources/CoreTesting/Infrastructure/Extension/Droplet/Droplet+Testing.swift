import Vapor

extension Droplet {
  public static func testable(with droplet: Droplet) throws -> Droplet {
    droplet.config.arguments = ["vapor", "--env=test"]
    return droplet
  }
}
