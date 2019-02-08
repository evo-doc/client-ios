//
//  ProfileModel.swift
//  EvoDoc
//
//  Created by Sergey Dunaevskiy on 07/02/2019.
//  Copyright © 2019 evodoc. All rights reserved.
//

import UIKit

class ProfileModel {
    static var cells: [UITableViewCell] = [];
    static var cellsForEdit: [UITableViewCell] = [];
}

struct ProfileAPIGetProfileSuccessModel: Codable {
    var avatar: String;
    var email: String;
    var name: String?;
    var username: String;
}
