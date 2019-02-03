//
//  AuthSignInController.swift
//  EvoDoc
//
//  Created by Sergey Dunaevskiy on 03/02/2019.
//  Copyright © 2019 evodoc. All rights reserved.
//

import UIKit
import SnapKit

class AuthSignInController: UIViewController {
    
    let authSignInView = AuthSignInView();
    
    override func viewDidLoad() {
        super.viewDidLoad();
        view.backgroundColor = UIPalette.background;
        
        // View
        view.addSubview(authSignInView)
        authSignInView.snp.makeConstraints{ (make) in
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
        let gestSignUp = UITapGestureRecognizer(target: self, action: #selector(self.gotoSignUp))
        authSignInView.labelSignUp.isUserInteractionEnabled = true
        authSignInView.labelSignUp.addGestureRecognizer(gestSignUp)
        
        // Sign In
        let gestSignIn = UITapGestureRecognizer(target: self, action: #selector(self.sendSignIn))
        authSignInView.buttonSignIn.isUserInteractionEnabled = true
        authSignInView.buttonSignIn.addGestureRecognizer(gestSignIn)
    }
    
    @objc func gotoSignUp(sender: UITapGestureRecognizer) {
        print("View sign up page")
        // self.controller.navigationController?.popViewController(animated: true)
    }
    
    @objc func sendSignIn(sender: UITapGestureRecognizer) {
        print("Send login & pass")
    }
}

