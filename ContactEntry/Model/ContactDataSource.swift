//
//  OnContactDataSource.swift
//  ContactEntry
//
//  Created by Stainley A Lebron R on 2023-01-10.
//

import Foundation

protocol ContactDataSource: AnyObject {
    func onContactDataDelegate(contact: Contact)
}
