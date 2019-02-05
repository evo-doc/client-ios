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
        view.backgroundColor = PaletteConfig.background
        self.title = "Root";
    }
    

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Hide Navbar
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
        
        // Check if user has token and its valid
        AuthAPI.isAuthorised(callback: { value in
            if value {
                // Push Dashboard
                self.navigationController?.pushViewController(DashboardController(), animated: false);
            } else {
                // Clean token
                UserDefaults.standard.set(nil, forKey: "token")
                // Push Sign In Controller
                self.navigationController?.pushViewController(self.authSignInController, animated: false)
            }
        })
        
    }
    
    // ---------------------------------------------------------------------------------------------
    //
    // ---------------------------------------------------------------------------------------------
    
}

