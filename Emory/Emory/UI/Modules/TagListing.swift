//
//  TagListing.swift
//  Emory
//
//  Created by 鶴見駿 on 2024/11/28.
//

import SwiftUI

struct TagListing:  View {
    let tagList: [String]
    
    var body: some View {
        GeometryReader { geometry in
            
            LazyVGrid(columns: [GridItem(.adaptive(minimum: geometry.size.width/5))], spacing: geometry.size.width/6) {
                ForEach(tagList, id: \.self) { tag in
                    TagSegment(tagName: tag)
                        .padding()

//                        .background(Color.black)
                }
            }
            
        }
    }
}

#Preview {
    TagListing(tagList: Post.getExamplePostObject().getTags()+["情報", "工学部"])
}
