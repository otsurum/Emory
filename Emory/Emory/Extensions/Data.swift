//
//  Data.swift
//  Emory
//
//  Created by 鶴見駿 on 2024/12/20.
//

import SwiftUI

extension Data {
    func convertToUIImage() -> UIImage? {
        UIImage(data: self)
    }
}
