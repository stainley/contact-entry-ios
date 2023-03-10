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
    
    @IBOutlet weak var loginButtonBottomConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var editSaveButton: UIButton!
    
    @IBAction func editSave(_ sender: UIButton) {
        
    }
    
    var contact: Contact!
    var editingContact: Bool = false
    
    override func viewDidLoad() {
        
        guard let contact = contact else {return}
        
        self.firstNameText.text = contact.getFirstName()
        self.lastNameText.text = contact.getLastName()
        self.emailText.text = contact.getEmail()
        self.phoneNumberText.text = contact.getPhoneNumber()

        editSaveButton.isHidden = true
        
        initialSetup()
    }
    
    func initialSetup() {
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(hideKeyboard)))
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification: )), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc private func hideKeyboard() {
        self.view.endEditing(true)
    }
    
    @objc private func keyboardWillShow(notification: NSNotification) {
        // Move the view only when the usernameTextField or the passwordTextField are being edited
        if firstNameText.isEditing || lastNameText.isEditing || phoneNumberText.isEditing || emailText.isEditing {
           moveViewWithKeyboard(notification: notification, viewBottomConstraint: self.loginButtonBottomConstraint, keyboardWillShow: true)
        }
    }
    
    @objc private func keyboardWillHide(notification: NSNotification) {
        moveViewWithKeyboard(notification: notification, viewBottomConstraint: self.loginButtonBottomConstraint, keyboardWillShow: false)
    }
    
    func moveViewWithKeyboard(notification: NSNotification, viewBottomConstraint: NSLayoutConstraint, keyboardWillShow: Bool) {
        // Keyboard's size
        guard let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else { return }
        let keyboardHeight = keyboardSize.height

        // Keyboard's animation duration
        let keyboardDuration = notification.userInfo![UIResponder.keyboardAnimationDurationUserInfoKey] as! Double
        
        // Keyboard's animation curve
        let keyboardCurve = UIView.AnimationCurve(rawValue: notification.userInfo![UIResponder.keyboardAnimationCurveUserInfoKey] as! Int)!

        // Change the constant
        if keyboardWillShow {
            let safeAreaExists = (self.view?.window?.safeAreaInsets.bottom != 0) // Check if safe area exists
            let bottomConstant: CGFloat = 20
            viewBottomConstraint.constant = keyboardHeight + (safeAreaExists ? 0 : bottomConstant)
        }else {
            viewBottomConstraint.constant = 20
        }
        
        // Animate the view the same way the keyboard animates
        let animator = UIViewPropertyAnimator(duration: keyboardDuration, curve: keyboardCurve) { [weak self] in
            // Update Constraints
            self?.view.layoutIfNeeded()
        }
        
        // Perform the animation
        animator.startAnimation()
    }
}
