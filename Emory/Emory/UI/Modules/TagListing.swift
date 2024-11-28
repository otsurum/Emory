//
//  TagListing.swift
//  Emory
//
//  Created by 鶴見駿 on 2024/11/28.
//

import SwiftUI

struct TagListing: View {
    let tagList: [String]
    
    let layout = [GridItem(.adaptive(minimum: 50))]
    
    var body: some View {
        LazyVGrid(columns: layout) {
            ForEach(tagList, id: \.self) { tag in
                Button(action: {
                    
                }, label: {
                    TagSegment(tagName: tag)
                })
            }
        }
    }
}

#Preview {
    TagListing(tagList: Post.getExamplePostObject().getTags()+["情報"])
}
