//
//  ProductTableView.swift
//  UNIBOOK
//
//  Created by 仲山陽一朗 on 2016/03/15.
//  Copyright © 2016年 yoichiro nakayama. All rights reserved.
//

import UIKit

class ProductTableView: UITableView ,UITableViewDelegate, UITableViewDataSource {
   
    let productCollection = ProductCollection.sharedInstance
    override init(frame: CGRect, style: UITableViewStyle) {
        super.init(frame: frame, style: style)
        self.delegate = self
        self.dataSource = self
        self.registerNib(UINib(nibName: "ProductTableViewCell", bundle: nil), forCellReuseIdentifier: "ProductTableViewCell")
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    //セル数
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.productCollection.products.count
    }
    
//    セルの高さ
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 250
    }
    
    //セル内容
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ProductTableViewCell", forIndexPath: indexPath) as! ProductTableViewCell
        let product = self.productCollection.products[indexPath.row]
        
        cell.textname.text = product.textname
        cell.price.text = product.price
        cell.proffessor.text = product.proffesor
        cell.university.text = product.university
        cell.productimage.image = UIImage(named: "product.image")
    
        return cell
    }
    
//    let product = self.productCollection.products[indexPath.row]
//    cell.textname.text = product.textname
//    cell.price.text = product.price
//    cell.proffessor.text = product.proffesor
//    cell.university.text = product.university
//    cell.productimage.image = UIImage(named: "product.image")
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    
   


}
