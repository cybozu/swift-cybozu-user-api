import Foundation
import Testing

@testable import CybozuUserAPI

struct FetchUsersResponseTests {
    @Test
    func response_empty() throws {
        let input = """
        {
          "users" : []
        }
        """
        let data = try #require(input.data(using: .utf8))
        let actual = try JSONDecoder().decode(FetchUsersResponse.self, from: data)
        #expect(actual == .init(users: []))
    }

    @Test
    func response_user_administrator() async throws {
        let input = """
        {
          "users" : [
            {
              "id" : "1",
              "code" : "Administrator",
              "ctime" : "0001-01-01T00:00:00Z",
              "mtime" : "0001-01-01T00:00:00Z",
              "valid" : false,
              "name" : "Administrator",
              "surName" : null,
              "givenName" : null,
              "surNameReading" : null,
              "givenNameReading" : null,
              "localName" : null,
              "localNameLocale" : null,
              "timezone" : "Asia/Tokyo",
              "locale" : null,
              "description" : "",
              "phone" : null,
              "mobilePhone" : null,
              "extensionNumber" : null,
              "email" : null,
              "callto" : null,
              "url" : null,
              "employeeNumber" : null,
              "birthDate" : null,
              "joinDate" : null,
              "primaryOrganization" : null,
              "sortOrder" : null,
              "customItemValues" : []
            }
          ]
        }   
        """
        let data = try #require(input.data(using: .utf8))
        let actual = try JSONDecoder().decode(FetchUsersResponse.self, from: data)
        #expect(actual == .init(users: [
            .init(
                id: 1,
                code: "Administrator",
                createdAt: .distantPast,
                modifiedAt: .distantPast,
                valid: false,
                name: "Administrator",
                timezone: "Asia/Tokyo",
                description: "",
                customItemValues: []
            )
        ]))
    }

    @Test
    func response_user_common() async throws {
        let input = """
        {
          "users" : [
            {
              "id" : "1",
              "code" : "dummy",
              "ctime" : "0001-01-01T00:00:00Z",
              "mtime" : "0001-01-01T00:00:00Z",
              "valid" : true,
              "name" : "Dummy",
              "surName" : "Dummy-S",
              "givenName" : "Dummy-G",
              "surNameReading" : "dummy-s",
              "givenNameReading" : "dummy-g",
              "localName" : "Dummy-L",
              "localNameLocale" : "ja",
              "timezone" : "Asia/Tokyo",
              "locale" : "ja",
              "description" : "dummy",
              "phone" : "0120-1234-5678",
              "mobilePhone" : "090-1234-5678",
              "extensionNumber" : "123",
              "email" : "dummy@cybozu.co.jp",
              "url" : "https://dummy.cybozu.com",
              "employeeNumber" : "001234",
              "birthDate" : "0001-01-01",
              "joinDate" : "0001-01-01",
              "primaryOrganization" : "1",
              "sortOrder" : 1,
              "customItemValues" : []
            }
          ]
        }   
        """
        let data = try #require(input.data(using: .utf8))
        let actual = try JSONDecoder().decode(FetchUsersResponse.self, from: data)
        #expect(actual == .init(users: [
            .init(
                id: 1,
                code: "dummy",
                createdAt: .distantPast,
                modifiedAt: .distantPast,
                valid: true,
                name: "Dummy",
                surname: "Dummy-S",
                givenName: "Dummy-G",
                surnameReading: "dummy-s",
                givenNameReading: "dummy-g",
                localName: "Dummy-L",
                localNameLocale: "ja",
                timezone: "Asia/Tokyo",
                locale: "ja",
                description: "dummy",
                phone: "0120-1234-5678",
                mobilePhone: "090-1234-5678",
                extensionNumber: "123",
                emailAddress: "dummy@cybozu.co.jp",
                url: "https://dummy.cybozu.com",
                employeeNumber: "001234",
                birthDate: .distantPast,
                joinDate: .distantPast,
                primaryOrganizationID: 1,
                sortOrder: 1,
                customItemValues: []
            )
        ]))
    }
}
