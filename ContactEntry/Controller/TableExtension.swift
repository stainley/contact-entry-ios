//
//  TableExtension.swift
//  ContactEntry
//
//  Created by Stainley A Lebron R on 2023-01-10.
//

import UIKit

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
 
        return filteredContact.count
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            
            tableView.beginUpdates()
            filteredContact.remove(at: indexPath.row)
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
        let contact = filteredContact[indexPath.row]
        cell.textLabel?.text = "\(contact.getFirstName()) \(contact.getLastName())"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    
}


extension ViewController: UITableViewDelegate {
    
}


extension ViewController:  UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredContact = []
        if searchText == "" {
            filteredContact = contacts
        } else {
            for contact in contacts {
                let fullName = contact.getFirstName() + " " + contact.getLastName()
                if fullName.lowercased().contains(searchText.lowercased()) {
                    filteredContact.append(contact)
                } else if ((contact.getPhoneNumber()?.contains(searchText.lowercased())) != nil) {
                    filteredContact.append(contact)
                }
            }
        }
        
        self.tableContacts.reloadData()
    }
}

