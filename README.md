# FinixPaymentSheet iOS SDK

Binary distribution of the FinixPaymentSheet iOS SDK via Swift Package Manager.

## Installation

### Swift Package Manager

Add the following to your `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/finix-payments/finix-paymentsheet-ios-sdk.git", from: "1.0.11")
],
targets: [
    .target(
        name: "YourApp",
        dependencies: [
            .product(name: "FinixPaymentSheet", package: "finix-paymentsheet-ios-sdk")
        ]
    )
]
```

Or in Xcode:
1. File → Add Package Dependencies
2. Enter: `https://github.com/finix-payments/finix-paymentsheet-ios-sdk`
3. Select version `1.0.11` or later

## Requirements

- iOS 15.0+
- Xcode 26.6+

## Demo App

This repository contains only the pre-built binary XCFramework. For a working integration, see the
[FinixPaymentSheet demo app](https://github.com/finix-payments/FinixPaymentSheet).

## Support

- Email: developers@finixpayments.com
- Documentation: https://www.finix.com/docs/guides/payments/

## License

Apache License 2.0
