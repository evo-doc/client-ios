//
//  ProfileEditController.swift
//  EvoDoc
//
//  Created by Sergey Dunaevskiy on 07/02/2019.
//  Copyright © 2019 evodoc. All rights reserved.
//


import UIKit
import SnapKit

class ProfileEditController: UIViewController {
    
    // ---------------------------------------------------------------------------------------------
    // Data
    // ---------------------------------------------------------------------------------------------
    
    var tableView: UITableView!
    
    // ---------------------------------------------------------------------------------------------
    // Lifecycle functions
    // ---------------------------------------------------------------------------------------------
    
    override func loadView() {
        super.loadView()
        self.title = "Edit profile"
        
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
        tableView.register(ProfileCellKeyEditView.self, forCellReuseIdentifier: ProfileCellKeyValueView.identifier)
        tableView.register(ProfileCellAvatarView.self, forCellReuseIdentifier: ProfileCellAvatarView.identifier)
        
        ProfileAPI.getProfile {
            data in
            ProfileModel.cellsForEdit.removeAll();
            
            let name = ProfileCellKeyEditView();
            name.setName(key: "Name", value: data.name ?? "");
            ProfileModel.cellsForEdit.append(name);
            
            let username = ProfileCellKeyEditView();
            username.setName(key: "Username", value: data.username);
            ProfileModel.cellsForEdit.append(username);
            
            let email = ProfileCellKeyEditView();
            email.setName(key: "E-mail", value: data.email);
            ProfileModel.cellsForEdit.append(email);
            
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
        
        let name = (ProfileModel.cellsForEdit[0] as! ProfileCellKeyEditView).valueLabel.text!;
        let username = (ProfileModel.cellsForEdit[1] as! ProfileCellKeyEditView).valueLabel.text!;
        let email = (ProfileModel.cellsForEdit[2] as! ProfileCellKeyEditView).valueLabel.text!;
        
        ProfileAPI.saveProfile(
            name: name,
            username: username,
            email: email,
            callback: {
                success in
                if(success) {
                    self.navigationController?.popViewController(animated: true)
                } else {
                    Utilities.viewAlert(title: "Unable to update", message: "Some data are too short or non unique.")
                }
        })
    }
}


// ---------------------------------------------------------------------------------------------
// Table Data Source
// ---------------------------------------------------------------------------------------------

extension ProfileEditController: UITableViewDataSource {
    // Get number of rows
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ProfileModel.cellsForEdit.count
    }
    
    // Create cells
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = ProfileModel.cellsForEdit[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat.leastNonzeroMagnitude
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return nil;
    }
}

// ---------------------------------------------------------------------------------------------
// Table Delegate
// ---------------------------------------------------------------------------------------------

extension ProfileEditController: UITableViewDelegate {
}
