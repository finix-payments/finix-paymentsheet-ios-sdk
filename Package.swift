// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "FinixPaymentSheet",
    platforms: [.iOS(.v15)],
    products: [
        .library(
            name: "FinixPaymentSheet",
            targets: ["FinixPaymentSheetWrapper"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/Datadog/dd-sdk-ios.git", exact: "3.6.1"),
    ],
    targets: [
        .binaryTarget(
            name: "FinixPaymentSheetBinary",
            path: "Sources/FinixPaymentSheet.xcframework"
        ),
        .target(
            name: "FinixPaymentSheetWrapper",
            dependencies: [
                "FinixPaymentSheetBinary",
                .product(name: "DatadogCore", package: "dd-sdk-ios"),
                .product(name: "DatadogLogs", package: "dd-sdk-ios"),
                .product(name: "DatadogCrashReporting", package: "dd-sdk-ios"),
            ],
            path: "Sources/Wrapper",
            swiftSettings: [
                .define("SPM_BUILD")
            ]
        ),
    ]
)
