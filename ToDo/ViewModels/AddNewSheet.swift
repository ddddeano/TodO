//
//  AddNewSheet.swift
//  ToDo
//
//  Created by Daniel Watson on 14/02/2021.
//

import SwiftUI
import CoreData

struct AddNewSheet: View {
    @Environment(\.managedObjectContext) var moc
    @Environment(\.presentationMode) var pm
    @State var name = ""
    var body: some View {
        VStack {
            TextField("Add New ToDo", text: $name)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            Image(systemName: "plus")
                .onTapGesture {
                    save()
                    self.pm.wrappedValue.dismiss()
            }
        }
        .navigationTitle("Add New")
    }
    func save() {
        let entity = ToDoItem(context: self.moc)
        entity.name = self.name
        try? self.moc.save()
    }
}

