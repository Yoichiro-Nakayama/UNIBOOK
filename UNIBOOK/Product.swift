//
//  Product.swift
//  UNIBOOK
//
//  Created by 仲山陽一朗 on 2016/03/16.
//  Copyright © 2016年 yoichiro nakayama. All rights reserved.
//

import UIKit

enum send: String {
    case college = "大学で手渡し"
    case send200 = "配送200~300円"
    case send300 = "配送300~500円"
}

enum sendmoney: String {
    case seller = "販売者負担"
    case buyer = "買い手負担"
    case college = "大学で手渡し"
}


enum unit: String {
    case law = "法学部"
    case commerce = "商学部"
    case economics = "経済学部"
    case literature = "文学部"
    case policy = "総合政策学部"
    case other = "その他"
}


class Product: NSObject {
     var university = ""
     var textname = ""
     var proffesor = ""
     var productdetail = ""
     var price = ""
     var imageFromCameraRoll = UIImage()
     var method = ""
     var cost = ""
     var belongs = ""

}