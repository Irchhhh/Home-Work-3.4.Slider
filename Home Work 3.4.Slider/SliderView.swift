//
//  UISlider.swift
//  Home Work 3.4.Slider
//
//  Created by Ирина on 31.01.2022.
//

import SwiftUI

struct SliderView: UIViewRepresentable  {
    @Binding var sliderValue: Double
    @Binding var alpha: CGFloat
    
    func makeUIView(context: Context) -> UISlider {
        let slider = UISlider()
        slider.maximumValue = 0
        slider.maximumValue = 100
        slider.tintColor = .blue
        
        slider.addTarget(
            context.coordinator,
            action: #selector(Coordinator.valueChanged),
            for: .valueChanged)
        return slider
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
        sliderValue = Double((uiView.value))
        uiView.thumbTintColor = .red.withAlphaComponent(alpha)
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(sliderValue: $sliderValue, alpha: $alpha)
    }
}

extension SliderView {
    class Coordinator: NSObject {
        @Binding var sliderValue: Double
        @Binding var alpha: CGFloat
        
        init(sliderValue: Binding<Double>, alpha: Binding<CGFloat>) {
            self._sliderValue = sliderValue
            self._alpha = alpha
        }
        @objc func valueChanged(_ sender: UISlider) {
            sliderValue = Double(sender.value)
            alpha = sender.alpha
        }
    }
}

struct UISlider_Previews: PreviewProvider {
    static var previews: some View {
        SliderView(sliderValue: .constant(100), alpha: .constant(0.5))
            .padding(20.0)
    }
}
