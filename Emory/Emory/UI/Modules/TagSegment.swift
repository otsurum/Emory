//
//  TagSegment.swift
//  Emory
//
//  Created by 鶴見駿 on 2024/11/28.
//

import SwiftUI

struct TagSegment: View {
    let tagName: String
    
    var body: some View {
        Text(tagName)
            .padding(.vertical, 5)
            .padding(.horizontal, 15)
            .background(Color(.systemGroupedBackground))
            .cornerRadius(20)
    }
}

#Preview {
    TagSegment(tagName: "新入生")
}
