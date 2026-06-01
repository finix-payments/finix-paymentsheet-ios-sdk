// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "FinixPaymentSheet",
    platforms: [.iOS(.v15)],
    products: [
        .library(
            name: "FinixPaymentSheet",
            targets: ["FinixPaymentSheet"]
        ),
    ],
    dependencies: [
        // CardScanner is now compiled into the PaymentSheet binary
    ],
    targets: [
        .binaryTarget(
            name: "FinixPaymentSheet",
            path: "Sources/FinixPaymentSheet.xcframework"
        ),
    ]
)
