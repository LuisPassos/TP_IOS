//
//  Animais.swift
//  TP_LuisPassos
//
//  Created by MACdoc on 01/06/16.
//  Copyright © 2016 MACdoc. All rights reserved.
//

import Foundation
import CoreData


class Animais: NSManagedObject {

// Insert code here to add functionality to your managed object subclass

    static func deleteByNome(appd: AppDelegate, filtraComNome : String){
        var lista:Array<AnyObject> = []
        let appDel:AppDelegate=appd
        let context:NSManagedObjectContext = appDel.managedObjectContext
        let fetch = NSFetchRequest(entityName: "Animais")
        fetch.predicate = NSPredicate(format: "nome == %@", filtraComNome)
        do{
            try
                
                lista=context.executeFetchRequest(fetch)
            for registo in lista{
                context.deleteObject(registo as! NSManagedObject)
            }
            
        }catch{
            fatalError("Erro ao Eliminar Animal\(error)")
        }
        
    }
    
}
