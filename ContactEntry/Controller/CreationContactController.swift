//
//  CreationContactController.swift
//  ContactEntry
//
//  Created by Stainley A Lebron R on 2023-01-10.
//

import UIKit

class CreationContactController : UIViewController {
    
    public weak var onContactDataDelegate: (any ContactDataSource)?
    
    @IBOutlet weak var firstNameText: UITextField!

    @IBOutlet weak var lastNameText: UITextField!
    
    @IBOutlet weak var phoneNumberText: UITextField!
    
    @IBOutlet weak var emailText: UITextField!
        
    @IBAction func saveContactInfo(_ sender: UIButton) {
        
        let contact: Contact = Contact(firstName: firstNameText.text ?? "", lastName: lastNameText.text ?? "", phoneNumber: phoneNumberText.text ?? "", email: emailText.text ?? "")
        
        onContactDataDelegate?.onContactDataDelegate(contact: contact)
        dismiss(animated: true)
    }
    
    override func viewDidLoad() {
        
    }
}
