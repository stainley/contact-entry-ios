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

    
    //MARK: swipe row functionality
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
   
        let deleteAction = UIContextualAction(style: .destructive, title: nil, handler: {(action, view, completionHandler) in
            let alertController = UIAlertController(title: "Delete", message: "Are you sure?", preferredStyle: .actionSheet)
           
                     
            alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel))
            
            alertController.addAction(UIAlertAction(title: "Yes", style: .default, handler: { action in
                tableView.beginUpdates()
                self.filteredContact.remove(at: indexPath.row)
                self.contacts.remove(at: indexPath.row)
            
                tableView.deleteRows(at: [indexPath], with: .fade)
                tableView.endUpdates()
                
                tableView.reloadData()
            }))
            self.present(alertController, animated: true)
            completionHandler(true)
        })
              
        deleteAction.image = UIImage(systemName: "trash")
        
        let edit = UIContextualAction(style: .normal, title: "Edit", handler: {(action, view, completionHandler) in
            
            self.editContact(indexPath: indexPath)
            completionHandler(true)
        })
        edit.backgroundColor = UIColor.green
        edit.image = UIImage(systemName: "square.and.pencil")
        
        return  UISwipeActionsConfiguration(actions: [deleteAction, edit])
    }
    
    
    func editContact(indexPath: IndexPath) {
        let contactDetailViewController: ContactDetailController = storyboard?.instantiateViewController(withIdentifier: "contactDetailID") as! ContactDetailController
        
        contactDetailViewController.contact = filteredContact[indexPath.row]
        present(contactDetailViewController, animated: true)
    }
  
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "contactCel")!
        let contact = filteredContact[indexPath.row]
        cell.textLabel?.text = "\(contact.getFirstName()) \(contact.getLastName())"
        
        return cell
    }
    
    
    //MARK: move to detail of the row
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "contactDetailSegue", sender: self)
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
                } else if  contact.getPhoneNumber() == searchText {
                    filteredContact.append(contact)
                } else if contact.getEmail() == searchText.lowercased() {
                    filteredContact.append(contact)
                }
            }
        }
        
        self.tableContacts.reloadData()
    }
}

