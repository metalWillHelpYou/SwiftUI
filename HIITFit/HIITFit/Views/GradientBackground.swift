//
//  GradientBackground.swift
//  HIITFit
//
//  Created by metalwillhelpyou on 25.08.2023.
//

import SwiftUI

struct GradientBackground: View {
    var gradient: Gradient {
        let topColor = Color("gradient-top")
        let bottomColor = Color("gradient-bottom")
        let backgroundColor = Color("background")
        return Gradient(
            stops: [
                Gradient.Stop(color: topColor, location: 0),
                Gradient.Stop(color: bottomColor, location: 0.9),
                Gradient.Stop(color: backgroundColor, location: 0.9),
                Gradient.Stop(color: backgroundColor, location: 1)
            ]) }
    var body: some View {
        LinearGradient(
            gradient: gradient,
            startPoint: .top,
            endPoint: .bottom)
        .ignoresSafeArea()
    }
}

struct GradientBackground_Previews: PreviewProvider {
    static var previews: some View {
        GradientBackground()
    }
}
