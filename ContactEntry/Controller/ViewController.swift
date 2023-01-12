//
//  ViewController.swift
//  ContactEntry
//
//  Created by Stainley A Lebron R on 2023-01-09.
//

import UIKit

class ViewController: UIViewController, ContactDataSource {
  
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableContacts: UITableView!
 
    
    var contacts: [Contact] = [Contact(firstName: "Stainley", lastName: "Lebron"), Contact(firstName: "Jothn", lastName: "Smith")]
    var filteredContact: [Contact]!
    
 
    @IBAction func createNewContact(_ sender: UIButton) {
                
        let contactController = storyboard?.instantiateViewController(identifier: "creationContactID") as! CreationContactController
        contactController.onContactDataDelegate = self
        show(contactController,sender: nil)
        
    }
    
    func onContactDataDelegate(contact: Contact) {
        print(contact.getFirstName())
        contacts.append(contact)
        filteredContact = contacts
        tableContacts.reloadData()
         
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        filteredContact = contacts
        self.tableContacts.dataSource = self
        self.tableContacts.delegate = self
        self.searchBar.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableContacts.reloadData()
    }


}

