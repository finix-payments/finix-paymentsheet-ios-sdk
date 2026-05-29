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
        .package(url: "https://github.com/finix-payments/finix-cardscanner-ios-sdk.git", branch: "main"),
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
                .product(name: "FinixCardScanSDK", package: "finix-cardscanner-ios-sdk"),
            ],
            path: "Sources/Wrapper"
        ),
    ]
)
