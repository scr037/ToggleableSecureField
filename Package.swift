// swift-tools-version:5.4

import PackageDescription

let package = Package(
    name: "ToggleableSecureField",
    platforms: [ .iOS(.v13)],
    products: [
      .library(
          name: "ToggleableSecureField",
          targets: ["ToggleableSecureField"]
      ),
    ],
    dependencies: [
      .package(
        name: "SnapshotTesting",
        url: "https://github.com/pointfreeco/swift-snapshot-testing",
        from: "1.9.0"
      )
    ],
    targets: [
      .target(
          name: "ToggleableSecureField",
          dependencies: []
      ),
      .testTarget(
          name: "ToggleableSecureFieldTests",
          dependencies: [
            "SnapshotTesting",
            "ToggleableSecureField"
          ]
      ),
    ]
)
