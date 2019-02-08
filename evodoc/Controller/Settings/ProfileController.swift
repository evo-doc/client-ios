//
//  ProfileController.swift
//  EvoDoc
//
//  Created by Sergey Dunaevskiy on 07/02/2019.
//  Copyright © 2019 evodoc. All rights reserved.
//


import UIKit
import SnapKit

class ProfileController: UIViewController {
    
    // ---------------------------------------------------------------------------------------------
    // Data
    // ---------------------------------------------------------------------------------------------
    
    var tableView: UITableView!
    
    // ---------------------------------------------------------------------------------------------
    // Lifecycle functions
    // ---------------------------------------------------------------------------------------------
    
    override func loadView() {
        super.loadView()
        self.title = "Profile"
        
        let tableView = UITableView(frame: .zero, style: .grouped)
        view.addSubview(tableView);
        tableView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        tableView.allowsSelection = false;
        tableView.separatorColor = UIColor(white: 1, alpha: 0)
        tableView.backgroundColor = .white
        self.tableView = tableView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set data source
        tableView.dataSource = self
        tableView.delegate = self
        
        // Register all cell types used in table
        tableView.register(ProfileCellKeyValueView.self, forCellReuseIdentifier: ProfileCellKeyValueView.identifier)
        tableView.register(ProfileCellAvatarView.self, forCellReuseIdentifier: ProfileCellAvatarView.identifier)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.update()
        
        // Show Navbar
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
        
        navigationItem.rightBarButtonItem =
            UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(self.gotoEdit))
    }
    
    // ---------------------------------------------------------------------------------------------
    // Gestures
    // ---------------------------------------------------------------------------------------------
    
    @objc func gotoEdit(){
        navigationController?.pushViewController(ProfileEditController(), animated: true);
    }
    
    
    // ---------------------------------------------------------------------------------------------
    // Methods
    // ---------------------------------------------------------------------------------------------
    
    func update() {
        ProfileAPI.getProfile {
            data in
            ProfileModel.cells.removeAll();
            
            let avatar = ProfileCellAvatarView();
            avatar.setHash(hash: data.avatar);
            ProfileModel.cells.append(avatar);
            
            let name = ProfileCellKeyValueView();
            name.setName(key: "Name", value: data.name ?? "");
            ProfileModel.cells.append(name);
            
            let username = ProfileCellKeyValueView();
            username.setName(key: "Username", value: data.username);
            ProfileModel.cells.append(username);
            
            let email = ProfileCellKeyValueView();
            email.setName(key: "E-mail", value: data.email);
            ProfileModel.cells.append(email);
            
            let token = ProfileCellKeyValueView();
            token.setName(key: "Private token", value: (UserDefaults.standard.value(forKey: "token") as? String)!);
            ProfileModel.cells.append(token);
            
            self.tableView.reloadData()
        }
    }

}


// ---------------------------------------------------------------------------------------------
// Table Data Source
// ---------------------------------------------------------------------------------------------

extension ProfileController: UITableViewDataSource {
    // Get number of rows
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ProfileModel.cells.count
    }
    
    // Create cells
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = ProfileModel.cells[indexPath.row]
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

extension ProfileController: UITableViewDelegate {
}
