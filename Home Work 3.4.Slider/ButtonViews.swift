//
//  SwiftUIView.swift
//  Home Work 3.4.Slider
//
//  Created by Ирина on 31.01.2022.
//

import SwiftUI

struct ButtonViews: View {
    let title: String
    let action: () -> Void
    var body: some View {
        Button(action: action) {
            Text(title)
        }
    }
}
struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonViews(title: "1", action: {})
    }
}
