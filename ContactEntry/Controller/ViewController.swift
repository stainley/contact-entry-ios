//
//  ViewController.swift
//  ContactEntry
//
//  Created by Stainley A Lebron R on 2023-01-09.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableContacts: UITableView!
    @IBOutlet weak var searchEditText: UITextField!
    
    var contacts: [Contact] = [Contact(firstName: "Stainley", lastName: "Lebron")]
    
 
    @IBAction func createNewContact(_ sender: UIButton) {
                
        let contactController: UIViewController! = storyboard?.instantiateViewController(identifier: "creationContactID")
        
        present(contactController, animated: true)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableContacts.dataSource = self
        self.tableContacts.delegate = self
        
    }


}

