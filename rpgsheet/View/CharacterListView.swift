//
//  CharacterListView.swift
//  rpgsheet
//
//  Created by Augusto Avelino on 11/10/23.
//

import SwiftUI
import SwiftData

struct CharacterListView: View {
    @Environment(\.modelContext) private var modelContext
    @Query(sort: \RPGCharacter.name) private var characters: [RPGCharacter]

    var body: some View {
        NavigationSplitView {
            List {
                ForEach(characters) { character in
                    NavigationLink {
                        
                    } label: {
                        Text(character.name + " Lvl \(character.getLevel()) \(character.race.text) \(character.rpgClass.text)")
                    }
                }
                .onDelete(perform: deleteItems)
            }
            .toolbar {
                ToolbarItem {
                    NavigationLink(destination: NewCharacterView()) {
                        Label("New Character", systemImage: "plus")
                    }
                }
            }
            .navigationTitle("Character Sheets")
        } detail: {
            Text("Select a character")
        }
    }

    private func addItem() {
        withAnimation {
            let newItem = RPGCharacter(name: "Teste 4", race: .human, rpgClass: .bard, experience: 14000)
            modelContext.insert(newItem)
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(characters[index])
            }
        } completion: {
            modelContext.processPendingChanges()
        }
    }
}

#Preview {
    CharacterListView()
        .modelContainer(for: RPGCharacter.self, inMemory: true)
}
