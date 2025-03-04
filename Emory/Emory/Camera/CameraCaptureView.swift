//
//  CameraCaptureView.swift
//  Emory
//
//  Created by 鶴見駿 on 2024/11/29.
//

import SwiftUI

struct CameraCaptureView: UIViewControllerRepresentable {
    @Binding var image: UIImage?
    @Binding var usingCamera: Bool
//    @Environment(\.presentationMode) private var presentationMode
    
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.sourceType = .camera
        picker.delegate = context.coordinator
        picker.allowsEditing = true
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        let parent: CameraCaptureView
        
        init(_ parent: CameraCaptureView) {
            self.parent = parent
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
            if let uiImage = info[.originalImage] as? UIImage {
                parent.image = uiImage
            }
            
            self.parent.usingCamera = false
//            parent.presentationMode.wrappedValue.dismiss()
        }
        
//        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
//            parent.presentationMode.wrappedValue.dismiss()
//        }
    }
}

//#Preview {
//    CameraCaptureView()
//}
