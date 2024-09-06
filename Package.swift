// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "NetworkSpeedTestLib",
    platforms: [
        .iOS(.v12),
    ],
    products: [
        .library(
            name: "NetworkSpeedTestLib",
            targets: ["NetworkSpeedTestLib"]),
    ],
    dependencies: [],
    targets: [
          .target(
              name: "NetworkSpeedTestLib",
              dependencies: [],
              path: "SpeedTestLib"
          )
    ]
)
