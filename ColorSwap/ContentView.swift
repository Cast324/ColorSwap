//
//  ContentView.swift
//  ColorSwap
//
//  Created by Michael Blades on 4/2/24.
//

import SwiftUI

struct ContentView: View {
    @State private var loading = false
    @StateObject private var colorService = ColorService()
    
    var body: some View {
        GeometryReader { proxy in
            ZStack {
                LinearGradient(
                    colors: [colorService.getColor(index: 0), colorService.getColor(index: 1)],
                    startPoint: .top,
                    endPoint: .bottom
                )
                .blur(radius: 20, opaque: true)
                .ignoresSafeArea()
                .animation(.easeOut(duration: 1), value: colorService.getColor(index: 0))
                VStack {
                    Spacer()
                    ZStack {
                        VStack(spacing: 0) {
                            HStack(spacing: 0) {
                                ColorView(colorData: colorService.colorScheme.result[0])
                                ColorView(colorData: colorService.colorScheme.result[1])
                            }
                            HStack(spacing: 0) {
                                ColorView(colorData: colorService.colorScheme.result[2])
                                ColorView(colorData: colorService.colorScheme.result[3])
                            }
                        }
                        .clipShape(RoundedRectangle(cornerRadius: 25))
                        .listRowSpacing(0)
                        ColorView(colorData: colorService.colorScheme.result[4])
                            .clipShape(RoundedRectangle(cornerRadius: 25))
                            .frame(width: proxy.size.width / 2, height: proxy.size.height / 2)
                    }
                    Spacer()
                    Button(action: {
                        loading.toggle()
                        colorService.generateColors()
                        loading.toggle()
                    }, label: {
                        ZStack {
                            Capsule()
                                .frame(height: 55)
                            HStack {
                                Text("Generate")
                                    .foregroundStyle(.black)
                                if loading {
                                    Image(systemName: "arrow.clockwise")
                                        .foregroundColor(.black)
                                }
                            }
                        }

                    })
                    .padding()
                    .tint(Color(red: 0.91, green: 0.36, blue: 0.24))
                    Spacer()
                }
            }
        }
    }
}


#Preview {
    ContentView()
}
