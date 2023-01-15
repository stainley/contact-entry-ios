//
//  ViewController.swift
//  ContactEntry
//
//  Created by Stainley A Lebron R on 2023-01-09.
//

import UIKit

class ViewController: UIViewController {
  
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableContacts: UITableView!
 
    
    var contacts: [Contact] = [Contact(firstName: "Stainley", lastName: "Lebron"), Contact(firstName: "Jothn", lastName: "Smith")]
    var filteredContact: [Contact]!
    var indexToEdit: Int = 0
 
    @IBAction func createNewContact(_ sender: UIButton) {
        
    }
    
 
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "contactDetailSegue"  {

            if let indexPath = tableContacts.indexPathForSelectedRow {
                let contactDetailDestination = segue.destination as! ContactDetailController
                
                contactDetailDestination.contact = self.filteredContact[indexPath.row]
            } else {
                let contactDetailDestination = segue.destination as! ContactDetailController
                
                //contactDetailDestination.editSaveButton.isHidden = false
                contactDetailDestination.contact = filteredContact[indexToEdit]
            }
        }
    }
    
    
    @IBAction func unwind(_ unwindSegue: UIStoryboardSegue) {
        let sourceViewController = unwindSegue.source as! CreationContactController
        // Use data from the view controller which initiated the unwind segue
        
        contacts.append(sourceViewController.contact!)
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

