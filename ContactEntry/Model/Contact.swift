//
//  Contact.swift
//  ContactEntry
//
//  Created by Stainley A Lebron R on 2023-01-10.
//

import Foundation

struct Contact {
    private var id: Int = 0
    private var firstName: String
    private var lastName: String
    private var phoneNumber: String?
    private var email: String?
    
    init(firstName: String, lastName: String, phoneNumber: String? = nil, email: String? = nil) {
        self.firstName = firstName
        self.lastName = lastName
        self.phoneNumber = phoneNumber
        self.email = email
    }
      
    func getId() -> Int {
        return id
    }
    
    mutating func setId(id: Int) {
        self.id = id
    }
    
    
    func getFirstName() -> String {
        return firstName;
    }
    
    func getLastName() -> String {
        return lastName;
    }
    
    func getPhoneNumber() -> String? {
        if phoneNumber != nil {
            return phoneNumber
        }
        return nil
    }
    
    func getEmail() -> String? {
        return email != nil ? email : nil
    }
}
