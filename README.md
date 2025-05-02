# swift-cybozu-user-api

Providing cybozu.com User API with Swift interface.

> [!NOTE]
> This library is still in alpha.

## Requirements

- Development with Xcode 16.2+
- Written in Swift 6.0
- Compatible with iOS 17+, macOS 14+

## Supported API

| API                  | Method | Reference                                                                                          |
| :------------------- | :----- | :------------------------------------------------------------------------------------------------- |
| `fetchUsers`         | GET    | [/v1/users.json](https://kintone.dev/en/docs/common/user-api/users/get-users/)                     |
| `fetchOrganizations` | GET    | [/v1/organizations.json](https://kintone.dev/en/docs/common/user-api/departments/get-departments/) |
| `fetchGroups`        | GET    | [/v1/groups.json](https://kintone.dev/en/docs/common/user-api/groups/get-groups/)                  |

## Privacy Manifest

This library does not collect or track user information, so it does not include a PrivacyInfo.xcprivacy file.

## Demo

This repository includes demonstration app for iOS.

Open [Example/Example.xcodeproj](/Example/Example.xcodeproj) and Run it.
