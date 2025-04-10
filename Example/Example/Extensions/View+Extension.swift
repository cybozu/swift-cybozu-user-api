//
//  View+Extension.swift
//  Example
//
//  Created by ky0me22 on 2025/04/10.
//

import SwiftUI

extension View {
    func cornerRadiusBorder() -> some View {
        self.padding(4)
            .overlay {
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.gray)
            }
            .padding(1)
    }
}
