// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Modules",
    platforms: [.iOS(.v15), .macOS(.v12)],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(name: "NetworkingClient", targets: ["NetworkingClient"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "NetworkingClient",
            dependencies: []
        ),
        .testTarget(
            name: "NetworkingClientTests",
            dependencies: ["NetworkingClient"]
        ),
    ]
)
