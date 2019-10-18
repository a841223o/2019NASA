//
//  File.swift
//  patrol
//
//  Created by DOWN LUNYOU on 2019/10/15.
//  Copyright © 2019 Leo. All rights reserved.
//

import UIKit
enum SegmentView {
    case detail
    case map
    case comment
}
class PathViewController : UIViewController {
    
    @IBOutlet weak var detailView: UIView!
    @IBOutlet weak var mapView: UIView!
    @IBOutlet weak var commentView: UIView!
    
    @IBAction func segment(_ sender: UISegmentedControl) {
        setSegmentView(tag: sender.selectedSegmentIndex)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setSegmentView(tag: 0)
    }
    func setSegmentView(tag : Int){
        switch tag {
               case 0:
                   detailView.isHidden = false
                   mapView.isHidden = true
                   commentView.isHidden = true
               case 1:
                   detailView.isHidden = true
                   mapView.isHidden = false
                   commentView.isHidden = true
               case 2:
                   detailView.isHidden = true
                   mapView.isHidden = true
                   commentView.isHidden = false
               default:
                   detailView.isHidden = false
                   mapView.isHidden = true
                   commentView.isHidden = true
                   
               }
    }
}
