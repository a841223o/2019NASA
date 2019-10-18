//
//  FirstViewController.swift
//  patrol
//
//  Created by DOWN LUNYOU on 2019/10/12.
//  Copyright © 2019 Leo. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation
import GoogleSignIn
import Firebase
//EUENMythpPSPOe4w1vQbUl7WNAz2
class MapViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    
    @IBOutlet weak var infoView: UIView!
    @IBOutlet weak var infoViewLocationNme: UILabel!
    @IBOutlet weak var infoViewN: UILabel!
    @IBOutlet weak var infoViewE: UILabel!
    @IBOutlet weak var infoViewH: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self
        
    }
    
    func setupLocationAuthorization(){
        
        let  myLocationManager = CLLocationManager()
        // 首次使用 向使用者詢問定位自身位置權限
           if CLLocationManager.authorizationStatus()
            == .notDetermined {
               // 取得定位服務授權
               
              // myLocationManager.requestWhenInUseAuthorization()
               myLocationManager.requestAlwaysAuthorization()
               // 開始定位自身位置
             //  myLocationManager.startUpdatingLocation()
           }
           // 使用者已經拒絕定位自身位置權限
           else if CLLocationManager.authorizationStatus()
            == .denied {
               // 提示可至[設定]中開啟權限
               let alertController = UIAlertController(
                 title: "定位權限已關閉",
                 message:
                 "如要變更權限，請至 設定 > 隱私權 > 定位服務 開啟",
                 preferredStyle: .alert)
               let okAction = UIAlertAction(
                title: "確認", style: .default, handler:nil)
               alertController.addAction(okAction)
            self.present(
                 alertController,
                 animated: true, completion: nil)
           }
           // 使用者已經同意定位自身位置權限
           else if CLLocationManager.authorizationStatus()
            == .authorizedWhenInUse {
               // 開始定位自身位置
               myLocationManager.startUpdatingLocation()
           }
    }
    override func viewDidAppear(_ animated: Bool) {
        // Do any additional setup after loading the view.
        setupLocationAuthorization()
        setupInfoView()
        setupFakeData()
    }
    
    
}

//mapView
extension MapViewController : MKMapViewDelegate {
    func setupFakeData(){
        let fire = FireInfo.init(location: CLLocation.init(latitude: 25.194469, longitude: 121.560947), locationName: "Taiwan,Taipei", status: 0, range: 100 ,height: 10)
        mapView(setFire: fire)
        infoView(setInfo: fire)
    }
    func mapView(setFire fire: FireInfo){
        //地圖位置
        let region  = MKCoordinateRegion.init(center: fire.location.coordinate, latitudinalMeters: 100*1000, longitudinalMeters: 100*1000)
        
        //地標
        let annotation = MKPointAnnotation()
        annotation.coordinate = fire.location.coordinate
        mapView.showAnnotations([annotation], animated: true)
        mapView.selectAnnotation(annotation, animated: true)
        mapView.setRegion(region, animated: true)
        //範圍
        let circle = MKCircle(center: fire.location.coordinate, radius:CLLocationDistance(fire.range))
        mapView.addOverlay(circle)

        
    }
    
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        let circleRender = MKCircleRenderer.init(overlay: overlay)
        circleRender.strokeColor = UIColor.red
        circleRender.lineWidth = 1.0
        circleRender.fillColor = UIColor.red.withAlphaComponent(0.3)
        return circleRender
    }
//    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
//        var myView = mapView.dequeueReusableAnnotationView(withIdentifier: "fire")
//        if myView == nil{
//            myView = MKAnnotationView.init(annotation: annotation, reuseIdentifier: "fire")
//            myView?.image = #imageLiteral(resourceName: "second")
//
//        }else{
//
//        }
//        return myView
//    }
    
}

extension MapViewController {
    func setupInfoView(){
        infoView.layer.cornerRadius = 20
        infoView.isHidden = true
    }
    func infoView(setInfo fire : FireInfo){
        infoView.isHidden = false
        infoViewLocationNme.text = fire.locationName
        infoViewN.text =  "\(fire.location.coordinate.latitude ) N"
        infoViewE.text = "\(fire.location.coordinate.longitude) E"
        infoViewH.text = "\(fire.height)m H"
    }
}
