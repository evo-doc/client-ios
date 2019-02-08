//
//  SettingsModel.swift
//  EvoDoc
//
//  Created by Sergey Dunaevskiy on 06/02/2019.
//  Copyright © 2019 evodoc. All rights reserved.
//

import UIKit

class SettingsModel {
    static var sectionNames: [String] = ["Profile", "Contribution", "Session"];
    
    static var cells: [[UITableViewCell]] = [
        [
            UICellTextArrow().setData(title: "View profile"),
            UICellTextArrow().setData(title: "Security"),
        ],
        [
            UICellTextArrow().setData(title: "Github organization"),
            UICellTextArrow().setData(title: "Report an issue")
        ],
        [
            UICellTextArrow().setData(title: "Logout", titleColor: UIColor.red)
        ]
    ]
}
