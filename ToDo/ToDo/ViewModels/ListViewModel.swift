//
//  ListViewModel.swift
//  ToDo
//
//  Created by metalWillHelpYou on 01.05.2024.
//

import Foundation

/*
 CRUD funcs
 
 CREATE
 READ
 UPDATE
 DELETE
 
*/

class ListViewModel: ObservableObject {
    @Published var items: [ItemModel] = [] {
        didSet {
            saveItems()
        }
    }
    let itemsKey = "items_list"
    
    init() {
        getItems()
    }
    
    func getItems() {
        guard 
            let data = UserDefaults.standard.data(forKey: itemsKey),
            let savedItems = try? JSONDecoder().decode([ItemModel].self, from: data)
        else { return }
        
        self.items = savedItems
    }
    
    func addItem(title: String) {
        let newItem = ItemModel(title: title, isCompleted: false)
        items.append(newItem)
    }
    
    func moveItem(from: IndexSet, to: Int) {
        items.move(fromOffsets: from, toOffset: to)
    }
    
    func updateItem(item: ItemModel) {
        if let index = items.firstIndex(where: { $0.id == item.id } ) {
            items[index] = item.updateCompletion()
        }
    }
    
    func deleteItems(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }
    
    func saveItems() {
        if let encodedData = try? JSONEncoder().encode(items) {
            UserDefaults.standard.set(encodedData, forKey: itemsKey)
        }
    }
}
