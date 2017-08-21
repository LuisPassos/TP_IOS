//
//  DefinicoesViewController.swift
//  TP_LuisPassos
//
//  Created by Passos on 02/06/2016.
//  Copyright © 2016 MACdoc. All rights reserved.
//

import UIKit
import CoreData

class DefinicoesViewController: UIViewController {

    @IBOutlet weak var txtRange: UITextField!
    
    @IBOutlet weak var btnAtivar: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getData() {
    
        let defaults = NSUserDefaults.standardUserDefaults()
        if let range = defaults.stringForKey("RangeKey") {
            txtRange.text = range
        }
        if let ativo = defaults.stringForKey("AtivarKey") {
            if ativo == "1"  {
                btnAtivar.setOn(true, animated: true)
            } else {
                btnAtivar.setOn(false, animated: true)
            }
        }
        
    }
    
    @IBAction func btnGuardar(sender: AnyObject) {
        
        let range:Int? = Int(txtRange.text!)
        
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setInteger(range!, forKey: "RangeKey")
        
        if btnAtivar.on {
            defaults.setBool(true, forKey: "AtivarKey")
        } else {
            defaults.setBool(false, forKey: "AtivarKey")
        }
        
        do{
            let alertController = UIAlertController(title: "Sucesso", message:
                "Alterações aplicadas com sucesso", preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "Guardado com Sucesso", style: UIAlertActionStyle.Default,handler: nil))
            
            self.presentViewController(alertController, animated: true, completion: nil)
            
        }
    }
    
}
