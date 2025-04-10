//
//  DateFormatter+Extension.swift
//  CybozuUserAPI
//
//  Created by ky0me22 on 2025/04/10.
//

import Foundation

extension DateFormatter {
    static let cybozuDate: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        formatter.calendar = Calendar(identifier: .iso8601)
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        return formatter
    }()

    static let cybozuDateTime: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss'Z'"
        formatter.calendar = Calendar(identifier: .iso8601)
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        return formatter
    }()

    func date(fromOptional dateString: String?) -> Date? {
        if let dateString {
            date(from: dateString)
        } else {
            nil
        }
    }
}
