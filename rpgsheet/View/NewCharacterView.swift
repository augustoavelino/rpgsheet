//
//  NewCharacterView.swift
//  rpgsheet
//
//  Created by Augusto Avelino on 11/10/23.
//

import SwiftUI
import SwiftData

struct NewCharacterView: View {
    // MARK: Enviroment
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss
    
    // MARK: Data
    @State private var characterName: String = ""
    @State private var characterEXP: String = "0"
    @State private var selectedRace: RPGRace = .human
    @State private var selectedClass: RPGClass = .barbarian
    
    // MARK: Control
    @FocusState private var isNameFocused: Bool
    @FocusState private var isExpFocused: Bool
    @State private var shouldShowNameError: Bool = false
    
    // MARK: - View
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
            // MARK: Name input
            VStack(alignment: .leading) {
                TextField("Character Name", text: $characterName, onEditingChanged: updateNameErrorVisibility)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .focused($isNameFocused)
                
                if shouldShowNameError {
                    Text("Name should not be empty")
                        .foregroundStyle(Color.red)
                        .font(.caption)
                        .padding([.bottom, .leading], 8.0)
                }
            }
            
            // MARK: Experience input
            HStack(alignment: .center, spacing: 0.0) {
                Text("Experience")
                    .padding(.trailing, 8.0)
                
                TextField("Experience", text: expBinding)
                    .keyboardType(.numberPad)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .focused($isExpFocused)
            }
            
            // MARK: Race and class inputs
            HStack(alignment: .center) {
                Picker("Race", selection: $selectedRace) {
                    ForEach(RPGRace.allCases, id: \.self) { race in
                        Text(race.text).tag(race)
                    }
                }
                .pickerStyle(MenuPickerStyle())
                .frame(maxWidth: .infinity)
                
                Picker("Class", selection: $selectedClass) {
                    ForEach(RPGClass.allCases, id: \.self) { rpgClass in
                        Text(rpgClass.text).tag(rpgClass)
                    }
                }
                .pickerStyle(MenuPickerStyle())
                .frame(maxWidth: .infinity)
            }
            
            Spacer()
            
            // MARK: Confirmation button
            Button {
                guard !characterName.isEmpty else {
                    shouldShowNameError = true
                    return
                }
                shouldShowNameError = false
                
                modelContext.insert(RPGCharacter(name: characterName, race: selectedRace, rpgClass: selectedClass, experience: Int(characterEXP) ?? 0))
                
                dismiss()
            } label: {
                Text("Create")
            }
        }
        .padding()
        .navigationTitle("New Character")
        .toolbar {
            ToolbarItem(placement: .keyboard) {
                HStack {
                    Spacer()
                    Button("Done") {
                        isNameFocused = false
                        isExpFocused = false
                    }
                }
            }
        }
    }
    
    // MARK: Events
    
    private func updateNameErrorVisibility(_ isFocused: Bool) {
        shouldShowNameError = !isFocused && characterName.isEmpty
    }
}

#Preview {
    NewCharacterView()
}
