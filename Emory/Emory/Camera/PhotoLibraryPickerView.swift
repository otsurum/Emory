//
//  PhotoLibraryPickerView.swift
//  Emory
//
//  Created by 鶴見駿 on 2024/11/29.
//

import SwiftUI
import PhotosUI

struct PhotoLibraryPickerView: UIViewControllerRepresentable {
    @Binding var image: UIImage?
    @Environment(\.presentationMode) private var presentationMode
    
    func makeUIViewController(context: Context) -> PHPickerViewController {
        var config = PHPickerConfiguration()
        config.filter = .images
//        config.filter = .bursts
        let picker = PHPickerViewController(configuration: config)
        picker.delegate = context.coordinator
        return picker
    }
    
    func updateUIViewController(_ uiViewController: PHPickerViewController, context: Context) {}
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, PHPickerViewControllerDelegate {
        let parent: PhotoLibraryPickerView
        
        init(_ parent: PhotoLibraryPickerView) {
            self.parent = parent
        }
        
        func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
            parent.presentationMode.wrappedValue.dismiss()
            
            guard let provider = results.first?.itemProvider else { return }
            
            if provider.canLoadObject(ofClass: UIImage.self) {
                provider.loadObject(ofClass: UIImage.self) { image, _ in
                    DispatchQueue.main.async {
                        self.parent.image = image as? UIImage
                    }
                }
            }
        }
    }
}

private struct PhotoPickerView: View {
    @State var image: UIImage?
    @State private var showImagePickerDialog = false
    @State private var showCamera: Bool = false
    @State private var showLibrary: Bool = false

    var body: some View {
        VStack(spacing: 20) {
            Text("写真を追加")

            if let image {
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)

                Button("削除する") {
                    self.image = nil
                }
            } else {
                Button("選択する") {
                    showImagePickerDialog = true
                }
            }
        }
        .fullScreenCover(isPresented: $showCamera) {
            CameraCaptureView(image: $image, usingCamera: $showCamera)
                .ignoresSafeArea()
        }
        .popover(isPresented: $showLibrary, content: {
            PhotoLibraryPickerView(image: $image)
                .ignoresSafeArea()
        })
        .confirmationDialog(
            "",
            isPresented: $showImagePickerDialog,
            titleVisibility: .hidden
        ) {
            Button {
                showCamera = true
            } label: {
                Text("カメラで撮る")
            }
            Button {
                showLibrary = true
            } label: {
                Text("アルバムから選ぶ")
            }
            Button("キャンセル", role: .cancel) {
                showImagePickerDialog = false
            }
        }
    }
}

#Preview {
    PhotoPickerView()
}
