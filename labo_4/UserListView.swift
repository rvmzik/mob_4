//
//  UserListView.swift
//  labo_4
//
//  Created by Рамазан Алиев on 01.12.2024.
//

import SwiftUI
import CoreData

struct UserListView: View {
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \User.name, ascending: true)],
        animation: .default)
    private var users: FetchedResults<User>

    var body: some View {
        NavigationView {
            List {
                ForEach(users) { user in
                    Text(user.name ?? "Неизвестно")
                }
                .onDelete(perform: deleteUser)
            }
            .navigationTitle("Пользователи")
            .navigationBarItems(trailing: Button(action: addUser) {
                Image(systemName: "plus")
            })
        }
    }

    private func addUser() {
        let context = CoreDataStack.shared.context
        let newUser = User(context: context)
        newUser.name = "Новый пользователь"
        CoreDataStack.shared.saveContext()
    }

    private func deleteUser(offsets: IndexSet) {
        let context = CoreDataStack.shared.context
        offsets.map { users[$0] }.forEach(context.delete)
        CoreDataStack.shared.saveContext()
    }
}
