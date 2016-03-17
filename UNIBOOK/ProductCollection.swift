//
//  ProductCollection.swift
//  UNIBOOK
//
//  Created by 仲山陽一朗 on 2016/03/16.
//  Copyright © 2016年 yoichiro nakayama. All rights reserved.
//

import UIKit

class ProductCollection: NSObject {
    //    シングルトン定義
    static let sharedInstance = ProductCollection()

    var products:[Product] = []
    
    func fetchProducts() {
        let product = Product()
        self.products.append(product)
    }
    
    func addTodoCollection(product: Product){
        self.products.append(product)
       
    }

}
