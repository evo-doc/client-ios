//
//  Utilities.swift
//  EvoDoc
//
//  Created by Sergey Dunaevskiy on 03/02/2019.
//  Copyright © 2019 evodoc. All rights reserved.
//

import UIKit

class Utilities {
    static func rotationEnable() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate;
        appDelegate.enableRotation = true;
    }
    
    static func rotationDisable() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate;
        appDelegate.enableRotation = false;
        let value = UIInterfaceOrientation.portrait.rawValue;
        UIDevice.current.setValue(value, forKey: "orientation");
    }
}
