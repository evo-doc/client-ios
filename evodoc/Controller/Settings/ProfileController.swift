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
    // Data
    // ---------------------------------------------------------------------------------------------
    var tableView: UITableView!;
    
    
    // Lifecycle
    // ---------------------------------------------------------------------------------------------
    override func loadView() {
        super.loadView();
        self.title = "Profile";
        
        let tableView = UITableView(frame: .zero, style: .grouped);
        view.addSubview(tableView);
        tableView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        tableView.allowsSelection = false;
        tableView.separatorColor = UIColor(white: 1, alpha: 0);
        tableView.backgroundColor = .white;
        self.tableView = tableView;
    }
    
    override func viewDidLoad() {
        super.viewDidLoad();
        
        // Set data source
        tableView.dataSource = self;
        tableView.delegate = self;
        
        // Register all cell types used in table
        tableView.register(UICellTitleText.self, forCellReuseIdentifier: UICellTitleText.identifier);
        tableView.register(ProfileCellAvatarView.self, forCellReuseIdentifier: ProfileCellAvatarView.identifier);
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated);
        
        // Update table data
        self.update();
        
        // Show Navbar
        self.navigationController?.setNavigationBarHidden(false, animated: animated);
        
        // Right button
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            title: "Edit",
            style: .plain,
            target: self,
            action: #selector(self.gotoEdit));
    }
    
    
    // Gestures
    // ---------------------------------------------------------------------------------------------
    @objc func gotoEdit(){
        navigationController?.pushViewController(ProfileEditController(), animated: true);
    }
    

    // Methods
    // ---------------------------------------------------------------------------------------------

    /**
     Update the whole table. Remove all old table cells and render new.
     */
    func update() {
        ProfileAPI.getProfile {
            data in
            ProfileModel.cells.removeAll();
            ProfileModel.cells.append(contentsOf:
                [
                    ProfileCellAvatarView().setData(hash: data.avatar),
                    UICellTitleText().setData(key: "Name", value: data.name ?? ""),
                    UICellTitleText().setData(key: "Username", value: data.username),
                    UICellTitleText().setData(key: "E-mail", value: data.email),
                    UICellTitleText().setData(key: "Private token", value: (UserDefaults.standard.value(forKey: "token") as? String)!)
                ]
            );
            
            self.tableView.reloadData();
        }
    }

}


// -------------------------------------------------------------------------------------------------
// Table Extension
// -------------------------------------------------------------------------------------------------
extension ProfileController: UITableViewDataSource, UITableViewDelegate {
    // Get number of rows
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ProfileModel.cells.count;
    }
    
    // Create cells
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return ProfileModel.cells[indexPath.row];
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
