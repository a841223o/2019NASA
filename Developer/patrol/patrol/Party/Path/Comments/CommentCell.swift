//
//  CommentCell.swift
//  patrol
//
//  Created by DOWN LUNYOU on 2019/10/16.
//  Copyright © 2019 Leo. All rights reserved.
//

import UIKit

class CommentCell: UITableViewCell {


    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var content: UILabel!
    @IBOutlet weak var date: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        self.contentView.backgroundColor  = UIColor.white
        // Configure the view for the selected state
    }
    
    func setModel(model : CommentModel){
        userImageView.downloaded(from: model.userImageUrl, contentMode: .scaleAspectFill)
        name.text = model.userName
        date.text = model.date
        content.text = model.content
    }

}
