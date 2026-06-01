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
        // CardScanner is now compiled into the PaymentSheet binary
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
                // CardScanner is compiled into FinixPaymentSheetBinary
            ],
            path: "Sources/Wrapper"
        ),
    ]
)
