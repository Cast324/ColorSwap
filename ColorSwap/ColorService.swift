//
//  ColorService.swift
//  ColorSwap
//
//  Created by Michael Blades on 4/3/24.
//

import Foundation
import SwiftUI

class ColorService: ObservableObject {
    
    @Published var colorScheme: ColorScheme = ColorScheme()
    
    func generateColors() {
        
        let url = URL(string: "http://colormind.io/api/")!

        let modelData = ["model": "default"]
        let jsonData = try! JSONSerialization.data(withJSONObject: modelData)

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = jsonData

        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        let session = URLSession.shared

        let task = session.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Error: \(error)")
                return
            }
            
            if let data = data {
                do {
                    let jsonResponse = try JSONDecoder().decode(ColorScheme.self, from: data)
                    DispatchQueue.main.async {
                        self.colorScheme = jsonResponse
                    }
                } catch {
                    print("Error parsing JSON: \(error)")
                }
            } else {
                print("No data received")
            }
        }
        
        task.resume()

    }
    
    func getColor(index: Int) -> Color {
        let colorData = colorScheme.result[index]
        return Color(red: colorData[0] / 255, green: colorData[1] / 255, blue: colorData[2] / 255)
    }
}

struct ColorScheme: Decodable {
    var result: [[Double]] = [[35.0, 75.0, 93.0],
                              [17.0, 180.0, 168.0],
                              [166.0, 211.0, 165.0],
                              [178.0, 145.0, 84.0],
                              [223.0, 93.0, 62.0]]
}
