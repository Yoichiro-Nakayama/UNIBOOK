//
//  ProductTableViewCell.swift
//  UNIBOOK
//
//  Created by 仲山陽一朗 on 2016/03/15.
//  Copyright © 2016年 yoichiro nakayama. All rights reserved.
//

import UIKit

class ProductTableViewCell: UITableViewCell {
    @IBOutlet weak var productimage: UIImageView!
    @IBOutlet weak var textname: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var proffessor: UILabel!
    @IBOutlet weak var university: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func detail(sender: UIButton) {
        let detail = UIButton()
        detail.backgroundColor = UIColor.blueColor()
        detail.layer.cornerRadius = 5
    }
}


 