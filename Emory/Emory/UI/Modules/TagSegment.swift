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
        GeometryReader { geometry in
            VStack {
                Spacer()
                
                Capsule()
                    .stroke(Color.blue ,lineWidth: 2)
                    .frame(width: geometry.size.width, height: geometry.size.width)
//                    .frame(minWidth: geometry.size.width / 4, maxWidth: geometry.size.width, minHeight: geometry.size.width / 8, maxHeight: geometry.size.width / 2)
                    .overlay(
                        Text(tagName)
                            .foregroundStyle(Color.blue)
                            .font(.system(size: geometry.size.width / CGFloat(tagName.count) / 2, weight: .bold))
                    )
                    .position(x: geometry.size.width/2, y: geometry.size.height/2)
                
                Spacer()
            }
        }
            
    }
}

#Preview {
    TagSegment(tagName: "新入生")
}
