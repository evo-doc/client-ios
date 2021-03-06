//
//  EmptyView.swift
//  EvoDoc
//
//  Created by Sergey Dunaevskiy on 03/02/2019.
//  Copyright © 2019 evodoc. All rights reserved.
//

import UIKit

class AuthSignInView: UIView {
    // Data
    // ---------------------------------------------------------------------------------------------
    var inputLogin: UITextField!;
    var inputPass: UITextField!;
    var buttonSignIn: UIButton!;
    var labelSignUp: UILabel!;
    
    // Init
    // ---------------------------------------------------------------------------------------------
    override init(frame: CGRect) {
        super.init(frame: frame);
        
        // Create items
        self.inputLogin = UtilitiesUI.createInputLight("E-mail / Username");
        self.inputLogin.autocorrectionType = .no;
        self.inputLogin.autocapitalizationType = .none;
        self.inputPass = UtilitiesUI.createInputLight("Password");
        self.inputPass.isSecureTextEntry = true;
        self.buttonSignIn = UtilitiesUI.createButtonDark(title: "Sign In");
        self.labelSignUp = UtilitiesUI.createLabelLight("Don't have an account? Sign Up!");
        let bg = UIImageView(image: UIImage(named: "Logotype"));
        bg.contentMode = UIView.ContentMode.scaleAspectFit;
        
        // Create stack
        let stack = UtilitiesUI.createVerStack(views:
            bg, self.inputLogin, self.inputPass, self.buttonSignIn, self.labelSignUp
        );
        self.addSubview(stack)
        
        // Autolayout
        bg.snp.makeConstraints{ make in
            make.top.equalTo(self.snp.topMargin)
            make.left.equalTo(self.snp.leftMargin)
            make.right.equalTo(self.snp.rightMargin)
        }
        stack.snp.makeConstraints{ (make) in
            make.bottom.equalTo(self.snp.bottomMargin)
            make.left.equalTo(self.snp.leftMargin)
            make.right.equalTo(self.snp.rightMargin)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
