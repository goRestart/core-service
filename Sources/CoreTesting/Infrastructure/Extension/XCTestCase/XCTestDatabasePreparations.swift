import XCTest
import Vapor
import FluentProvider
import Testing

public class XCTestDatabasePreparations: XCTestCase {
  
  public var database: Database!
  public var droplet: Droplet!
  
  override public func setUp() {
    super.setUp()
    Fluent.autoForeignKeys = false
    Testing.onFail = XCTFail
    
    let driver = try! MemoryDriver()
    droplet = try! Droplet.testable(with: droplet)
    database = Database(driver)
    initializeDatabase()
  }
  
  override public func tearDown() {
    super.tearDown()
    try! database.revertAll(droplet.config.preparations)
  }
  
  private func initializeDatabase() {
    try! database.prepare(droplet.config.preparations)
  }
}
