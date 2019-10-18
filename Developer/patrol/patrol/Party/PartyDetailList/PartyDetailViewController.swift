//
//  PartyDetailViewController.swift
//  patrol
//
//  Created by DOWN LUNYOU on 2019/10/14.
//  Copyright © 2019 Leo. All rights reserved.
//

import UIKit

class PartyDetailViewController: UIViewController {
    
    var partModel : PartyModel?
    let partyDetailProvider = PartyDetailModelProvider()
    
    @IBOutlet weak var headImage: UIImageView!
    @IBOutlet weak var headName: UILabel!
    @IBOutlet weak var addBtn: UIButton!
    
    
    @IBOutlet weak var tableView: UITableView!
    @IBAction func addTouchDown(_ sender: UIButton) {
        addBtn.layer.shadowOpacity = 1
    }

    @IBAction func addTouchUp(_ sender: UIButton) {
        addBtn.layer.shadowOpacity = 0.5
    }
    @IBAction func addTouchCancle(_ sender: UIButton) {
        addBtn.layer.shadowOpacity = 0.5
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        
        setupHeadView(partModel: partModel!)
    }
    
    func setupHeadView(partModel : PartyModel){
        addBtn.layer.cornerRadius = 24
        addBtn.layer.shadowOffset = CGSize.init(width: 1, height: 1)
        addBtn.layer.shadowOpacity = 0.5
        headName.text = "    " + partModel.name
        headImage.downloaded(from: partModel.imageUrl, contentMode: .scaleAspectFill)
    }


}

extension PartyDetailViewController : UITableViewDelegate ,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return partyDetailProvider.models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "partyDetailCell", for: indexPath) as! PartyDetailCell
        cell.setModel(model: partyDetailProvider.models[indexPath.row])
        
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.frame.height/7
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "partyDetailToPath", sender: nil)
    }
}
