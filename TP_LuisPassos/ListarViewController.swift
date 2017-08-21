//
//  ListarViewController.swift
//  TP_LuisPassos
//
//  Created by MACdoc on 01/06/16.
//  Copyright © 2016 MACdoc. All rights reserved.
//

import UIKit
import CoreData

class ListarViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {

    var linhas : [Animais] = []
    var AnimalSelecionado : Animais?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getDados()
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(linhas.count)
        return linhas.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell")
        cell.textLabel?.text = linhas[indexPath.row].nome
        return cell
    }
    
    func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]? {
        
        let editar = UITableViewRowAction(style: .Default, title: "Editar"){ action, index in
            self.AnimalSelecionado=self.linhas[indexPath.row]
            self.performSegueWithIdentifier("editarAnimalSegue", sender: self)
            
        }
        
        editar.backgroundColor = UIColor.blueColor()
        
        
        let apagar = UITableViewRowAction(style: .Default, title: "Apagar"){ action, index in
            let appDel:AppDelegate=UIApplication.sharedApplication().delegate as! AppDelegate
            Animais.deleteByNome(appDel, filtraComNome: self.linhas[indexPath.row].nome!)
            self.getDados()
            tableView.reloadData()
            
        }
        
        return[editar, apagar]
        
    }
    
    func getDados(){
        let appDel:AppDelegate=UIApplication.sharedApplication().delegate as! AppDelegate
        let context:NSManagedObjectContext=appDel.managedObjectContext
        let fetch = NSFetchRequest(entityName: "Animais")
        do{
            try
                linhas=context.executeFetchRequest(fetch) as! [Animais]
        }catch{
            fatalError("Erro ao obter lista de Animais\(error)")
        }
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "editarAnimalSegue"{
            let controller : EditarViewController = segue.destinationViewController as! EditarViewController
        }
    }
    
}
