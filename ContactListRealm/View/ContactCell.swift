//
//  ContactCell.swift
//  ContactListRealm
//
//  Created by Val Po on 18.06.2023.
//

import SwiftUI

struct ContactCell: View {
    var contact: Contact
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(contact.firsName)
                .font(.headline)
            Text(contact.lastName)
                .font(.subheadline)
                .foregroundColor(.secondary)
        }
        .padding()
    }
}

struct ContactCell_Previews: PreviewProvider {
    static var previews: some View {
        ContactCell(contact: Contact.tempData.first!)
    }
}
