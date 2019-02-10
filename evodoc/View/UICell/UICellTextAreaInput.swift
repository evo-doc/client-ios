//
//  UICellTextAreaInput.swift
//  EvoDoc
//
//  Created by Tomáš Starý on 10/02/2019.
//  Copyright © 2019 evodoc. All rights reserved.
//

import UIKit

class UICellTextAreaInput: UITableViewCell {

    static let identifier = "UICellTextAreaInput"
    private var cellKey: String = "";
    private var cellValue: String = "";
    private var valueInput: UITextView!;
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.backgroundColor = .white
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setData(key: String, value: String) -> UICellTextAreaInput {
        self.cellKey = key
        self.cellValue = value
        setupView()
        return self
    }
    
    func getValue() -> String {
        return self.valueInput.text ?? ""
    }
    
    func setupView() {
        let keyLabel = UILabel()
        keyLabel.font = keyLabel.font.bold
        keyLabel.text = self.cellKey
        keyLabel.numberOfLines = 0
        
        let valueInput = UITextView()
        valueInput.text = self.cellValue
        valueInput.backgroundColor = UIColor.init(red: 0, green: 0, blue: 0, alpha: 0.03)
        valueInput.textContainerInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        valueInput.layer.cornerRadius = 10
        valueInput.layer.borderWidth = 1
        valueInput.layer.borderColor = UIColor.init(red: 0, green: 0, blue: 0, alpha: 0.1).cgColor
        valueInput.font = .systemFont(ofSize: 18)
        
        let stack = UtilitiesUI.createVerStack(views: keyLabel, valueInput)
        contentView.addSubview(stack)
        
        valueInput.snp.makeConstraints {
            make in
            make.height.equalTo(200)
        }
        
        self.valueInput = valueInput
        
        stack.spacing = 10
        stack.snp.makeConstraints{
            make in
            make.top.leading.equalToSuperview().inset(UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 0))
            make.bottom.lessThanOrEqualToSuperview().inset(5)
            make.right.equalToSuperview().inset(UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15))
        }
    }
}
