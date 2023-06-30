//
//  ContentView.swift
//  ContactListRealm
//
//  Created by Val Po on 18.06.2023.
//

import SwiftUI

struct ContentView: View {
    
    @State var contacts: [Contact] = []
    
    var body: some View {
        NavigationView {
            List {
                ForEach(0..<contacts.count, id:\.self) { index in
                    ContactCell(contact: contacts[index])
                        .swipeActions {
                            Button {
                                DatabaseManager.shared.deleteContact(contact: contacts[index])
                                contacts.remove(at: index)
                            } label: {
                                Text("Delete")
                            }
                            .tint(.red)
                        }
                        .swipeActions {
                            Button {
                                showAlert(isAdd: false, index: index)
                            } label: {
                                Text("Update")
                            }
                            .tint(.indigo)
                        }
                }
            }
            .navigationTitle("Contacts")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showAlert(isAdd: true)
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .onAppear {
                contacts = DatabaseManager.shared.getAllContacts()
            }
        }
    }
}

// MARK: - Add some methods
extension ContentView {
    
    func showAlert(isAdd: Bool, index: Int = 0) {
        let alertController = UIAlertController(title: isAdd ? "Add contact" : "Update contact", message: isAdd ? "Please enter your contact" : "Please update your contact", preferredStyle: .alert)
        
        alertController.addTextField { firstNameField in
            firstNameField.placeholder = isAdd ? "Enter first name" : contacts[index].firsName
        }
        
        alertController.addTextField { lastNameField in
            lastNameField.placeholder = isAdd ? "Enter last name" : contacts[index].lastName
        }
        
        let saveButton = UIAlertAction(title: isAdd ? "Save" : "Update", style: .default) { _ in
            if let firstName = alertController.textFields?.first?.text, let lastName = alertController.textFields?[1].text {
                    let contact = Contact(firsName: firstName, lastName: lastName)
                if isAdd {
                    contacts.append(contact)
                    DatabaseManager.shared.addContact(contact: contact)
                } else {
                    DatabaseManager.shared.updateContact(oldContact: contacts[index], newContact: contact)
                    contacts[index] = contact
                }
                
            }
        }
        alertController.addAction(saveButton)
        
        UIApplication.shared.keyWindow?.rootViewController?.present(alertController, animated: true)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
