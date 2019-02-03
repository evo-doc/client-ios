//
//  AuthSignInController.swift
//  EvoDoc
//
//  Created by Sergey Dunaevskiy on 03/02/2019.
//  Copyright © 2019 evodoc. All rights reserved.
//

import UIKit
import SnapKit

class AuthSignUpController: UIViewController {
    
    let authSignUpView = AuthSignUpView();
    
    override func viewDidLoad() {
        super.viewDidLoad();
        view.backgroundColor = UIPalette.background;
        
        // View
        view.addSubview(authSignUpView)
        authSignUpView.snp.makeConstraints{ (make) in
            make.edges.equalToSuperview()
        }
        self.setGestures();
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Hide Navbar
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
        // Rotation disable
        Utilities.rotationDisable()
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Rotation enable
        Utilities.rotationEnable()
    }
    
    
    // ---------------------------------------------------------------------------------------------
    // Gestures
    // ---------------------------------------------------------------------------------------------
    
    func setGestures(){
        // Sign Up
        let gestSignUp = UITapGestureRecognizer(target: self, action: #selector(self.gotoSignIn))
        self.authSignUpView.labelSignIn.isUserInteractionEnabled = true;
        self.authSignUpView.labelSignIn.addGestureRecognizer(gestSignUp);
        
        // Sign In
        let gestSignIn = UITapGestureRecognizer(target: self, action: #selector(self.sendSignUp))
        self.authSignUpView.buttonSignUp.isUserInteractionEnabled = true;
        self.authSignUpView.buttonSignUp.addGestureRecognizer(gestSignIn);
    }
    
    @objc func gotoSignIn(sender: UITapGestureRecognizer) {
        self.navigationController?.popViewController(animated: false)
    }
    
    @objc func sendSignUp(sender: UITapGestureRecognizer) {
        // TODO: Server-Client authorization
        print("Send email, username & pass")
        self.navigationController?.pushViewController(DashboardController(), animated: true)
    }
}

