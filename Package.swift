// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MailCore2",
    platforms: [
        .iOS(.v9), .macOS(.v10_10)
    ],
    products: [
        .library(
            name: "MailCore2",
            targets: ["MailCore2"]),
    ],
    targets: [
        .binaryTarget(name: "MailCore2",
                      url: "https://github.com/chrispatten/mailcore2/raw/master/bin/MailCore2-2025-10-28.xcframework.zip",
                      checksum: "483c4a91a6a943594ccfe35e856ecbbd3ed4e685d6ba1c738c6f7abbcb929e16")
    ]
)
