//
//  AddContactInformationViewConfigurator.swift
//  Hlpr
//
//  Created by López Torres, Oriol on 2020-04-05.
//  Copyright © 2020 Hlpr. All rights reserved.
//

import UIKit

class AddContactInformationViewConfigurator {
    var view: UIView
    
    /// Views
    var nameField: ContactFieldView?
    var phoneField: ContactFieldView?
    var nextButton: UIButton?
    
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
        
        /// Next button
        nextButton = setUpNextButton()
        nextButton?.isEnabled = false
        contentStackView.addArrangedSubview(nextButton!)
    }
    
    @discardableResult
    private func setUpNextButton() -> UIButton {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Done", for: .normal)
        button.setTitleColor(UIConstants.color.tintColor, for: .normal)
        button.setTitleColor(UIConstants.color.disabled, for: .disabled)
        button.titleLabel?.font = UIFont.preferredFont(forTextStyle: .title3)
        
        NSLayoutConstraint.activate([
            button.heightAnchor.constraint(equalToConstant: UIConstants.button.minimumHeight),
        ])
        return button
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
        label.font = UIConstants.font.title
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
