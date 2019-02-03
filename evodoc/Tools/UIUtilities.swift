//
//  UIUtilities.swift
//  EvoDoc
//
//  Created by Sergey Dunaevskiy on 03/02/2019.
//  Copyright © 2019 evodoc. All rights reserved.
//

import UIKit
import SnapKit

// UI Presets
// -------------------------------------------------------------------------------------------------
class UIUtilities {
    // Horizontal Stack
    static func createHorStack(views : UIView...) -> UIStackView {
        let stack = UIStackView(arrangedSubviews: views);
        stack.axis = .horizontal;
        stack.spacing = 20;
        return stack;
    }
    
    // Vertical Stack
    static func createVerStack(views : UIView...) -> UIStackView {
        let stack = UIStackView(arrangedSubviews: views);
        stack.axis = .vertical;
        stack.spacing = 20;
        return stack;
    }
    
    // Text Input
    static func createInputLight(_ placeholder: String) -> UITextField {
        let field = UITextField();
        field.placeholder = placeholder;
        field.backgroundColor = .white;
        field.layer.cornerRadius = 30;
        field.addPadding(.both(20))
        field.snp.makeConstraints{ make in
            make.height.equalTo(60)
        }
        return field;
    }
    
    // Button
    static func createButtonDark(title: String) -> UIButton {
        let button = UIButton();
        button.setTitle(title, for: .normal)
        button.backgroundColor = UIPalette.background;
        button.layer.borderWidth = 2;
        button.layer.borderColor = UIColor.white.cgColor;
        button.layer.cornerRadius = 30;
        button.snp.makeConstraints{ make in
            make.height.equalTo(60)
        }
        return button;
    }
    
    // Label
    static func createLabelLight(_ text: String) -> UILabel {
        let label = UILabel();
        label.text = text;
        label.textAlignment = .center;
        label.textColor = .white;
        label.snp.makeConstraints{ (make) in
            make.height.equalTo(20)
        }
        return label;
    }
}


// Adding paddings to UITextField
// -------------------------------------------------------------------------------------------------
extension UITextField {
    
    enum PaddingSide {
        case left(CGFloat)
        case right(CGFloat)
        case both(CGFloat)
    }
    
    func addPadding(_ padding: PaddingSide) {
        self.leftViewMode = .always;
        self.layer.masksToBounds = true;
        
        switch padding {
            
        case .left(let spacing):
            let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: spacing, height: self.frame.height));
            self.leftView = paddingView;
            self.rightViewMode = .always;
            
        case .right(let spacing):
            let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: spacing, height: self.frame.height));
            self.rightView = paddingView;
            self.rightViewMode = .always;
            
        case .both(let spacing):
            let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: spacing, height: self.frame.height))
            self.leftView = paddingView;
            self.leftViewMode = .always;
            self.rightView = paddingView;
            self.rightViewMode = .always;
        }
    }
}
