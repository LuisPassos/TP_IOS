//
//  AlertasViewController.swift
//  TP_LuisPassos
//
//  Created by Passos on 02/06/2016.
//  Copyright © 2016 MACdoc. All rights reserved.
//

import UIKit
import CoreData

class AlertasViewController: UIViewController {


    @IBOutlet weak var txtAlertas: UITextView!
    var linhas : [Animais] = []
    var texto = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let appDel:AppDelegate=UIApplication.sharedApplication().delegate as! AppDelegate
        let context:NSManagedObjectContext=appDel.managedObjectContext
        let fetch = NSFetchRequest(entityName: "Animais")
        do{
            try
                linhas=context.executeFetchRequest(fetch) as! [Animais]
        }catch{
            fatalError("Erro ao obter lista de Animais\(error)")
        }

        
        
        
        let requestURL: NSURL = NSURL(string: "http://lc-projetos.pt/passos/ios/dados.json")!
        let urlRequest: NSMutableURLRequest = NSMutableURLRequest(URL: requestURL)
        let session = NSURLSession.sharedSession()
        let task = session.dataTaskWithRequest(urlRequest) {
            (data, response, error) -> Void in
            
            let httpResponse = response as! NSHTTPURLResponse
            let statusCode = httpResponse.statusCode
            
            if (statusCode == 200) {
                print("Everyone is fine, file downloaded successfully.")
                
                do{
                    
                    let json = try NSJSONSerialization.JSONObjectWithData(data!, options:.AllowFragments)
                    
                    if let stations = json["animais"] as? [[String: AnyObject]] {
                        
                        for station in stations {
                            
                            if let name = station["numero"] as? String {
                                
                                if let year = station["alerta"] as? String {
                                    
                                    if year == "1" {
                                        
                                        for i in 0 ..< self.linhas.count  {
                                            
                                            let p:Animais = self.linhas[i]
                                            
                                            if Int(p.numero!) == Int(name) {
                                        
                                                
                                                dispatch_sync(dispatch_get_main_queue()) {
                                                    self.txtAlertas.text = self.txtAlertas.text + "\n O animal " + String(p.nome!) + " está fora do range"
                                                }
                                                
                                            }
                                            
                                            
                                        }
                                        
                                    }
                                    
                                    
                                }
                                
                            }

                        }
                        

                        
                    }
                    
                }catch {
                    print("Error with Json: \(error)")
                }
                
            }
            
        }
        
        
        task.resume()
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
