//
//  Animais+CoreDataProperties.swift
//  TP_LuisPassos
//
//  Created by MACdoc on 01/06/16.
//  Copyright © 2016 MACdoc. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Animais {

    @NSManaged var idade: NSNumber?
    @NSManaged var nome: String?
    @NSManaged var numero: NSNumber?

}
