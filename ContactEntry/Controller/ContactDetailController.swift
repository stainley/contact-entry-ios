//
//  ContactDetailController.swift
//  ContactEntry
//
//  Created by Stainley A Lebron R on 2023-01-10.
//

import UIKit

class ContactDetailController: UIViewController {
    
    @IBOutlet weak var firstNameText: UITextField!
    @IBOutlet weak var lastNameText: UITextField!
    @IBOutlet weak var phoneNumberText: UITextField!
    @IBOutlet weak var emailText: UITextField!
    
    var contact: Contact!
    
    override func viewDidLoad() {
        
        self.firstNameText.text = contact.getFirstName()
        self.lastNameText.text = contact.getLastName()
        self.emailText.text = contact.getEmail()
        self.phoneNumberText.text = contact.getPhoneNumber()

    }
}
