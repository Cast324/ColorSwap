//
//  ContentView.swift
//  ColorSwap
//
//  Created by Michael Blades on 4/2/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color.gray
                .ignoresSafeArea()
            VStack {
                ZStack {
                    VStack(spacing: 0) {
                        HStack(spacing: 0) {
                            ColorView(mainColor: .blue)
                            ColorView(mainColor: .green)
                        }
                        HStack(spacing: 0) {
                            ColorView(mainColor: .purple)
                            ColorView(mainColor: .red)
                        }
                    }
                    .clipShape(RoundedRectangle(cornerRadius: 25))
                    .listRowSpacing(0)
                    ColorView(mainColor: .yellow)
                        .frame(width: 225, height: 225)
                        .clipShape(RoundedRectangle(cornerRadius: 25))
                }
                Button(action: {
                    debugPrint("Generate")
                }, label: {
                    Text("Generate")
                })
            }
        }
    }
}

#Preview {
    ContentView()
}
