//
//  UIImage.swift
//  Emory
//
//  Created by 鶴見駿 on 2024/12/20.
//

import SwiftUI

extension UIImage {
    func convertToData() -> Data? {
        self.jpegData(compressionQuality: 0.5)
    }
}
