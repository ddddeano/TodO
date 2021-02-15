//
//  DetailView.swift
//  ToDo
//
//  Created by Daniel Watson on 14/02/2021.
//

import SwiftUI
import CoreData

struct DetailView: View {
    @Environment(\.presentationMode) var pm
    @Environment(\.managedObjectContext) var moc
    @State var name = ""
    @ObservedObject var obj: ToDoItem
    var body: some View {
        VStack {
            TextField("\(obj.name ?? "")", text: $name)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            Image(systemName: "pencil")
                .onTapGesture {
                    upDate()
                    self.pm.wrappedValue.dismiss()
                }
        }
        .navigationTitle("Detail/Edit")
    }
    func upDate() {
        obj.setValue(self.name, forKey: "name")
        try? self.moc.save()
    }
}
