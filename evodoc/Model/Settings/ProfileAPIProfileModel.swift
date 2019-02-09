//
//  ProfileAPIProfileModel.swift
//  EvoDoc
//
//  Created by Sergey Dunaevskiy on 09/02/2019.
//  Copyright © 2019 evodoc. All rights reserved.
//

struct ProfileAPIProfileModel: Codable {
    var avatar: String;
    var email: String;
    var name: String?;
    var username: String;
}
