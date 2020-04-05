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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let viewConfigurator = AddContactInformationViewConfigurator(view: view)
        viewConfigurator.style()
        
        viewConfigurator.nameField?.delegate = self
        viewConfigurator.phoneField?.delegate = self
        
        viewConfigurator.nameField?.becomeFirstResponder()
    }
}

/// Delegates
extension AddContactInformationViewController: ContactFieldViewDelegate {
    func didEndEditing(_ contactFieldView: ContactFieldView) {
        validateField(contactFieldView)
        view.endEditing(true)
    }
    
    func validateField(_ contactFieldView: ContactFieldView) {
        if contactFieldView.title == "Name" {
            contactFieldView.errorLabel?.isHidden = contactFieldView.textFieldText?.isEmpty != true
        } else if contactFieldView.title == "Phone" {
            let phoneNumberKit = PhoneNumberKit()
            let phoneNumber = try? phoneNumberKit.parse(contactFieldView.textFieldText ?? "")
            contactFieldView.errorLabel?.isHidden = phoneNumber != nil
        }
    }
}


/// View configuring

class AddContactInformationViewConfigurator {
    var view: UIView
    
    /// Views
    var nameField: ContactFieldView?
    var phoneField: ContactFieldView?
    
    init(view: UIView) {
        self.view = view
    }
    
    func style() {
        let scrollView = setUpScrollView(in: &view)
        let contentStackView = setUpContentStackView(into: scrollView)

        /// Title label
        let title = "Add contact information"
        let titleLabel = setUpTitleLabel(title: title)
        contentStackView.addArrangedSubview(titleLabel)
        
        /// Contact fields
        nameField = setUpContactField(title: "Name",
                                      placeholder: "Full name",
                                      errorText: "Input a valid name",
                                      returnKeyType: .next,
                                      keyboardType: .namePhonePad,
                                      textContentType: .givenName,
                                      autocapitalizationType: .words)
        contentStackView.addArrangedSubview(nameField!)
        
        phoneField = setUpContactField(title: "Phone",
                                       placeholder: "071 234 567",
                                       errorText: "Input a valid phone number",
                                       returnKeyType: .done,
                                       keyboardType: .phonePad,
                                       textContentType: .telephoneNumber)
        contentStackView.addArrangedSubview(phoneField!)
    }
    
    @discardableResult
    private func setUpScrollView(in view: inout UIView) -> UIScrollView {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.alwaysBounceVertical = true
        scrollView.delaysContentTouches = false
        view.addSubview(scrollView)
        
        NSLayoutConstraint.activate([
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        return scrollView
    }
    
    @discardableResult
    private func setUpContentStackView(into scrollView: UIScrollView) -> UIStackView {
        let contentStackView = UIStackView()
        contentStackView.translatesAutoresizingMaskIntoConstraints = false
        contentStackView.axis = .vertical
        contentStackView.layoutMargins = UIEdgeInsets(top: UIConstants.spacing.padding,
                                                      left: UIConstants.spacing.padding,
                                                      bottom: 0,
                                                      right: UIConstants.spacing.padding)
        contentStackView.isLayoutMarginsRelativeArrangement = true
        contentStackView.spacing = UIConstants.spacing.padding

        
        scrollView.addSubview(contentStackView)
        
        NSLayoutConstraint.activate([
            contentStackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            contentStackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentStackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentStackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentStackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor)
        ])
        
        return contentStackView
    }
    
    @discardableResult
    private func setUpTitleLabel(title: String) -> UILabel {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .title1)
        label.text = title
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
    
    @discardableResult
    private func setUpContactField(title: String,
                                   placeholder: String,
                                   errorText: String,
                                   returnKeyType: UIReturnKeyType? = nil,
                                   keyboardType: UIKeyboardType? = nil,
                                   textContentType: UITextContentType? = nil,
                                   autocapitalizationType: UITextAutocapitalizationType? = nil) -> ContactFieldView {
        let contactField = ContactFieldView(title: title,
                                            placeholder: placeholder,
                                            errorText: errorText,
                                            returnKeyType: returnKeyType,
                                            keyboardType: keyboardType,
                                            textContentType: textContentType,
                                            autocapitalizationType: autocapitalizationType)
        contactField.translatesAutoresizingMaskIntoConstraints = false
        return contactField
    }
}

protocol ContactFieldViewDelegate: class {
    func didEndEditing(_ contactFieldView: ContactFieldView)
}

class ContactFieldView: UIStackView {
    
