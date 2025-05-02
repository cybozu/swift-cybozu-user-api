//
//  ContentView.swift
//  Example
//
//  Created by ky0me22 on 2025/04/10.
//

import CybozuUserAPI
import Observation
import SwiftUI

enum TabCategory {
    case fetchUsers
    case fetchOrganizations
    case fetchGroups
}

@MainActor @Observable final class ContentViewModel {
    var domain: String
    var loginName: String
    var password = ""
    var isPresented = false
    var tabCategory = TabCategory.fetchUsers
    var usersResponse: FetchUsersResponse?
    var organizationsResponse: FetchOrganizationsResponse?
    var groupsResponse: FetchGroupsResponse?

    var cybozuUserAPI: CybozuUserAPI {
        .init(
            authenticationMethod: .cybozuAuthorization(.init(loginName: loginName, password: password)),
            dataRequestHandler: { [domain] request in
                guard let url = request.url else { throw URLError(.badURL) }
                var request = request
                request.url = URL(string: "https://\(domain)\(url.relativeString)")
                return try await URLSession.shared.data(for: request)
            }
        )
    }

    init() {
        domain = UserDefaults.standard.string(forKey: "domain") ?? ""
        loginName = UserDefaults.standard.string(forKey: "loginName") ?? ""
    }

    func onNext() {
        UserDefaults.standard.set(domain, forKey: "domain")
        UserDefaults.standard.set(loginName, forKey: "loginName")
        isPresented = true
    }

    func onTask() async {
        do {
            usersResponse = try await cybozuUserAPI.fetchUsers()
            organizationsResponse = try await cybozuUserAPI.fetchOrganizations()
            groupsResponse = try await cybozuUserAPI.fetchGroups()
        } catch {
            print(error.localizedDescription)
        }
    }
}

struct ContentView: View {
    @State private var viewModel = ContentViewModel()

    var body: some View {
        NavigationStack {
            Form {
                Section {
                    LabeledContent {
                        TextField("subdomain.cybozu.com", text: $viewModel.domain)
                            .multilineTextAlignment(.trailing)
                            .textInputAutocapitalization(.never)
                            .autocorrectionDisabled()
                    } label: {
                        Text("Domain:")
                    }
                    LabeledContent {
                        TextField("user", text: $viewModel.loginName)
                            .multilineTextAlignment(.trailing)
                            .textInputAutocapitalization(.never)
                            .autocorrectionDisabled()
                    } label: {
                        Text("Login Name:")
                    }
                    LabeledContent {
                        SecureField("password", text: $viewModel.password)
                            .multilineTextAlignment(.trailing)
                    } label: {
                        Text("Password:")
                    }
                }
                Section {
                    LabeledContent {
                        Button {
                            viewModel.onNext()
                        } label: {
                            Text("Next")
                        }
                        .buttonStyle(.borderedProminent)
                    } label: {
                        EmptyView()
                    }
                }
            }
            .navigationTitle("Entrance")
            .navigationBarTitleDisplayMode(.inline)
            .navigationDestination(isPresented: $viewModel.isPresented) {
                TabView(selection: $viewModel.tabCategory) {
                    FetchUsersView(usersResponse: viewModel.usersResponse)
                        .tabItem {
                            Label("Users", systemImage: "person")
                        }
                        .tag(TabCategory.fetchUsers)
                    FetchOrganizationsView(organizationsResponse: viewModel.organizationsResponse)
                        .tabItem {
                            Label("Organizations", systemImage: "point.3.connected.trianglepath.dotted")
                        }
                        .tag(TabCategory.fetchOrganizations)
                    FetchGroupsView(groupsResponse: viewModel.groupsResponse)
                        .tabItem {
                            Label("Groups", systemImage: "person.3")
                        }
                        .tag(TabCategory.fetchGroups)
                }
                .task {
                    await viewModel.onTask()
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
