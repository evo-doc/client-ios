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
}

struct ProfileAPIGetProfileSuccessModel: Codable {
    var avatar: String;
    var email: String;
    var name: String?;
    var username: String;
}
