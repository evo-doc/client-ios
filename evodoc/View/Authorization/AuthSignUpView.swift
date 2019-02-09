//
//  EmptyView.swift
//  EvoDoc
//
//  Created by Sergey Dunaevskiy on 03/02/2019.
//  Copyright © 2019 evodoc. All rights reserved.
//

import UIKit

class AuthSignUpView: UIView {
    // Data
    // ---------------------------------------------------------------------------------------------
    var inputEmail: UITextField!;
    var inputUsername: UITextField!;
    var inputPass: UITextField!;
    var buttonSignUp: UIButton!;
    var labelSignIn: UILabel!;
    
    // Init
    // ---------------------------------------------------------------------------------------------
    override init(frame: CGRect) {
        super.init(frame: frame);
        
        // Create items
        self.inputEmail = UtilitiesUI.createInputLight("E-mail");
        self.inputEmail.autocorrectionType = .no;
        self.inputEmail.autocapitalizationType = .none;
        self.inputUsername = UtilitiesUI.createInputLight("Username");
        self.inputUsername.autocorrectionType = .no;
        self.inputUsername.autocapitalizationType = .none;
        self.inputPass = UtilitiesUI.createInputLight("Password");
        self.inputPass.isSecureTextEntry = true;
        self.buttonSignUp = UtilitiesUI.createButtonDark(title: "Sign Up");
        self.labelSignIn = UtilitiesUI.createLabelLight("Have an account? Sign In!");
        let bg = UIImageView(image: UIImage(named: "Logotype"));
        bg.contentMode = UIView.ContentMode.scaleAspectFit;
        
        // Create stack
        let stack = UtilitiesUI.createVerStack(views:
            bg, self.inputEmail, self.inputUsername, self.inputPass, self.buttonSignUp, self.labelSignIn
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
