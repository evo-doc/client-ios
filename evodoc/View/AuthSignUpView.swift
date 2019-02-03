//
//  EmptyView.swift
//  EvoDoc
//
//  Created by Sergey Dunaevskiy on 03/02/2019.
//  Copyright © 2019 evodoc. All rights reserved.
//

import UIKit

class AuthSignUpView: UIView {
    
    var buttonSignUp: UIButton!;
    var labelSignIn: UILabel!;
    
    override init(frame: CGRect) {
        super.init(frame: frame);
        
        // Create items
        let email = UIUtilities.createInputLight("E-mail");
        let username = UIUtilities.createInputLight("Username");
        let pass = UIUtilities.createInputLight("Password");
        self.buttonSignUp = UIUtilities.createButtonDark(title: "Sign Up");
        self.labelSignIn = UIUtilities.createLabelLight("Have an account? Sign In!");
        let bg = UIImageView(image: UIImage(named: "Logotype"));
        bg.contentMode = UIView.ContentMode.scaleAspectFit;
        
        // Create stack
        let stack = UIUtilities.createVerStack(views:
            bg, email, username, pass, self.buttonSignUp, self.labelSignIn
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
