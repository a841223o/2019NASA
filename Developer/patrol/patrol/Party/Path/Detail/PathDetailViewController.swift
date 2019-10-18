//
//  PathDetailViewController.swift
//  patrol
//
//  Created by DOWN LUNYOU on 2019/10/15.
//  Copyright © 2019 Leo. All rights reserved.
//

import Foundation
import UIKit
class PathDetailViewController :UIViewController {
    @IBOutlet weak var headInfo: UITextView!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var headImage: UIImageView!
    @IBOutlet weak var headName: UILabel!
    @IBOutlet weak var tableView: UITableView!
    let pathProvider = PathProvider()
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        setupHeadView()
    }
    
   func setupHeadView(){
        headImage.layer.cornerRadius = 24
        headImage.clipsToBounds = true
        headName.text = "leo"
        date.text = "2019/10/19"
    }
}

extension PathDetailViewController : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pathProvider.models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PathCell", for: indexPath) as! PathCell
        cell.setModel(model: pathProvider.models[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if (pathProvider.models[indexPath.row].imageUrl == "" ){
            return 150
        }
        return 300
    }
    
}
