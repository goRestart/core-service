// swift-tools-version:4.0

import PackageDescription

let package = Package(
  name: "CoreService",
  products: [
    .library(
      name: "CoreService",
      targets: ["CoreService"]),
    .library(
      name: "CoreTesting",
      targets: ["CoreTesting"])
    ],
  dependencies: [
    .package(url: "https://github.com/vapor/vapor.git", .upToNextMajor(from: "2.3.0")),
    .package(url: "https://github.com/vapor/fluent-provider.git", .upToNextMajor(from: "1.3.0")),
  ],
  targets: [
    .target(
      name: "CoreService",
      dependencies: ["Vapor", "FluentProvider"]),
    .target(
      name: "CoreTesting",
      dependencies: ["Vapor", "FluentProvider", "Testing"]),
    ]
)
