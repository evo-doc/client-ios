//
//  ViewController.swift
//  EvoDoc
//
//  Created by Sergey Dunaevskiy on 26/12/2018.
//  Copyright © 2018 evodoc. All rights reserved.
//

import UIKit
import SnapKit

class DashboardController: UITabBarController {
    
    // ---------------------------------------------------------------------------------------------
    // Lifecycle functions
    // ---------------------------------------------------------------------------------------------
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white;
        self.title = "EvoDoc";
        
        // Tabs
        let projectsController = ProjectsController();
        projectsController.tabBarItem.title = "Projects"
        projectsController.tabBarItem.image = UIImage(named: "projects")
        let packagesController = PackagesController();
        packagesController.tabBarItem.title = "Packages"
        packagesController.tabBarItem.image = UIImage(named: "packages")
        let documentationController = DocumentationController();
        documentationController.tabBarItem.title = "Documentation";
        documentationController.tabBarItem.image = UIImage(named: "documentation")
        let settingsController = SettingsController();
        settingsController.tabBarItem.title = "Settings"
        settingsController.tabBarItem.image = UIImage(named: "settings")
        
        // Set Tabs
        let viewControllerList = [
            projectsController,
            packagesController,
            documentationController,
            settingsController
        ]
        viewControllers = viewControllerList;
        self.selectedIndex = 2;
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Hide Navbar
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
        // Hide "Back" button
        self.navigationItem.setHidesBackButton(true, animated: animated)
    }
    
    // ---------------------------------------------------------------------------------------------
    //
    // ---------------------------------------------------------------------------------------------
    
}

