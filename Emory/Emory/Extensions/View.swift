//
//  View.swift
//  Emory
//
//  Created by 鶴見駿 on 2024/12/08.
//

import SwiftUI

extension View {
    @ViewBuilder
    func AuthErrorText(_ errorMessage: String?) -> some View {
        if let errorMessage = errorMessage {
            Text(errorMessage)
                .foregroundStyle(.red)
                .bold()
        }
    }
}
