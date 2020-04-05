//
//  AddContactInformationViewController.swift
//  Hlpr
//
//  Created by López Torres, Oriol on 2020-04-04.
//  Copyright © 2020 Hlpr. All rights reserved.
//

import UIKit
import PhoneNumberKit

class AddContactInformationViewController: StyledViewController {
    
    /// Object that stores the data for the request for help
    var requestHelp: RequestHelp
    
    init(requestHelp: RequestHelp) {
        self.requestHelp = requestHelp
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var nameField: ContactFieldView?
    var phoneField: ContactFieldView?
    var nextButton: UIButton?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let viewConfigurator = AddContactInformationViewConfigurator(view: view)
        viewConfigurator.style()
        
        nameField = viewConfigurator.nameField
        nameField?.delegate = self
        
        phoneField = viewConfigurator.phoneField
        phoneField?.delegate = self
        
        nextButton = viewConfigurator.nextButton
        nextButton?.addTarget(self, action: #selector(navigateToNextScreen), for: .touchUpInside)
        
        nameField?.becomeFirstResponder()
    }
    
    func updateNextButton() {
        nextButton?.isEnabled = allFieldsAreValid
    }
    
    private var allFieldsAreValid: Bool {
        guard let nameField = nameField, let phoneField = phoneField else {
            return false
        }
        return validateField(nameField) && validateField(phoneField)
    }
    
    var requestHelpRepository: RequestHelpRepository? = {
        return (UIApplication.shared.delegate as? AppDelegate)?.requestHelpRepository
    }()
    
    @objc func navigateToNextScreen() {
        let contact = Contact(name: nameField?.textFieldText ?? "",
                              phone: phoneField?.textFieldText ?? "")
        requestHelp.contactInformation = contact
        requestHelpRepository?.requestHelp(requestHelp, completion: { _ in
            let storyboard = UIStoryboard(name: "Confirmation", bundle: nil)
            if let viewController = storyboard.instantiateInitialViewController() {
                self.navigationController?.show(viewController, sender: self)
            }
        })
    }
}

/// Delegates
extension AddContactInformationViewController: ContactFieldViewDelegate {
    func didEndEditing(_ contactFieldView: ContactFieldView) {
        validateField(contactFieldView)
        view.endEditing(true)
        updateNextButton()
    }
    
    @discardableResult
    func validateField(_ contactFieldView: ContactFieldView) -> Bool {
        var isValid: Bool
        if contactFieldView.title == "Name" {
            isValid = contactFieldView.textFieldText?.isEmpty != true
            contactFieldView.showError(!isValid)
        } else { /// Phone
            let phoneNumberKit = PhoneNumberKit()
            let phoneNumber = try? phoneNumberKit.parse(contactFieldView.textFieldText ?? "")
            isValid = phoneNumber != nil
        }
        contactFieldView.showError(!isValid)
        return isValid
    }
}
