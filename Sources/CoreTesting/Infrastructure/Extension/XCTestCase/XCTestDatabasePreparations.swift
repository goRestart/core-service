import XCTest
import Vapor
import FluentProvider
import Testing

public protocol TestableDroplet {
  static func testable() -> Droplet
}

extension Droplet: TestableDroplet {
  public static func testable() -> Droplet {
    fatalError("You need to return a singleton instance of the current droplet")
  }
}

open class XCTestDatabasePreparations: XCTestCase {
  
  public var database: Database!
  public var droplet: Droplet!

  override open func setUp() {
    super.setUp()
    Fluent.autoForeignKeys = false
    Testing.onFail = XCTFail
    
    let driver = try! MemoryDriver()
    database = Database(driver)
    
    droplet = Droplet.testable()
    droplet.config.arguments = ["vapor", "--env=test"]
    
    initializeDatabase()
  }
  
  override open func tearDown() {
    super.tearDown()
    try! database.revertAll(droplet.config.preparations)
  }
  
  private func initializeDatabase() {
    try! database.prepare(droplet.config.preparations)
  }
}
