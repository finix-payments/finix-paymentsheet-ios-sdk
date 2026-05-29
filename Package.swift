// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "FinixPaymentSheet",
    platforms: [.iOS(.v15)],
    products: [
        .library(
            name: "FinixPaymentSheet",
            targets: ["FinixPaymentSheet", "FinixPaymentSheetDependencies"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/Datadog/dd-sdk-ios.git", exact: "3.6.1"),
    ],
    targets: [
        .binaryTarget(
            name: "FinixPaymentSheet",
            path: "Sources/FinixPaymentSheet.xcframework"
        ),
        .target(
            name: "FinixPaymentSheetDependencies",
            dependencies: [
                .product(name: "DatadogCore", package: "dd-sdk-ios"),
                .product(name: "DatadogLogs", package: "dd-sdk-ios"),
                .product(name: "DatadogCrashReporting", package: "dd-sdk-ios"),
            ],
            path: "Sources/Dependencies"
        ),
    ]
)
