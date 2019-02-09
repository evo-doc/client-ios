//
//  ProfileEditController.swift
//  EvoDoc
//
//  Created by Sergey Dunaevskiy on 07/02/2019.
//  Copyright © 2019 evodoc. All rights reserved.
//


import UIKit
import SnapKit

class SecurityController: UIViewController {
    
    // ---------------------------------------------------------------------------------------------
    // Data
    // ---------------------------------------------------------------------------------------------
    
    var tableView: UITableView!
    
    // ---------------------------------------------------------------------------------------------
    // Lifecycle functions
    // ---------------------------------------------------------------------------------------------
    
    override func loadView() {
        super.loadView()
        self.title = "Security"
        
        let tableView = UITableView(frame: .zero, style: .grouped)
        view.addSubview(tableView);
        tableView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        tableView.allowsSelection = false;
        tableView.backgroundColor = .white
        tableView.allowsMultipleSelection = false
        tableView.separatorStyle = .none
        self.tableView = tableView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set data source
        tableView.dataSource = self
        tableView.delegate = self
        
        // Register all cell types used in table
        tableView.register(UICellTitleInput.self, forCellReuseIdentifier: UICellTitleInput.identifier)
        
        ProfileAPI.getProfile {
            data in
            SecurityModel.cells.removeAll();
            
            let oldPassword = UICellTitleInput().setData(key: "Old password", value: "");
            oldPassword.isHidden(true);
            SecurityModel.cells.append(oldPassword);
            
            let oldPasswordNotes = UICellNotes().setData(value: "Your current password.");
            SecurityModel.cells.append(oldPasswordNotes);
            
            let newPassword = UICellTitleInput().setData(key: "New password", value: "");
            newPassword.isHidden(true);
            SecurityModel.cells.append(newPassword);
            
            let newPasswordNotes = UICellNotes().setData(value: "A password should have at least one uppercase, one lowercase and one number.");
            SecurityModel.cells.append(newPasswordNotes);
            
            let repeatPassword = UICellTitleInput().setData(key: "Repeat password", value: "");
            repeatPassword.isHidden(true);
            SecurityModel.cells.append(repeatPassword);
            
            let repeatPasswordNotes = UICellNotes().setData(value: "Repeat your new password.");
            SecurityModel.cells.append(repeatPasswordNotes);
            
            self.tableView.reloadData()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Show Navbar
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
        
        navigationItem.rightBarButtonItem =
            UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(self.saveData))
    }
    
    // ---------------------------------------------------------------------------------------------
    // Gestures
    // ---------------------------------------------------------------------------------------------
    
    @objc func saveData(){
        
        let oldPassword = (SecurityModel.cells[0] as! UICellTitleInput).getValue();
        let newPassword = (SecurityModel.cells[2] as! UICellTitleInput).getValue();
        let repeatPassword = (SecurityModel.cells[4] as! UICellTitleInput).getValue();
        
        ProfileAPI.patchPassword(
            oldPassword: oldPassword,
            newPassword: newPassword,
            repeatPassword: repeatPassword,
            callback: {
                success in
                if(success) {
                    self.navigationController?.popViewController(animated: true)
                } else {
                    Utilities.viewAlert(title: "Unable to update", message: "The old password is incorrect or the new one is too short or dont have [A-Z]+ [a-z]+ [0-9]+.")
                }
        })
    }
}


// ---------------------------------------------------------------------------------------------
// Table Data Source
// ---------------------------------------------------------------------------------------------

extension SecurityController: UITableViewDataSource {
    // Get number of rows
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return SecurityModel.cells.count;
    }
    
    // Create cells
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return SecurityModel.cells[indexPath.row];
    }
    
    // Remove sctions
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat.leastNonzeroMagnitude;
    }
    
    // Remove sections
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return nil;
    }
}

// ---------------------------------------------------------------------------------------------
// Table Delegate
// ---------------------------------------------------------------------------------------------

extension SecurityController: UITableViewDelegate {
}
