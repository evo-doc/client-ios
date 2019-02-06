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
        
        view.addSubview(projectListView)
        projectListView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        projectListView.projectsList.delegate = self;
        projectListView.projectsList.dataSource = self;
        projectListView.projectsList.register(ProjectTableCellView.self, forCellReuseIdentifier: ProjectTableCellView.reuseIdentifier);
        
        ProjectAPI.getProjects(callback: { data in
            self.data = data;
            self.projectListView.projectsList.reloadData();
        })
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Show Navbar
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
        self.navigationController?.navigationBar.topItem?.title = "Projects"
    }
    
    // ---------------------------------------------------------------------------------------------
    //
    // ---------------------------------------------------------------------------------------------
}

//Extension for UITableViewDelegate & UITableViewDataSource stuff
extension ProjectsController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let d = self.data {
            return d.projects.data.count;
        } else {
            return 0;
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let project = data.projects.data[indexPath.row];

        guard let cell = tableView.dequeueReusableCell(withIdentifier: ProjectTableCellView.reuseIdentifier, for: indexPath) as? ProjectTableCellView else {
            return UITableViewCell();
        }

        cell.name = project.name;
        cell.desc = project.text;

        return cell;
    }


}

