//
//  ViewController.swift
//  EvoDoc
//
//  Created by Sergey Dunaevskiy on 26/12/2018.
//  Copyright © 2018 evodoc. All rights reserved.
//

import UIKit
import SnapKit

class ProjectsController: UIViewController {
    
    let projectListView = ProjectListView();
    var data: ProjectListModel!;
    
    // ---------------------------------------------------------------------------------------------
    // Lifecycle functions
    // ---------------------------------------------------------------------------------------------
    
    override func viewDidLoad() {
        super.viewDidLoad();
        view.backgroundColor = .yellow;
        self.title = "Projects";
        
        ProjectAPI.getProjects(callback: { data in
            // print(data.projects.data[0].name)
        })
        
//        projectListView.projectsList.delegate = self;
//        projectListView.projectsList.dataSource = self;
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Show Navbar
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
        self.navigationController?.navigationBar.topItem?.title = "Projects"
        self.navigationController?.navigationBar.topItem?.hidesBackButton = true
    }
    
    // ---------------------------------------------------------------------------------------------
    //
    // ---------------------------------------------------------------------------------------------
}

////Extension for UITableViewDelegate & UITableViewDataSource stuff
//extension ProjectsController: UITableViewDelegate, UITableViewDataSource {
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return data.projects.data.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let project = data.projects.data[indexPath.row];
//
//        guard let cell = tableView.dequeueReusableCell(withIdentifier: ProjectTableCellView.reuseIdentifier, for: indexPath) as? ProjectTableCellView else {
//            return UITableViewCell();
//        }
//
//        cell.name = project.name;
//        cell.desc = project.description;
//
//        return cell
//    }
//
//
//}
//
