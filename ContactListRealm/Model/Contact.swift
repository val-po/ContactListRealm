//
//  Contact.swift
//  ContactListRealm
//
//  Created by Val Po on 18.06.2023.
//

import RealmSwift

class Contact: Object {
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var firsName = ""
    @Persisted var lastName = ""
    
    convenience init(firsName: String, lastName: String) {
        self.init()
        self.firsName = firsName
        self.lastName = lastName
    }
    
    static var tempData: [Contact] = [
        Contact(firsName: "Jack", lastName: "Baik"),
        Contact(firsName: "Jonh", lastName: "Walker")
    ]
}
