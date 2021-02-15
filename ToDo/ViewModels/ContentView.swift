//
//  ContentView.swift
//  ToDo
//
//  Created by Daniel Watson on 14/02/2021.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(entity: ToDoItem.entity(), sortDescriptors: [])
    var toDos: FetchedResults<ToDoItem>
    @State var showSheet = false
    
    var body: some View {
        NavigationView {
            List{
                ForEach(toDos, id: \.self) { toDo in
                    NavigationLink(destination: DetailView(obj: toDo)) {
                        RowView(obj: toDo)
                    }
                }.onDelete(perform: delete)
            }
            .listStyle(InsetListStyle())
            .padding()
            .sheet(isPresented: $showSheet, content: {
                AddNewSheet()
            })
            .navigationBarItems(
                leading: Text("ToDo List"),
                trailing: Image(systemName: "plus")
                    .onTapGesture {
                        self.showSheet = true
            })
        }
    }
    func delete(indexSet: IndexSet) {
        for index in indexSet {
            let obj = toDos[index]
            self.moc.delete(obj)
            try? self.moc.save()
        }
    }
}

