//
//  SecondViewController.swift
//  patrol
//
//  Created by DOWN LUNYOU on 2019/10/12.
//  Copyright © 2019 Leo. All rights reserved.
//

import UIKit

class PartyViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    let partyProvider = PartyProvider()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let  identifier = segue.identifier!
        switch identifier {
        case "PartyToDetail":
            let viewController =  segue.destination as! PartyDetailViewController
            viewController.partModel = sender as? PartyModel
        default:
            ()
        }
        
    }

}


extension PartyViewController : UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return partyProvider.partys.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "partyCell", for: indexPath) as! PartyCell
        cell.setModel(partyProvider.partys[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "PartyToDetail", sender: partyProvider.partys[indexPath.row])
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.view.frame.height/3.5
    }
    
    
}
