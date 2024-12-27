//
//  PostView.swift
//  Emory
//
//  Created by 鶴見駿 on 2024/11/27.
//

import SwiftUI

struct PostingView: View {
    @State var inputTitle = ""
    private let fontSizeOnText: CGFloat = 30
    @State var image: UIImage?
    
    @State var isSelectingImage = false
    @State var isTakingImage = false
    @State var isPushedCamera = false
    
    
    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .leading) {
                HStack {
                    TextField("タイトル", text: $inputTitle)
                        .frame(width: 200, height: 50)
                        .font(.system(size: fontSizeOnText, weight: .bold))
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.gray, lineWidth: 2)
                        )
                        .padding()
                    
                    Spacer()
                }
                
                RoundedRectangle(cornerRadius: 2)
                    .stroke(lineWidth: 1)
                    .frame(height: 50)
                    .overlay(
                        Text("タグを選択")
                    )
                    .padding()
                
                if let image {
                    HStack {
                        Spacer()
                        Image(uiImage: image)
                            .resizable(resizingMode: .stretch)
                            .aspectRatio(contentMode: .fit)
                            .clipped()
                        .padding()
                        Spacer()
                    }
                    
                    HStack {
                        Spacer()
                        Button(action: {
                            isPushedCamera = true
                        }, label: {
                            Image(systemName: "arrow.clockwise.circle")
                                .resizable()
                                .frame(width: 50, height: 50)
                                .padding()
                        })
                    }
                    
                } else {
                    Button(action: {
                        isPushedCamera = true
                    }, label: {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(lineWidth: 1.0)
                            .frame(height: 300)
                            .padding()
                            .foregroundColor(.black)
                            .overlay(
                                Image(systemName: "camera")
                                    .resizable()
                                    .scaleEffect(1/2)
                            )
                    })
                }
                
                Spacer()
            }
            .fullScreenCover(isPresented: $isTakingImage) {
                CameraCaptureView(image: $image, usingCamera: $isTakingImage)
                    .ignoresSafeArea()
            }
            .popover(isPresented: $isSelectingImage) {
                PhotoLibraryPickerView(image: $image)
            }
            .confirmationDialog("", isPresented: $isPushedCamera) {
                Button("撮影") {
                    isTakingImage = true
                }
                Button("ライブラリ") {
                    isSelectingImage = true
                }
                
                if image != nil {
                    Button("削除", role: .destructive) {
                        image = Optional.none
                        isPushedCamera = false
                    }
                }
                
                Button("閉じる", role: .cancel) {
                    isPushedCamera = false
                }
            }
        }
    }
}

#Preview {
    PostingView()
}
