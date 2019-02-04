//
//  ViewController.swift
//  EvoDoc
//
//  Created by Sergey Dunaevskiy on 26/12/2018.
//  Copyright © 2018 evodoc. All rights reserved.
//

import UIKit

class RootController: UIViewController {
    
    var authSignInController: AuthSignInController = AuthSignInController();
    
    // ---------------------------------------------------------------------------------------------
    // Lifecycle functions
    // ---------------------------------------------------------------------------------------------
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.title = "Root";
    
        // TODO
        // Check if
        // UserDefaults.standard.set(data.token, forKey: "token")
        // exists, if it's valid. Display signInPage/mainPage.
        
        // Push Sign In Controller
        self.navigationController?.pushViewController(self.authSignInController, animated: false)
    }
    

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Hide Navbar
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    // ---------------------------------------------------------------------------------------------
    //
    // ---------------------------------------------------------------------------------------------
    
}

