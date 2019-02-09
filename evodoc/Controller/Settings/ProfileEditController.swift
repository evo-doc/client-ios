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
    // Data
    // ---------------------------------------------------------------------------------------------
    var tableView: UITableView!;
    
    
    // Lifecycle
    // ---------------------------------------------------------------------------------------------
    override func loadView() {
        super.loadView();
        self.title = "Edit profile";
        
        let tableView = UITableView(frame: .zero, style: .grouped);
        view.addSubview(tableView);
        tableView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        tableView.allowsSelection = false;
        tableView.backgroundColor = .white;
        tableView.allowsMultipleSelection = false;
        tableView.separatorStyle = .none;
        self.tableView = tableView;
    }
    
    override func viewDidLoad() {
        super.viewDidLoad();
        
        // Set data source
        tableView.dataSource = self;
        tableView.delegate = self;
        
        // Register all cell types used in table
        tableView.register(UICellTitleInput.self, forCellReuseIdentifier: UICellTitleInput.identifier);
        tableView.register(UICellNotes.self, forCellReuseIdentifier: UICellNotes.identifier);
        
        // Update table data
        update();
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated);
        
        // Show Navbar
        self.navigationController?.setNavigationBarHidden(false, animated: animated);
        
        // Right button
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            title: "Save",
            style: .plain,
            target: self,
            action: #selector(self.saveData));
    }
    
    
    // Gestures
    // ---------------------------------------------------------------------------------------------
    @objc func saveData(){
        let name = (ProfileEditModel.cells[0] as! UICellTitleInput).getValue();
        let username = (ProfileEditModel.cells[2] as! UICellTitleInput).getValue();
        let email = (ProfileEditModel.cells[4] as! UICellTitleInput).getValue();
        
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
        });
    }
    
    // Methods
    // ---------------------------------------------------------------------------------------------
    
    /**
     Update the whole table. Remove all old table cells and render new.
     */
    func update() {
        ProfileAPI.getProfile {
            data in
            
            ProfileEditModel.cells.removeAll();
            ProfileEditModel.cells.append(contentsOf:
                [
                    UICellTitleInput().setData(key: "Name", value: data.name ?? ""),
                    UICellNotes().setData(value: "A name should contain only letters."),
                    UICellTitleInput().setData(key: "Username", value: data.username),
                    UICellNotes().setData(value: "A username should contain only letters and numbers. All users should have their own unique username."),
                    UICellTitleInput().setData(key: "E-mail", value: data.email),
                    UICellNotes().setData(value: "E.g.: user@example.com. The email is unique per system.")
                ]
            );
            
            self.tableView.reloadData();
        }
    }
}


// ---------------------------------------------------------------------------------------------
// Table Extension
// ---------------------------------------------------------------------------------------------
extension ProfileEditController: UITableViewDataSource, UITableViewDelegate {
    // Get number of rows
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ProfileEditModel.cells.count;
    }
    
    // Create cells
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return ProfileEditModel.cells[indexPath.row];
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
