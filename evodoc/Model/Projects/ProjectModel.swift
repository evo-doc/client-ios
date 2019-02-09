//
//  ProjectModel.swift
//  EvoDoc
//
//  Created by Tomáš Starý on 07/02/2019.
//  Copyright © 2019 evodoc. All rights reserved.
//

import UIKit

/**
 Stores Cells information for Project page
 */
class ProjectCellModel {
    static var cells: [UITableViewCell] = [];
}

class ProjectModel : Codable {
    var active: Bool;
    var created: String;
    var description: String;
    var id: Int;
    var name: String;
    var updated: String;
}
