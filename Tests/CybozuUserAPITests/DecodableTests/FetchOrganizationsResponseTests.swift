import Foundation
import Testing

@testable import CybozuUserAPI

struct FetchOrganizationsResponseTests {
    @Test
    func response_empty() throws {
        let input = """
        {
          "organizations" : []
        }
        """
        let data = try #require(input.data(using: .utf8))
        let actual = try JSONDecoder().decode(FetchOrganizationsResponse.self, from: data)
        #expect(actual == .init(organizations: []))
    }

    @Test
    func response_organization_common() async throws {
        let input = """
        {
          "organizations" : [
            {
              "id": "1",
              "code": "dummy",
              "name": "Dummy",
              "localName": "Dummy-L",
              "localNameLocale": "ja",
              "parentCode": null,
              "description": "dummy"
            }
          ]
        }   
        """
        let data = try #require(input.data(using: .utf8))
        let actual = try JSONDecoder().decode(FetchOrganizationsResponse.self, from: data)
        #expect(actual == .init(organizations: [
            .init(
                id: 1,
                code: "dummy",
                name: "Dummy",
                localName: "Dummy-L",
                localNameLocale: "ja",
                description: "dummy"
            )
        ]))
    }

    @Test
    func response_organization_has_parent() async throws {
        let input = """
        {
          "organizations" : [
            {
              "id": "1",
              "code": "dummy",
              "name": "Dummy",
              "localName": "Dummy-L",
              "localNameLocale": "ja",
              "parentCode": "parent",
              "description": "dummy"
            }
          ]
        }   
        """
        let data = try #require(input.data(using: .utf8))
        let actual = try JSONDecoder().decode(FetchOrganizationsResponse.self, from: data)
        #expect(actual == .init(organizations: [
            .init(
                id: 1,
                code: "dummy",
                name: "Dummy",
                localName: "Dummy-L",
                localNameLocale: "ja",
                parentCode: "parent",
                description: "dummy"
            )
        ]))
    }
}
