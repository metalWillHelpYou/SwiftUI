//
//  RaisedButton.swift
//  HIITFit
//
//  Created by metalwillhelpyou on 24.08.2023.
//

import SwiftUI

struct RaisedButton: View {
    let buttonText: String
    let action: () -> Void
    
    var body: some View {
        Button(action: {
            action()
        }, label: {
            Text(buttonText)
                .raisedButtonStyle()
        })
        .buttonStyle(.raised)
    }
}

struct RaisedButton_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            RaisedButton(
                buttonText: "Get Started",
                action: {
                    print("dfdf")
                })
            .padding(20)
        }
        .background(Color("background"))
        .previewLayout(.sizeThatFits)
        .buttonStyle(.raised)
    }
}

struct RaisedButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(maxWidth: .infinity)
            .padding([.top, .bottom], 12)
            .background(
                Capsule()
                    .foregroundColor(Color("background"))
                    .shadow(color: Color("drop-shadow"),
                            radius: 4,
                            x: 6, y: 6)
                    .shadow(color: Color("drop-highlight"),
                            radius: 4,
                            x:  -6, y: -6)
            )
    }
}

extension ButtonStyle where Self == RaisedButtonStyle {
    static var raised: RaisedButtonStyle {
        .init()
    }
}
