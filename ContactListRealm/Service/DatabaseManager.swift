//
//  DatabaseManager.swift
//  ContactListRealm
//
//  Created by Val Po on 18.06.2023.
//

import UIKit
import RealmSwift

class DatabaseManager {
    
    static let shared = DatabaseManager()
    private var realm = try! Realm()
    
    private init() {
        print(getDatabaseURL() ?? "Not found URL")
    }
    
    func getDatabaseURL() -> URL? {
        return realm.configuration.fileURL
    }
    
    func addContact(contact: Contact) {
        try! realm.write({
            realm.add(contact)
        })
    }
    
    func updateContact(oldContact: Contact, newContact: Contact) {
        try! realm.write({
            oldContact.firsName = newContact.firsName
            oldContact.lastName = newContact.lastName
        })
    }
    
    func getAllContacts() -> [Contact] {
        return Array(realm.objects(Contact.self))
    }
    
    func deleteContact(contact: Contact) {
        try! realm.write({
            realm.delete(contact)
        })
    }
}
