//
//  Array+Extension.swift
//  CybozuUserAPI
//
//  Created by ky0me22 on 2025/04/10.
//

import Foundation

extension [URLQueryItem] {
    mutating func appendQueryItem(name: String, value: String?) {
        guard let value else { return }
        append(.init(name: name, value: value))

    }

    mutating func appendQueryItems(name: String, values: [String]?) {
        guard let values else { return }
        values.enumerated().forEach { offset, value in
            append(.init(name: "\(name)[\(offset)]", value: value))
        }
    }
}
