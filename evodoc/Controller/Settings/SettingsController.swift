//
//  ViewController.swift
//  EvoDoc
//
//  Created by Sergey Dunaevskiy on 26/12/2018.
//  Copyright © 2018 evodoc. All rights reserved.
//
//
import UIKit
import SnapKit

class SettingsController: UIViewController {
    
    // ---------------------------------------------------------------------------------------------
    // Data
    // ---------------------------------------------------------------------------------------------
    
    var tableView: UITableView!
    
    // ---------------------------------------------------------------------------------------------
    // Lifecycle functions
    // ---------------------------------------------------------------------------------------------
    
    override func loadView() {
        super.loadView()
        
        let tableView = UITableView(frame: .zero, style: .grouped)
        view.addSubview(tableView);
        tableView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        self.tableView = tableView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set data source
        tableView.dataSource = self
        tableView.delegate = self
        
        // Register all cell types used in table
        tableView.register(UICellTextArrow.self, forCellReuseIdentifier: UICellTextArrow.identifier)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Show Navbar
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
        self.navigationController?.navigationBar.topItem?.title = "Settings"
    }
}


// ---------------------------------------------------------------------------------------------
// Table Data Source
// ---------------------------------------------------------------------------------------------

extension SettingsController: UITableViewDataSource {
    // Get number of sections
    func numberOfSections(in tableView: UITableView) -> Int {
        return SettingsModel.cells.count;
    }
    
    // Get number of rows
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return SettingsModel.cells[section].count;
    }
    
    // Create cells
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return SettingsModel.cells[indexPath.section][indexPath.row];
    }
}

// ---------------------------------------------------------------------------------------------
// Table Delegate
// ---------------------------------------------------------------------------------------------

extension SettingsController: UITableViewDelegate {
    
    // Get titles for sections
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return SettingsModel.sectionNames[section]
    }
    
    // Select cell
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Push page
        // Heh
        
        if(indexPath.section == 0 && indexPath.row == 0) {
            self.navigationController?.pushViewController(ProfileController(), animated: true)
        }
        
        if(indexPath.section == 0 && indexPath.row == 1) {
            self.navigationController?.pushViewController(SecurityController(), animated: true)
        }
        
        
        if(indexPath.section == 1 && indexPath.row == 0) {
            guard let url = URL(string: "https://github.com/evo-doc/") else { return }
            UIApplication.shared.open(url)
        }
        
        if(indexPath.section == 1 && indexPath.row == 1) {
            guard let url = URL(string: "https://github.com/evo-doc/client-ios/issues") else { return }
            UIApplication.shared.open(url)
        }
        
        
        if(indexPath.section == 2 && indexPath.row == 0) {
            UserDefaults.standard.set(nil, forKey: "token");
            self.navigationController?.popToRootViewController(animated: true);
        }
        
        // Immidiatelly deselect cell
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
