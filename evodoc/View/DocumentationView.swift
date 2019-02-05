//
//  DocumentationView.swift
//  EvoDoc
//
//  Created by Sergey Dunaevskiy on 05/02/2019.
//  Copyright © 2019 evodoc. All rights reserved.
//

import UIKit

class DocumentationView: UITextView {
    
    var controller: UIViewController!;
    
    override init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)
        
        // Create items
        self.text = "EvoDoc is an abbreviation for evolvable documents.The main idea of the project is to organise documents into smaller parts – modules that could be repeatedly used in many parts of many papers, e.g. a license in different manuals. EvoDoc is an abbreviation for evolvable documents.The main idea of the project is to organise documents into smaller parts – modules that could be repeatedly used in many parts of many papers, e.g. a license in different manuals.EvoDoc is an abbreviation for evolvable documents.The main idea of the project is to organise documents into smaller parts – modules that could be repeatedly used in many parts of many papers, e.g. a license in different manuals.EvoDoc is an abbreviation for evolvable documents.The main idea of the project is to organise documents into smaller parts – modules that could be repeatedly used in many parts of many papers, e.g. a license in different manuals.EvoDoc is an abbreviation for evolvable documents.The main idea of the project is to organise documents into smaller parts – modules that could be repeatedly used in many parts of many papers, e.g. a license in different manuals.EvoDoc is an abbreviation for evolvable documents.The main idea of the project is to organise documents into smaller parts – modules that could be repeatedly used in many parts of many papers, e.g. a license in different manuals.EvoDoc is an abbreviation for evolvable documents.The main idea of the project is to organise documents into smaller parts – modules that could be repeatedly used in many parts of many papers, e.g. a license in different manuals.EvoDoc is an abbreviation for evolvable documents.The main idea of the project is to organise documents into smaller parts – modules that could be repeatedly used in many parts of many papers, e.g. a license in different manuals.EvoDoc is an abbreviation for evolvable documents.The main idea of the project is to organise documents into smaller parts – modules that could be repeatedly used in many parts of many papers, e.g. a license in different manuals.EvoDoc is an abbreviation for evolvable documents.The main idea of the project is to organise documents into smaller parts – modules that could be repeatedly used in many parts of many papers, e.g. a license in different manuals.EvoDoc is an abbreviation for evolvable documents.The main idea of the project is to organise documents into smaller parts – modules that could be repeatedly used in many parts of many papers, e.g. a license in different manuals.EvoDoc is an abbreviation for evolvable documents.The main idea of the project is to organise documents into smaller parts – modules that could be repeatedly used in many parts of many papers, e.g. a license in different manuals.EvoDoc is an abbreviation for evolvable documents.The main idea of the project is to organise documents into smaller parts – modules that could be repeatedly used in many parts of many papers, e.g. a license in different manuals.EvoDoc is an abbreviation for evolvable documents.The main idea of the project is to organise documents into smaller parts – modules that could be repeatedly used in many parts of many papers, e.g. a license in different manuals.EvoDoc is an abbreviation for evolvable documents.The main idea of the project is to organise documents into smaller parts – modules that could be repeatedly used in many parts of many papers, e.g. a license in different manuals.";
        
        self.font = UIFont(name: self.font!.fontName, size: 20)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