    var title: String?
    let placeholder: String
    var textFieldText: String? {
        return textField?.text
    }
    let errorText: String
    
    var errorLabel: UILabel?
    private var textField: UITextField?

    weak var delegate: ContactFieldViewDelegate?
    
    init(title: String,
         placeholder: String,
         errorText: String,
         returnKeyType: UIReturnKeyType? = nil,
         keyboardType: UIKeyboardType? = nil,
         textContentType: UITextContentType? = nil,
         autocapitalizationType: UITextAutocapitalizationType? = nil) {
        self.title = title
        self.placeholder = placeholder
        self.errorText = errorText
        
        super.init(frame: .zero)
        
        axis = .vertical
        distribution = .fillProportionally
        translatesAutoresizingMaskIntoConstraints = false
        
        addTitleLabel()
        addTextField(returnKeyType: returnKeyType,
                     keyboardType: keyboardType,
                     textContentType: textContentType,
                     autocapitalizationType: autocapitalizationType)
        addErrorLabel()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addTitleLabel() {
        let titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = UIFont.preferredFont(forTextStyle: .caption1, compatibleWith: .current)
        titleLabel.text = title
        
        addArrangedSubview(titleLabel)
    }
    
    func addTextField(returnKeyType: UIReturnKeyType? = nil,
                      keyboardType: UIKeyboardType? = nil,
                      textContentType: UITextContentType? = nil,
                      autocapitalizationType: UITextAutocapitalizationType? = nil) {
        textField = StyledTextField(frame: .zero)
        textField?.placeholder = placeholder
        textField?.delegate = self
        
        if let returnKeyType = returnKeyType {
            textField?.returnKeyType = returnKeyType
        }
        
        if let keyboardType = keyboardType {
            textField?.keyboardType = keyboardType
        }
        
        if let textContentType = textContentType {
            textField?.textContentType = textContentType
        }
        
        if let autocapitalizationType = autocapitalizationType {
            textField?.autocapitalizationType = autocapitalizationType
        }
        
        addInputAccessoryViewToKeyboard(for: textField!)
        
        addArrangedSubview(textField!)
        
        NSLayoutConstraint.activate([
            textField!.heightAnchor.constraint(equalToConstant: 44.0)
        ])
    }
    
    func addErrorLabel() {
        errorLabel = UILabel()
        errorLabel?.translatesAutoresizingMaskIntoConstraints = false
        errorLabel?.font = UIFont.preferredFont(forTextStyle: .callout, compatibleWith: .current)
        errorLabel?.textColor = UIConstants.color.error
        errorLabel?.text = errorText
        
        addArrangedSubview(errorLabel!)
        
        errorLabel?.isHidden = true
    }
    
    private func addInputAccessoryViewToKeyboard(for textField: UITextField) {
        let keyboardToolbar = UIToolbar()
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dismissKeyboard))
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        keyboardToolbar.items = [flexSpace, doneButton]
        keyboardToolbar.sizeToFit()
        textField.inputAccessoryView = keyboardToolbar
    }
    
    @objc private func dismissKeyboard(for barButtonItem: UIBarButtonItem) {
        delegate?.didEndEditing(self)
    }
}

extension ContactFieldView: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        errorLabel?.isHidden = true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        delegate?.didEndEditing(self)
    }
}
