//
//  ItemViewController.swift
//  TP_LuisPassos
//
//  Created by MACdoc on 15/06/16.
//  Copyright © 2016 MACdoc. All rights reserved.
//

import UIKit

class ItemViewController: UITableViewController {
    
    @IBOutlet weak var btnAtivar: UISwitch!
    @IBOutlet weak var btnRange: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(animated: Bool) {
        getData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    func getData() {
        
        let defaults = NSUserDefaults.standardUserDefaults()
        btnRange.value = defaults.floatForKey("RangeKey")
    btnAtivar.setOn(defaults.boolForKey("AtivarKey"), animated: true)
        
    }
    
    @IBAction func alertas(sender: UISwitch) {
        
        let defaults = NSUserDefaults.standardUserDefaults()
        var estado_alertas = false
        if(btnAtivar.on)
        {
            estado_alertas = true
        }
        
        defaults.setBool(estado_alertas, forKey: "AtivarKey")
        
        NSUserDefaults.standardUserDefaults().synchronize()
    }
    

    @IBAction func range(sender: AnyObject) {
        
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setValue(btnRange.value, forKey: "RangeKey")
        NSUserDefaults.standardUserDefaults().synchronize()
    }
    
    
}
