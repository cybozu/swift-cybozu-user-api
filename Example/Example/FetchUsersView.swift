//
//  FetchUsersView.swift
//  Example
//
//  Created by ky0me22 on 2025/04/10.
//

import CybozuUserAPI
import SwiftUI

struct FetchUsersView: View {
    private var users: [CybozuUser]

    init(usersResponse: FetchUsersResponse?) {
        users = usersResponse?.users ?? []
    }

    var body: some View {
        ScrollView {
            VStack(spacing: 8) {
                ForEach(users) { user in
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Code: \(user.code)")
                        Text("Name: \(user.name)")
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .cornerRadiusBorder()
                }
            }
            .padding()
        }
        .navigationTitle("Cybozu User API (/v1/users.json)")
    }
}
