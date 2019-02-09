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
    // Data
    // ---------------------------------------------------------------------------------------------
    var tableView: UITableView!;
    
    
    // Lifecycle
    // ---------------------------------------------------------------------------------------------
    override func loadView() {
        super.loadView();
        self.title = "Security";
        
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
        });
    }
    
    
    // Methods
    // ---------------------------------------------------------------------------------------------
    
    /**
     Update the whole table. Remove all old table cells and render new.
     */
    func update() {
        SecurityModel.cells.removeAll();
        SecurityModel.cells.append(contentsOf:
            [
                UICellTitleInput().setData(key: "Old password", value: "").isHidden(true),
                UICellNotes().setData(value: "Your current password"),
                UICellTitleInput().setData(key: "New password", value: "").isHidden(true),
                UICellNotes().setData(value: "A password should have at least one uppercase, one lowercase and one number"),
                UICellTitleInput().setData(key: "Repeat password", value: "").isHidden(true),
                UICellNotes().setData(value: "Repeat your new password")
            ]
        );
        self.tableView.reloadData();
    }
}


// -------------------------------------------------------------------------------------------------
// Table Extension
// -------------------------------------------------------------------------------------------------
extension SecurityController: UITableViewDataSource, UITableViewDelegate {
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
