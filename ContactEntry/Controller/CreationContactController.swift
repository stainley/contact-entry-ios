//
//  CreationContactController.swift
//  ContactEntry
//
//  Created by Stainley A Lebron R on 2023-01-10.
//

import UIKit

class CreationContactController : UIViewController {
        
    @IBOutlet weak var firstNameText: UITextField!

    @IBOutlet weak var lastNameText: UITextField!
    
    @IBOutlet weak var phoneNumberText: UITextField!
    
    @IBOutlet weak var emailText: UITextField!
    
    var contact: Contact?
        
    @IBAction func saveContactInfo(_ sender: UIButton) {
        
        contact = Contact(firstName: firstNameText.text ?? "", lastName: lastNameText.text ?? "", phoneNumber: phoneNumberText.text ?? "", email: emailText.text ?? "")
        
        performSegue(withIdentifier: "unwindToViewController", sender: self)

    }
    
    override func viewDidLoad() {
        guard let contact = contact else { return }
        
        firstNameText.text = contact.getFirstName()
        lastNameText.text = contact.getLastName()
        phoneNumberText.text = contact.getPhoneNumber()
        emailText.text = contact.getEmail()
    }
    
}
