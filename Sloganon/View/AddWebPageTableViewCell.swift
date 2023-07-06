//
//  CustomTableViewCell.swift
//  Sloganon
//
//  Created by Sylvia Wake-Hood on 2/15/23.
//

import UIKit

class AddWebPageTableViewCell: UITableViewCell {
    static let identifier = "AddWebPageTableViewCell"
    var color = UIColor.white
    
    //Create some tags to differentiate between textFields
    static let webPageTitleTag = 0
    static let urlTag = 1
    
    private let webPageNameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Web Page Title"
        textField.text = ""
        textField.textColor = .black
        textField.font = UIFont.systemFont(ofSize: 25.0)
        textField.backgroundColor = .white
        textField.tag = webPageTitleTag
        textField.tintColor = K.webInputCursorColor
        textField.keyboardType = .default
        textField.returnKeyType = .next
        
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    private let urlTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "https://www."
        textField.text = "https://www."
        textField.textColor = .black
        textField.font = UIFont.systemFont(ofSize: 17.0)
        textField.backgroundColor = .white
        textField.tag = urlTag
        textField.tintColor = K.webInputCursorColor
        textField.keyboardType = .URL
        textField.returnKeyType = .done
        
        textField.borderStyle = .roundedRect

        return textField
    }()
    
    //some public accessors to be able to get and set the title and URL
    var title: String{
        set { self.webPageNameTextField.text = newValue}
        get { return self.webPageNameTextField.text!}
    }
    var url: String {
        set { self.urlTextField.text = newValue}
        get { return urlTextField.text!}
    }
    
    func setColors(color: UIColor) {
        self.color = color
        self.backgroundColor = color
        self.contentView.backgroundColor = color
        self.accessoryView?.backgroundColor = color
    }
    
    func setDelegates(delegate: UITextFieldDelegate)
    {
        self.webPageNameTextField.delegate = delegate
        self.urlTextField.delegate = delegate
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let imgView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        imgView.image = UIImage(systemName: K.accessoryViewIcon.addWebInfo)
        self.accessoryView = imgView
        self.accessoryView?.tintColor = UIColor.systemGray
        setColors(color:K.CellBackgroundColor.webinfo)

        contentView.addSubview(webPageNameTextField)
        contentView.addSubview(urlTextField)
        
        let marginGuide = contentView.layoutMarginsGuide
        
        webPageNameTextField.translatesAutoresizingMaskIntoConstraints = false
        webPageNameTextField.leadingAnchor.constraint(equalTo: marginGuide.leadingAnchor).isActive = true
        webPageNameTextField.topAnchor.constraint(equalTo: marginGuide.topAnchor).isActive = true
        webPageNameTextField.heightAnchor.constraint(equalToConstant: 35.0).isActive = true
        webPageNameTextField.trailingAnchor.constraint(equalTo: marginGuide.trailingAnchor).isActive = true
        
        
        urlTextField.translatesAutoresizingMaskIntoConstraints = false
        urlTextField.leadingAnchor.constraint(equalTo: marginGuide.leadingAnchor).isActive = true
        urlTextField.heightAnchor.constraint(equalToConstant: 35.0).isActive = true
        urlTextField.trailingAnchor.constraint(equalTo: marginGuide.trailingAnchor).isActive = true
        urlTextField.bottomAnchor.constraint(equalTo: marginGuide.bottomAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        
    func darkenColor(byPercentage: CGFloat){
        let currentColor = self.color
        self.setColors(color: currentColor.darken(byPercentage: byPercentage))
    }
}
