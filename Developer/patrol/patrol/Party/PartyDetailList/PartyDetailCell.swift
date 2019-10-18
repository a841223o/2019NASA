//
//  PartyDetailCell.swift
//  patrol
//
//  Created by DOWN LUNYOU on 2019/10/14.
//  Copyright © 2019 Leo. All rights reserved.
//

import UIKit

class PartyDetailCell: UITableViewCell {
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var itemView: UIView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var pathLabel: UILabel!
    @IBOutlet weak var userName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        userImageView.layer.cornerRadius = userImageView.frame.width/2
        itemView.layer.cornerRadius = 20
        itemView.layer.shadowOffset = CGSize.init(width: 0, height: 0)
        itemView.layer.shadowOpacity = 0.8
    }
    
    func setModel(model : PartyDetailModel){
        userImageView.downloaded(from: model.imageUrl, contentMode: .scaleAspectFit)
        userName.text = model.userName
        dateLabel.text = model.date
        pathLabel.text = model.path
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        self.contentView.backgroundColor = UIColor.white
        // Configure the view for the selected state
    }

}
