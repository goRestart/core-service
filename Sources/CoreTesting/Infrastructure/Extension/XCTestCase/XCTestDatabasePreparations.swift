import XCTest
import Vapor
import FluentProvider
import Testing
import Fluent

open class XCTestDatabasePreparations: XCTestCase {
  
  public var droplet: Droplet!
  
  public func prepare(_ droplet: Droplet) {
    self.droplet = droplet
    
    Fluent.autoForeignKeys = false
    Testing.onFail = XCTFail
  }
}
