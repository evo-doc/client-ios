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
        self.authSignInView.labelSignUp.isUserInteractionEnabled = true;
        self.authSignInView.labelSignUp.addGestureRecognizer(gestSignUp);
        
        // Sign In
        let gestSignIn = UITapGestureRecognizer(target: self, action: #selector(self.sendSignIn))
        self.authSignInView.buttonSignIn.isUserInteractionEnabled = true;
        self.authSignInView.buttonSignIn.addGestureRecognizer(gestSignIn);
    }
    
    @objc func gotoSignUp(sender: UITapGestureRecognizer) {
        self.navigationController?.pushViewController(AuthSignUpController(), animated: false);
    }
    
    @objc func sendSignIn(sender: UITapGestureRecognizer) {
        // TODO: Server-Client authorization
        print("Send login & pass");
        self.navigationController?.pushViewController(DashboardController(), animated: true);
    }
}

