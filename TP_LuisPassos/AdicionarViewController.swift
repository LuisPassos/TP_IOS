//
//  AdicionarViewController.swift
//  TP_LuisPassos
//
//  Created by MACdoc on 01/06/16.
//  Copyright © 2016 MACdoc. All rights reserved.
//

import UIKit
import CoreData

class AdicionarViewController: UIViewController {

    
    @IBOutlet weak var txtNome: UITextField!
    @IBOutlet weak var txtNumero: UITextField!
    @IBOutlet weak var txtIdade: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnAdicionar(sender: AnyObject) {
        
        let appDel:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let context:NSManagedObjectContext=appDel.managedObjectContext
        let entidade = NSEntityDescription.entityForName("Animais", inManagedObjectContext: context)
        let novoAnimal = Animais(entity: entidade!, insertIntoManagedObjectContext: context)
        novoAnimal.numero = (Int)(txtNumero.text!)
        novoAnimal.nome = txtNome.text
        novoAnimal.idade = (Int)(txtIdade.text!)
        
        do{
            try
                context.save()
            let alertController = UIAlertController(title: "Sucesso", message:
                "Animal adicionado", preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "Adicionado com Sucesso", style: UIAlertActionStyle.Default,handler: nil))
            
            self.presentViewController(alertController, animated: true, completion: nil)
        }   catch{
            fatalError("Erro ao adicionar Animal \(error)")
        }
    }
    
    
}
