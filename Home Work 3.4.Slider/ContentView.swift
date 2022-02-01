//
//  ContentView.swift
//  Home Work 3.4.Slider
//
//  Created by Ирина on 31.01.2022.
//

import SwiftUI

struct ContentView: View {
    @State private var currentValue = 50.0
    @State private var targetValue = Int.random(in: 0...100)
    @State private var alertPresented = false
    
    var body: some View {
        VStack {
            Text("Подвинь слайдер, как можно ближе к \(targetValue)")
                .multilineTextAlignment(.center)
            HStack {
                Text("0")
                    .padding()
                SliderView(
                    sliderValue: $currentValue,
                    alpha: .constant(CGFloat(computeScore()) / 100)
                )
    
                Text("100")
                    .padding()
            }
            ButtonViews(title: "Проверь меня!") {
                alertPresented = true
            }
            .alert(isPresented: $alertPresented) {
                Alert(title: Text("Your score"), message: Text("\(computeScore())"))
            }
            ButtonViews(title: "Начать заново") {
                reloadData()
            }
        }
    }
    private func computeScore() -> Int {
        let difference = abs(targetValue - lround(currentValue))
        return 100 - difference
    }
    
    private func reloadData() {
        let randomValue = Int.random(in: 0...100)
        targetValue = randomValue
 }
}
    
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
