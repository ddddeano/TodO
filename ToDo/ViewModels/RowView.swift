//
//  RowView.swift
//  ToDo
//
//  Created by Daniel Watson on 14/02/2021.
//

import SwiftUI
import CoreData

struct RowView: View {
    @ObservedObject var obj: ToDoItem
    var body: some View {
        Text(obj.name ?? "")
    }
}
