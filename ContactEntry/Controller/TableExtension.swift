//
//  TableExtension.swift
//  ContactEntry
//
//  Created by Stainley A Lebron R on 2023-01-10.
//

import UIKit



extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return contacts.count
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            tableView.beginUpdates()
            contacts.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.endUpdates()
            
            tableView.reloadData()
        } else if editingStyle == .insert {
            //TODO: create and insert new object to the array
            
        }
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "contactCel")!
        let contact = contacts[indexPath.row]
        cell.textLabel?.text = "\(contact.getFirstName() + contact.getLastName())"
        return cell
    }
    
    
}


extension ViewController: UITableViewDelegate {
    
}

