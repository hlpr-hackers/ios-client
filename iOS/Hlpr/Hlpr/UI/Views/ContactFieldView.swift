//
//  ContactFieldView.swift
//  Hlpr
//
//  Created by López Torres, Oriol on 2020-04-05.
//  Copyright © 2020 Hlpr. All rights reserved.
//

import UIKit

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
    
    private var errorLabel: UILabel?
    private var textField: StyledTextField?

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
    
    func showError(_ shouldShowError: Bool) {
        errorLabel?.isHidden = !shouldShowError
        textField?.setShowingError(shouldShowError)
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

