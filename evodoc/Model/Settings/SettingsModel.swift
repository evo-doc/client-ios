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
    
    static var data: [[SettingsCellModel]] = [
        [
            SettingsCellModel(name: "View profile"),
            SettingsCellModel(name: "Security")
        ],
        [
            SettingsCellModel(name: "Github organization"),
            SettingsCellModel(name: "Report an issue")
        ],
        [
            SettingsCellModel(name: "Logout", textColor: UIColor.red)
        ]
    ]
}

class SettingsCellModel {
    let name: String;
    let textColor: UIColor;
    
    init(name: String) {
        self.name = name;
        self.textColor = .black;
    }
    
    init(name: String, textColor: UIColor) {
        self.name = name;
        self.textColor = textColor;
    }
}
