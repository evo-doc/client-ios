//
//  ProjectListModel.swift
//  EvoDoc
//
//  Created by Tomáš Starý on 05/02/2019.
//  Copyright © 2019 evodoc. All rights reserved.
//

struct ProjectListModel : Codable {
    var projects: [ProjectData];
}

struct ProjectData : Codable {
    var data: [Project];
}

struct Project : Codable {
    var id: Int;
    var owner: String;
    var name: String;
    var description: String;
}
