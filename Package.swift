// swift-tools-version:5.5
import PackageDescription

let package = Package(
    name: "feather-cli",
    platforms: [
       .macOS(.v12),
    ],
    products: [
        .executable(name: "FeatherCli", targets: ["FeatherCli"]),
    ],
    dependencies: [
        .package(url: "https://github.com/vapor/console-kit", from: "4.1.0"),
    ],
    targets: [
        .executableTarget(name: "FeatherCli", dependencies: [
            .product(name: "ConsoleKit", package: "console-kit"),
            .target(name: "FeatherCliGenerator"),
        ]),
        
        .target(name: "FeatherCliGenerator", dependencies: []),
        
        .testTarget(name: "FeatherCliGeneratorTests", dependencies: [
            .target(name: "FeatherCliGenerator"),
        ]),
    ]
)


