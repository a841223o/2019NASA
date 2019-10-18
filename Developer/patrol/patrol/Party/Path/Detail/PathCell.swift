//
//  PathCell.swift
//  patrol
//
//  Created by DOWN LUNYOU on 2019/10/15.
//  Copyright © 2019 Leo. All rights reserved.
//

import UIKit

class PathCell: UITableViewCell {
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var info: UILabel!
    
    @IBOutlet weak var picImage: UIImageView!
    @IBOutlet weak var content: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setModel(model:PathModel){
        title.text = model.getTitle()
        info.text = model.getInfo()
        content.text = model.content
        picImage.downloaded(from: model.imageUrl, contentMode: .scaleAspectFill)
    }

}
