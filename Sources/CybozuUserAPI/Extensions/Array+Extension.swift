//
//  Array+Extension.swift
//  CybozuUserAPI
//
//  Created by ky0me22 on 2025/04/10.
//

import Foundation

extension [Int] {
    var arrayString: String {
        "[" + map(\.description).joined(separator: ",") + "]"
    }
}

extension [String] {
    var arrayString: String {
        "[" + joined(separator: ",") + "]"
    }
}

extension [URLQueryItem] {
    mutating func appendQueryItem(name: String, value: String?) {
        if let value {
            append(.init(name: name, value: value))
        }
    }
}
