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
    // Data
    // ---------------------------------------------------------------------------------------------
    var tableView: UITableView!;
    
    
    // Lifecycle
    // ---------------------------------------------------------------------------------------------
    override func loadView() {
        super.loadView();
        
        let tableView = UITableView(frame: .zero, style: .grouped);
        view.addSubview(tableView);
        tableView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        self.tableView = tableView;
    }
    
    override func viewDidLoad() {
        super.viewDidLoad();
        
        // Set data source
        tableView.dataSource = self;
        tableView.delegate = self;
        
        // Register all cell types used in table
        tableView.register(UICellTextArrow.self, forCellReuseIdentifier: UICellTextArrow.identifier);
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated);
        
        // Show Navbar
        self.navigationController?.navigationBar.topItem?.title = "Settings";
        
        // Show right button
        self.navigationController?.navigationBar.topItem?.rightBarButtonItem = nil;
        
        // Update table data
        update();
    }
    
    
    // Methods
    // ---------------------------------------------------------------------------------------------
    
    /**
     Update the whole table. Remove all old table cells and render new.
     */
    func update() {
        SettingsModel.cells.removeAll();
        
        SettingsModel.cells.append([]);
        SettingsModel.cells[0].append(contentsOf: [
            UICellTextArrow().setData(title: "View profile"),
            UICellTextArrow().setData(title: "Security")
            ]);
        
        SettingsModel.cells.append([])
        SettingsModel.cells[1].append(contentsOf: [
            UICellTextArrow().setData(title: "Github organization"),
            UICellTextArrow().setData(title: "Report an issue")
            ]);
        
        SettingsModel.cells.append([])
        SettingsModel.cells[2].append(contentsOf: [
            UICellTextArrow().setData(title: "Logout", titleColor: .red)
            ]);
        
        self.tableView.reloadData()
    }
    
}


// -------------------------------------------------------------------------------------------------
// Table Extension
// -------------------------------------------------------------------------------------------------
extension SettingsController: UITableViewDataSource, UITableViewDelegate {
    // Get number of sections
    func numberOfSections(in tableView: UITableView) -> Int {
        return SettingsModel.cells.count;
    }
    
    // Get titles for sections
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return SettingsModel.sectionNames[section];
    }
    
    // Get number of rows
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return SettingsModel.cells[section].count;
    }
    
    // Create cells
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return SettingsModel.cells[indexPath.section][indexPath.row];
    }
    
    // Select cell
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Push page
        // Heh
        
        if(indexPath.section == 0 && indexPath.row == 0) {
            self.navigationController?.pushViewController(ProfileController(), animated: true);
        }
        
        if(indexPath.section == 0 && indexPath.row == 1) {
            self.navigationController?.pushViewController(SecurityController(), animated: true);
        }
        
        
        if(indexPath.section == 1 && indexPath.row == 0) {
            guard let url = URL(string: "https://github.com/evo-doc/") else { return }
            UIApplication.shared.open(url);
        }
        
        if(indexPath.section == 1 && indexPath.row == 1) {
            guard let url = URL(string: "https://github.com/evo-doc/client-ios/issues") else { return }
            UIApplication.shared.open(url);
        }
        
        
        if(indexPath.section == 2 && indexPath.row == 0) {
            UserDefaults.standard.set(nil, forKey: "token");
            self.navigationController?.popToRootViewController(animated: true);
        }
        
        // Immidiatelly deselect cell
        tableView.deselectRow(at: indexPath, animated: true);
    }
}
