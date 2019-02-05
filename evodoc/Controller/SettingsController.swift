//
//  ViewController.swift
//  EvoDoc
//
//  Created by Sergey Dunaevskiy on 26/12/2018.
//  Copyright © 2018 evodoc. All rights reserved.
//

import UIKit
import SnapKit

class SettingsController: UIViewController {
    
    var buttonLogout = UtilitiesUI.createButtonDark(title: "Logout");
    
    // ---------------------------------------------------------------------------------------------
    // Lifecycle functions
    // ---------------------------------------------------------------------------------------------
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .cyan
        self.title = "Settings";
        
        let labelToken = UILabel();
        labelToken.text = UserDefaults.standard.value(forKey: "token") as? String
        view.addSubview(labelToken)
        labelToken.snp.makeConstraints{
            make in
            make.top.equalTo(view.snp.topMargin)
            make.right.equalTo(view.snp.rightMargin)
            make.left.equalTo(view.snp.leftMargin)
        }
        
        view.addSubview(buttonLogout)
        buttonLogout.snp.makeConstraints{
            make in
            make.top.equalTo(200)
            make.right.equalTo(view.snp.rightMargin)
            make.left.equalTo(view.snp.leftMargin)
        }
        
        self.setGestures();
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Show Navbar
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
        self.navigationController?.navigationBar.topItem?.title = "Settings"
    }
    
    // ---------------------------------------------------------------------------------------------
    // Gestures
    // ---------------------------------------------------------------------------------------------
    
    func setGestures(){
        // Logout
        let gestLogout = UITapGestureRecognizer(target: self, action: #selector(self.doLogout))
        self.buttonLogout.isUserInteractionEnabled = true;
        self.buttonLogout.addGestureRecognizer(gestLogout);
    }
    
    @objc func doLogout(sender: UITapGestureRecognizer) {
        UserDefaults.standard.set(nil, forKey: "token");
        self.navigationController?.popToRootViewController(animated: true);
    }
}

