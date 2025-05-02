//
//  User.swift
//  CybozuUserAPI
//
//  Created by ky0me22 on 2025/04/10.
//

import Foundation

public struct User: Sendable, Equatable {
    public var id: Int
    public var code: String
    public var createdAt: Date
    public var modifiedAt: Date
    public var valid: Bool
    public var name: String
    public var surname: String?
    public var givenName: String?
    public var surnameReading: String?
    public var givenNameReading: String?
    public var localName: String?
    public var localNameLocale: String?
    public var timezone: String
    public var locale: String?
    public var description: String
    public var phone: String?
    public var mobilePhone: String?
    public var extensionNumber: String?
    public var emailAddress: String?
    public var url: String?
    public var employeeNumber: String?
    public var birthDate: Date?
    public var joinDate: Date?
    public var primaryOrganizationID: Int?
    public var sortOrder: Int?
    public var customItemValues: [CustomItemValue]
}

extension User: Decodable {
    enum CodingKeys: String, CodingKey {
        case id
        case code
        case createdAt = "ctime"
        case modifiedAt = "mtime"
        case valid
        case name
        case surname = "surName"
        case givenName
        case surnameReading = "surNameReading"
        case givenNameReading
        case localName
        case localNameLocale
        case timezone
        case locale
        case description
        case phone
        case mobilePhone
        case extensionNumber
        case emailAddress = "email"
        case url
        case employeeNumber
        case birthDate
        case joinDate
        case primaryOrganizationID = "primaryOrganization"
        case sortOrder
        case customItemValues
    }

    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.customDecode(String.self, forKey: .id) { Int($0) }
        code = try container.decode(String.self, forKey: .code)
        createdAt = try container.customDecode(String.self, forKey: .createdAt) {
            DateFormatter.cybozuDateTime.date(from: $0)
        }
        modifiedAt = try container.customDecode(String.self, forKey: .modifiedAt) {
            DateFormatter.cybozuDateTime.date(from: $0)
        }
        valid = try container.decode(Bool.self, forKey: .valid)
        name = try container.decode(String.self, forKey: .name)
        surname = try container.decodeIfPresent(String.self, forKey: .surname)
        givenName = try container.decodeIfPresent(String.self, forKey: .givenName)
        surnameReading = try container.decodeIfPresent(String.self, forKey: .surnameReading)
        givenNameReading = try container.decodeIfPresent(String.self, forKey: .givenNameReading)
        localName = try container.decodeIfPresent(String.self, forKey: .localName)
        localNameLocale = try container.decodeIfPresent(String.self, forKey: .localNameLocale)
        timezone = try container.decode(String.self, forKey: .timezone)
        locale = try container.decodeIfPresent(String.self, forKey: .locale)
        description = try container.decode(String.self, forKey: .description)
        phone = try container.decodeIfPresent(String.self, forKey: .phone)
        mobilePhone = try container.decodeIfPresent(String.self, forKey: .mobilePhone)
        extensionNumber = try container.decodeIfPresent(String.self, forKey: .extensionNumber)
        emailAddress = try container.decodeIfPresent(String.self, forKey: .emailAddress)
        url = try container.decodeIfPresent(String.self, forKey: .url)
        employeeNumber = try container.decodeIfPresent(String.self, forKey: .employeeNumber)
        birthDate = try container.customDecodeIfPresent(String.self, forKey: .birthDate) {
            DateFormatter.cybozuDate.date(from: $0)
        }
        joinDate = try container.customDecodeIfPresent(String.self, forKey: .joinDate) {
            DateFormatter.cybozuDate.date(from: $0)
        }
        primaryOrganizationID = try container.customDecodeIfPresent(String.self, forKey: .primaryOrganizationID) {
            Int($0)
        }
        sortOrder = try container.decodeIfPresent(Int.self, forKey: .sortOrder)
        customItemValues = try container.decode([CustomItemValue].self, forKey: .customItemValues)
    }
}
