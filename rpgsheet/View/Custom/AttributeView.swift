//
//  AttributeView.swift
//  rpgsheet
//
//  Created by Augusto Avelino on 13/10/23.
//

import SwiftUI
import SwiftData

struct AttributeView: View {
    @State var attribute: RPGAttribute
    @Binding var valueText: String
    @FocusState var isFocused: Bool
    
    private var labelText: String { attribute.text.uppercased() }
    private var placeholder: String { labelText.abbreviated(3) }
    private var modifier: Int { RPGAttribute.modifier(for: value) }
    
    private var value: Int { Int(valueText) ?? 0 }
    
    var body: some View {
        VStack {
            Text(labelText)
                .font(.caption)
                .fontWeight(.bold)
            TextField(placeholder, text: $valueText)
                .focused($isFocused)
                .font(.title3)
                .keyboardType(.numberPad)
                .multilineTextAlignment(.center)
            Text(modifier >= 0 ? "+\(modifier)" : "\(modifier)")
                .font(.callout)
                .fontWeight(.heavy)
        }
    }
}

#Preview {
    NewCharacterView()
}

