// swift-tools-version:4.0

import PackageDescription

let package = Package(
  name: "CoreService",
  products: [
    .library(
      name: "CoreService",
      targets: ["CoreService"]),
    ],
  dependencies: [
    .package(url: "https://github.com/vapor/vapor.git", .upToNextMajor(from: "2.3.0")),
    .package(url: "https://github.com/vapor/fluent-provider.git", .upToNextMajor(from: "1.3.0"))
  ],
  targets: [
    .target(
      name: "CoreService",
      dependencies: ["Vapor", "FluentProvider"]),
    .testTarget(
      name: "CoreServiceTests",
      dependencies: ["CoreService"]),
    ]
)
