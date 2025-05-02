//
//  FetchOrganizationsView.swift
//  Example
//
//  Created by ky0me22 on 2025/05/02.
//

import CybozuUserAPI
import SwiftUI

struct FetchOrganizationsView: View {
    private var organizations: [CybozuOrganization]

    init(organizationsResponse: FetchOrganizationsResponse?) {
        organizations = organizationsResponse?.organizations ?? []
    }

    var body: some View {
        ScrollView {
            VStack(spacing: 8) {
                ForEach(organizations) { organization in
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Code: \(organization.code)")
                        Text("Name: \(organization.name)")
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .cornerRadiusBorder()
                }
            }
            .padding()
        }
        .navigationTitle("Cybozu User API (/v1/organizations.json)")
    }
}
