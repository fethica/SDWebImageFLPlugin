// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SDWebImageFLPlugin",
    platforms: [.iOS(.v13)],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "SDWebImageFLPlugin",
            targets: ["SDWebImageFLPlugin"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        .package(
            url: "https://github.com/SDWebImage/SDWebImage.git",
            .exact("5.11.1")
        ),
        .package(
            url: "https://github.com/Flipboard/FLAnimatedImage.git",
            .exact("1.0.16")
        )
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
           name: "SDWebImageFLPlugin",
           dependencies: ["SDWebImage", "FLAnimatedImage"],
           path: "SDWebImageFLPlugin",
           exclude: [ "Module/Info.plist" ],
           sources: [ "Classes/FLAnimatedImageBridge/FLAnimatedImageView+WebCache.m", "Classes/FLAnimatedImageBridge/SDFLAnimatedImage.m" ],
           publicHeadersPath: "Module/SDWebImageFLPlugin/Module",
           cSettings: [
              .headerSearchPath("Module"),
              .headerSearchPath("Classes/FLAnimatedImageBridge")
           ]
        ),
    ]
)
