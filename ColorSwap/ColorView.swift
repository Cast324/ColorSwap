//
//  Color.swift
//  ColorSwap
//
//  Created by Michael Blades on 4/2/24.
//

import SwiftUI

struct ColorView: View {
    
    var colorData : [Double]
    
    var body: some View {
        Button(action: {
            UIPasteboard.general.string = "R: \(colorData[0]) G: \(colorData[1]) B: \(colorData[2])"
        }, label: {
            VStack{
                Rectangle()
                    .foregroundColor(getColor())
                    .aspectRatio(1.0, contentMode: .fit)
                    .animation(.easeOut(duration: 1), value: getColor())
            }
        })
    }
    
    func getColor() -> Color {
        return Color(red: colorData[0] / 255, green: colorData[1] / 255, blue: colorData[2] / 255)
    }
}

#Preview {
    ColorView(colorData: [255,255,255])
}
