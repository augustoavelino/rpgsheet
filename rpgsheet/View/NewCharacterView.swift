//
//  NewCharacterView.swift
//  rpgsheet
//
//  Created by Augusto Avelino on 11/10/23.
//

import SwiftUI
import SwiftData

struct NewCharacterView: View {
    @State private var characterName: String = ""
    @State private var characterEXP: String = "0"
    private var experience: Int { Int(characterEXP) ?? 0 }
    @State private var selectedRace: RPGRace = .human
    @State private var selectedClass: RPGClass = .barbarian
    
    @FocusState private var isExpFocused: Bool
    
    @Environment(\.dismiss) private var dismiss
    
    private let availableClasses = RPGClass.allCases
    
    var body: some View {
        let expBinding = Binding<String> {
            self.characterEXP
        } set: {
            if $0 == "0" || $0.isEmpty {
                characterEXP = "0"
            } else {
                let updatedEXP = $0.drop(while: { char in char == "0" })
                characterEXP = String(updatedEXP)
            }
        }
        
        VStack {
            HStack(alignment: .center) {
                Text("Name")
                    .padding(.trailing, 8.0)
                
                TextField("New Character", text: $characterName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            
            HStack(alignment: .center, spacing: 0.0) {
                Text("Experience")
                    .padding(.trailing, 8.0)
                
                TextField("0", text: expBinding)
                    .keyboardType(.numberPad)
                    .focused($isExpFocused)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                if isExpFocused {
                    Button("Set") {
                        isExpFocused = false
                    }
                    .padding(.leading, 8.0)
                }
            }
            
            HStack(alignment: .lastTextBaseline) {
                Text("Race")
                    .font(.headline)
                
                Spacer()
                
                Picker("Race", selection: $selectedRace) {
                    ForEach(RPGRace.allCases, id: \.self) { race in
                        Text(race.text).tag(race)
                    }
                }
                .pickerStyle(MenuPickerStyle())
            }
            
            HStack(alignment: .lastTextBaseline) {
                Text("Class")
                    .font(.headline)
                
                Spacer()
                
                Picker("Class", selection: $selectedClass) {
                    ForEach(RPGClass.allCases, id: \.self) { rpgClass in
                        Text(rpgClass.text).tag(rpgClass)
                    }
                }
                .pickerStyle(MenuPickerStyle())
            }
            
            Spacer()
            
            Button {
                // TODO: Create character here
                
                dismiss()
            } label: {
                Text("Finish")
            }

        }
        .padding()
    }
}
