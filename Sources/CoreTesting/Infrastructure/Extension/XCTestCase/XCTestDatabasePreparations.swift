import XCTest
import Vapor
import FluentProvider
import Testing

open class XCTestDatabasePreparations: XCTestCase {
  
  public var database: Database!
  public var droplet: Droplet?

  override open func setUp() {
    super.setUp()
    Fluent.autoForeignKeys = false
    Testing.onFail = XCTFail
    
    let driver = try! MemoryDriver()
    database = Database(driver)
    
    droplet?.config.arguments = ["vapor", "--env=test"]
    
    initializeDatabase()
  }
  
  override open func tearDown() {
    super.tearDown()
    guard let droplet = droplet else { return }
    try! database.revertAll(droplet.config.preparations)
  }
  
  private func initializeDatabase() {
    guard let droplet = droplet else { return }
    try! database.prepare(droplet.config.preparations)
  }
}
