// swift-tools-version:4.0

import PackageDescription

let package = Package(
    name: "JWTMiddleware",
    products: [
        .library(name: "JWTMiddleware", targets: ["JWTMiddleware", "JWTAuthenticatable"]),
    ],
    dependencies: [
        .package(url: "https://github.com/skelpo/vapor-request-storage.git", from: "0.3.0"),
        .package(url: "https://github.com/vibinnair/JWTVapor.git", .branch("JWKS")),
        .package(url: "https://github.com/vapor/vapor.git", from: "3.0.0"),
        .package(url: "https://github.com/vapor/auth.git", from: "2.0.0-rc")
    ],
    targets: [
        .target(name: "JWTAuthenticatable", dependencies: ["Vapor", "Authentication", "JWTVapor", "VaporRequestStorage"]),
        .target(name: "JWTMiddleware", dependencies: ["Vapor", "Authentication", "JWTVapor", "JWTAuthenticatable"]),
        .testTarget(name: "JWTMiddlewareTests", dependencies: ["JWTMiddleware"])
    ]
)
