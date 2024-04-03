//
//  Color.swift
//  ColorSwap
//
//  Created by Michael Blades on 4/2/24.
//

import SwiftUI

struct ColorView: View {
    
    @State var mainColor: Color
    
    var body: some View {
        Button(action: {
            UIPasteboard.general.string = "R: 255 G: 0 B: 0"
        }, label: {
            VStack{
                Rectangle()
                    .foregroundColor(mainColor)
                    .aspectRatio(1.0, contentMode: .fit)
            }
        })
    }
}

#Preview {
    ColorView(mainColor: Color.red)
}
