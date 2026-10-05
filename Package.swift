// swift-tools-version: 5.9
// The public package manifest. fastlane's publish_xcframework lane copies it to the root of
// finix-paymentsheet-ios-sdk next to Sources/FinixPaymentSheet.xcframework and
// Sources/FinixPaymentSheetDatadog.

import PackageDescription

let package = Package(
    name: "FinixPaymentSheet",
    platforms: [.iOS(.v15)],
    products: [
        .library(
            name: "FinixPaymentSheet",
            targets: ["FinixPaymentSheetDatadog"]
        ),
    ],
    dependencies: [
        // A range, so SPM can settle on the version an app that already uses Datadog resolves.
        .package(url: "https://github.com/DataDog/dd-sdk-ios.git", from: "3.6.1"),
    ],
    targets: [
        .binaryTarget(
            name: "FinixPaymentSheet",
            path: "Sources/FinixPaymentSheet.xcframework"
        ),
        // Compiled in the app: connects the binary to the app's single copy of Datadog.
        .target(
            name: "FinixPaymentSheetDatadog",
            dependencies: [
                "FinixPaymentSheet",
                .product(name: "DatadogCore", package: "dd-sdk-ios"),
                .product(name: "DatadogLogs", package: "dd-sdk-ios"),
                .product(name: "DatadogCrashReporting", package: "dd-sdk-ios"),
            ]
        ),
    ]
)
