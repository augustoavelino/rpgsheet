//
//  ContentView.swift
//  rpgsheet
//
//  Created by Augusto Avelino on 10/10/23.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query(sort: \Item.orderIndex) private var items: [Item]

    var body: some View {
        NavigationSplitView {
            List {
                ForEach(items) { item in
                    NavigationLink {
                        Text("Item at \(item.orderIndex) - \(item.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))")
                    } label: {
                        Text(item.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))
                    }
                }
                .onDelete(perform: deleteItems)
                .onMove(perform: moveItems)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItem {
                    Button(action: addItem) {
                        Label("Add Item", systemImage: "plus")
                    }
                }
            }
        } detail: {
            Text("Select an item")
        }
    }

    private func addItem() {
        withAnimation {
            let newItem = Item(timestamp: Date(), orderIndex: items.count)
            modelContext.insert(newItem)
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(items[index])
            }
        } completion: {
            modelContext.processPendingChanges()
            items.updateOrderIndexes()
        }
    }
    
    private func moveItems(offsets: IndexSet, newIndex: Int) {
        withAnimation {
            var updated = items
            updated.move(fromOffsets: offsets, toOffset: newIndex)
            updated.updateOrderIndexes()
        } completion: {
            modelContext.processPendingChanges()
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}

extension [Item] {
    func updateOrderIndexes() {
        for (offset, item) in enumerated() {
            item.orderIndex = offset
        }
    }
}
