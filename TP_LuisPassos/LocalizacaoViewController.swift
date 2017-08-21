//
//  LocalizacaoViewController.swift
//  TP_LuisPassos
//
//  Created by Passos on 02/06/2016.
//  Copyright © 2016 MACdoc. All rights reserved.
//

import UIKit
import MapKit
import CoreData
import Foundation
import CoreLocation

class LocalizacaoViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    @IBOutlet weak var meuMapa: MKMapView!
    
    let minhaLocalizacao = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.minhaLocalizacao.requestAlwaysAuthorization()
        self.minhaLocalizacao.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            
            minhaLocalizacao.delegate = self
            minhaLocalizacao.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            minhaLocalizacao.startUpdatingLocation()
            
        }
        
        // Do any additional setup after loading the view, typically from a nib.
        

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        var locValue:CLLocationCoordinate2D = (manager.location?.coordinate)!
        print("locations = \(locValue.latitude) \(locValue.longitude)")
        
        let latitude:CLLocationDegrees = 51.51000
        
        let longitude:CLLocationDegrees = -0.1335
        
        let latitudeDelta:CLLocationDegrees = 0.1
        let longitudeDelta:CLLocationDegrees = 0.1
        
        let span:MKCoordinateSpan = MKCoordinateSpanMake(latitudeDelta, longitudeDelta)
        
        let location:CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)
        
        let region:MKCoordinateRegion = MKCoordinateRegionMake(location, span)
        
        meuMapa.setRegion(region, animated: true)
        
        var anotacao = MKPointAnnotation()
        
        anotacao.coordinate = locValue
        anotacao.title = "Eu"
        
        meuMapa.addAnnotation(anotacao)
        
        var local1 = CLLocation(latitude: locValue.latitude, longitude: locValue.longitude)
        var local2 = CLLocation(latitude: location.latitude, longitude: location.longitude)
        
        var distance = local1.distanceFromLocation(local2)
        print(String(format: "Distancia entre pontos e de %0.1f metros", distance))
        
    }
    
}
