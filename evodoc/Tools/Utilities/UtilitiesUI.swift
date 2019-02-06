//
//  UIUtilities.swift
//  EvoDoc
//
//  Created by Sergey Dunaevskiy on 03/02/2019.
//  Copyright © 2019 evodoc. All rights reserved.
//

import UIKit
import SnapKit

class UtilitiesUI {
    // ---------------------------------------------------------------------------------------------
    // UI Stacks
    // ---------------------------------------------------------------------------------------------
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
    
    // ---------------------------------------------------------------------------------------------
    // UI Form Elements
    // ---------------------------------------------------------------------------------------------
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
        button.backgroundColor = PaletteConfig.background;
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
    
    // Text
    static func createTextDark(_ text: String) -> UILabel {
        let area = UILabel();
        area.text = text;
        area.font = UIFont(name: area.font.fontName, size: 18)
        area.textColor = PaletteConfig.textDark;
        area.lineBreakMode = .byWordWrapping;
        area.numberOfLines = 0;
        return area;
    }
    
    // Header 1
    static func createHeader1(_ text: String) -> UILabel {
        let area = UILabel();
        area.text = text;
        area.font = UIFont(name: area.font.fontName, size: 22)
        area.font = area.font.bold
        area.textColor = PaletteConfig.textDark;
        area.lineBreakMode = .byWordWrapping;
        area.numberOfLines = 0;
        return area;
    }
}


// -------------------------------------------------------------------------------------------------
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


extension UIFont {
    var bold: UIFont {
        return with(traits: .traitBold)
    } // bold
    
    var italic: UIFont {
        return with(traits: .traitItalic)
    } // italic
    
    var boldItalic: UIFont {
        return with(traits: [.traitBold, .traitItalic])
    } // boldItalic
    
    
    func with(traits: UIFontDescriptor.SymbolicTraits) -> UIFont {
        guard let descriptor = self.fontDescriptor.withSymbolicTraits(traits) else {
            return self
        } // guard
        
        return UIFont(descriptor: descriptor, size: 0)
    }
}
