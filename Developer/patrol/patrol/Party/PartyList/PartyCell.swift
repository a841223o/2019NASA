//
//  ForestViewCell.swift
//  patrol
//
//  Created by DOWN LUNYOU on 2019/10/14.
//  Copyright © 2019 Leo. All rights reserved.
//

import UIKit

class PartyCell: UITableViewCell {
    
    @IBOutlet weak var itemView: UIView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var pic: UIImageView!
    @IBOutlet weak var peopleCount: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        itemView.clipsToBounds = true
        itemView.layer.cornerRadius = 20
    }
    
    func setModel(_ model: PartyModel ){
        name.text = model.name
        peopleCount.setTitle("\(model.peopleCount)", for: .normal) 
        pic.downloaded(from: model.imageUrl, contentMode: .scaleAspectFill)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
        self.contentView.backgroundColor  =  .white
    }

}
