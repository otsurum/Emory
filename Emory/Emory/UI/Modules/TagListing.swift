//
//  TagListing.swift
//  Emory
//
//  Created by 鶴見駿 on 2024/11/28.
//

import SwiftUI

struct TagListing: View {
    let tagList = Post.getExamplePostObject().getTags()
    
    var body: some View {
        HStack {
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
    TagListing()
}
