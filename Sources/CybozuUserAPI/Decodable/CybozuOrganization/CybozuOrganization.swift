//
//  Organization.swift
//  CybozuUserAPI
//
//  Created by ky0me22 on 2025/05/02.
//

public struct CybozuOrganization: Sendable, Equatable {
    public var id: Int
    public var code: String
    public var name: String
    public var localName: String
    public var localNameLocale: String
    public var parentCode: String?
    public var description: String
}

extension CybozuOrganization: Decodable {
    enum CodingKeys: CodingKey {
        case id
        case code
        case name
        case localName
        case localNameLocale
        case parentCode
        case description
    }

    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.customDecode(String.self, forKey: .id) { Int($0) }
        code = try container.decode(String.self, forKey: .code)
        name = try container.decode(String.self, forKey: .name)
        localName = try container.decode(String.self, forKey: .localName)
        localNameLocale = try container.decode(String.self, forKey: .localNameLocale)
        parentCode = try container.decodeIfPresent(String.self, forKey: .parentCode)
        description = try container.decode(String.self, forKey: .description)
    }
}
