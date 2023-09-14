//
//  ImageExtention.swift
//  HIITFit
//
//  Created by metalwillhelpyou on 28.07.2023.
//

import Foundation
import SwiftUI

extension Image {
    func resizedToFill(width: CGFloat, height: CGFloat) -> some View {
        return self
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: width, height: height)
    }
    
}

extension Text {
    func raisedButtonStyle() -> some View {
        self
            .font(.body)
            .fontWeight(.bold)
    }
}
