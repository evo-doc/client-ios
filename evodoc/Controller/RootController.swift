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
        
        // Check if user has token
        if let token = UserDefaults.standard.value(forKey: "token") {
            print(token)
            // Push Dashboard
            self.navigationController?.pushViewController(DashboardController(), animated: false);
        } else {
            // Push Sign In Controller
            self.navigationController?.pushViewController(self.authSignInController, animated: false)
        }
    }
    
    // ---------------------------------------------------------------------------------------------
    //
    // ---------------------------------------------------------------------------------------------
    
}

