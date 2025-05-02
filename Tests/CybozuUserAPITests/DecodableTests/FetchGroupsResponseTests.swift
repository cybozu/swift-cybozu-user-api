import Foundation
import Testing

@testable import CybozuUserAPI

struct FetchGroupsResponseTests {
    @Test
    func response_empty() throws {
        let input = """
        {
          "groups" : []
        }
        """
        let data = try #require(input.data(using: .utf8))
        let actual = try JSONDecoder().decode(FetchGroupsResponse.self, from: data)
        #expect(actual == .init(groups: []))
    }

    @Test
    func response_organization_administrators() async throws {
        let input = """
        {
          "groups" : [
            {
              "id": "1",
              "code": "Administrators",
              "name": "Administrators",
              "description": null
            }
          ]
        }   
        """
        let data = try #require(input.data(using: .utf8))
        let actual = try JSONDecoder().decode(FetchGroupsResponse.self, from: data)
        #expect(actual == .init(groups: [
            .init(
                id: 1,
                code: "Administrators",
                name: "Administrators"
            )
        ]))
    }

    @Test
    func response_organization_everyone() async throws {
        let input = """
        {
          "groups" : [
            {
              "id": "1",
              "code": "everyone",
              "name": "Everyone",
              "description": null
            }
          ]
        }   
        """
        let data = try #require(input.data(using: .utf8))
        let actual = try JSONDecoder().decode(FetchGroupsResponse.self, from: data)
        #expect(actual == .init(groups: [
            .init(
                id: 1,
                code: "everyone",
                name: "Everyone"
            )
        ]))
    }

    @Test
    func response_organization_common() async throws {
        let input = """
        {
          "groups" : [
            {
              "id": "1",
              "code": "dummy",
              "name": "Dummy",
              "description": "dummy"
            }
          ]
        }   
        """
        let data = try #require(input.data(using: .utf8))
        let actual = try JSONDecoder().decode(FetchGroupsResponse.self, from: data)
        #expect(actual == .init(groups: [
            .init(
                id: 1,
                code: "dummy",
                name: "Dummy",
                description: "dummy"
            )
        ]))
    }
}
