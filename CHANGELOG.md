# Changelog

All notable changes to FinixPaymentSheet will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

## [1.0.13] - 2026-10-30

### Changed

- Reduced verbose logging. Sensitive data (request/response bodies, full URLs, API username) no longer appears in logs. Authorization headers are redacted.
- Built with Xcode 26.3 for broader compatibility (1.0.12 required Xcode 26.6).
- XCFramework now ships its dSYMs.

### Changed (Breaking)

- Renamed 3D Secure challenge error: `FinixError.Code.ThreeDSChallengeLoadFailed` is now `ThreeDSChallengeFailed`.
- Renamed `ThreeDSErrorCode.challengeLoadFailed` to `challengeFailed` (raw value 1 unchanged).

## [1.0.12] - 2026-10-08

### Added

- Optional 3D Secure authentication after card tokenization (frictionless and challenge flows). Setup details in `3DS-INTEGRATION.md`.
- New types: `ThreeDSConfiguration`, `ThreeDSResponse`, `ThreeDSStatus`, `ThreeDSAuthenticationType`, `ThreeDSECI`, `ThreeDSFailureCode`, `ThreeDSError`, `ThreeDSErrorCode`.
- Success callbacks now deliver `PaymentSheetResponse` with `tokenizedResponse` and optional `threeDSResponse`.

### Changed

- Datadog is now a package dependency. Swift Package Manager adds `dd-sdk-ios` (3.6.1+) automatically.
- Binary no longer embeds Datadog, eliminating "Class is implemented in both" warnings for apps using Datadog.
- SDK logs to its own Datadog instance without touching the app's configuration.
- Renamed `TokenResponse` to `TokenizedResponse`. `TokenResponse` remains as a deprecated alias.

## [1.0.11] - 2026-09-15

### Added

- Distributed through Swift Package Manager from `finix-paymentsheet-ios-sdk`.
- `FinixError.logref` for quoting Finix `x-request-id` to support.
- Configurable postal code: `postalCodeFormat` (`.usZipCode` or `.international`), `postalCodeRequired`.
- Next/Done keyboard accessory buttons for field navigation.
- `PaymentSheetWithCustomNavigationBar` made public for custom `NavigationStack` integration.

### Changed

- CocoaPods no longer published. Existing Podfiles pinned to `v1.0.x` tags continue to work.
- Host app must add Datadog `dd-sdk-ios` 3.6.1 manually.

### Removed

- `FinixAPIEndpoint.QA` removed from published SDK. Use `.Sandbox` or `.Live`.

## [1.0.8] - 2026-05-20

### Fixed

- Black/white area appearing at bottom of payment sheet.
- Safe area handling for bottom button on devices with home indicator.

### Added

- iOS AutoFill support for card expiration date field (iOS 17+).

## [1.0.7] - 2026-04-15

### Changed

- Updated bankPaymentSheet errorLabel to darker color.

## [1.0.5] - 2026-03-10

### Added

- Zip/postal code field to minimal form.

## [1.0.4] - 2026-02-25

### Changed

- Allow 3 or 4 digit CVV for all card types.

## [1.0.3] - 2026-02-10

### Added

- Customizable strings for title, placeholder, and error messages.

## [1.0.2] - 2026-01-25

### Added

- Color customization support.
- Theme customization support.

## [1.0.1] - 2026-01-15

### Added

- Getting started documentation.
- HTML documentation.

## [1.0.0] - 2026-01-01

### Added

- Initial release with four payment sheet styles: complete, partial, basic, minimal.
- Address formatting with address and address ext on separate lines.
- State and zip code sharing a line.
- Test app with sheet type selection and country code support.
