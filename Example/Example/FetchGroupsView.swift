//
//  FetchGroupsView.swift
//  Example
//
//  Created by ky0me22 on 2025/05/02.
//

import CybozuUserAPI
import SwiftUI

struct FetchGroupsView: View {
    private var groups: [CybozuGroup]

    init(groupsResponse: FetchGroupsResponse?) {
        groups = groupsResponse?.groups ?? []
    }

    var body: some View {
        ScrollView {
            VStack(spacing: 8) {
                ForEach(groups) { group in
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Code: \(group.code)")
                        Text("Name: \(group.name)")
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .cornerRadiusBorder()
                }
            }
            .padding()
        }
        .navigationTitle("Cybozu User API (/v1/groups.json)")
    }
}
