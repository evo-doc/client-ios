//
//  SettingsModel.swift
//  EvoDoc
//
//  Created by Sergey Dunaevskiy on 06/02/2019.
//  Copyright © 2019 evodoc. All rights reserved.
//

class SettingsModel {
    
    static var sectionNames: [String] = ["Profile", "Contribution", "Session"];
    
    static var data: [[SettingsCellModel]] = [
        [
            SettingsCellModel(name: "View profile")
        ],
        [
            SettingsCellModel(name: "Github organization"),
            SettingsCellModel(name: "Report an issue")
        ],
        [
            SettingsCellModel(name: "Logout")
        ]
    ]
}

class SettingsCellModel {
    let name: String;
    
    init(name: String) {
        self.name = name;
    }
}
