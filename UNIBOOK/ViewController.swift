//
//  ViewController.swift
//  UNIBOOK
//
//  Created by 仲山陽一朗 on 2016/03/15.
//  Copyright © 2016年 yoichiro nakayama. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIScrollViewDelegate {
    @IBOutlet weak var HeadScrollView: UIScrollView!
    @IBOutlet weak var sitesScrollView: UIScrollView!
      var tabButtons:Array<UIButton> = []
    let blue = UIColor(red: 92.0 / 255, green: 192.0 / 255, blue: 210.0 / 255, alpha: 1.0)
    let yellow = UIColor(red: 105.0 / 255, green: 207.0 / 255, blue: 153.0 / 255, alpha: 1.0)
    let red = UIColor(red: 195.0 / 255, green: 123.0 / 255, blue: 175.0 / 255, alpha: 1.0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
         sitesScrollView.delegate = self
         //sitesScrollViewのサイズを指定
        self.sitesScrollView.contentSize = CGSizeMake(self.view.frame.width * 6, self.sitesScrollView.frame.height)
        self.sitesScrollView.pagingEnabled = true
        
         //HeadScrollViewのサイズを指定
        self.HeadScrollView.contentSize = CGSizeMake(self.view.frame.width * 2, self.HeadScrollView.frame.height)
        self.HeadScrollView.pagingEnabled = true
        
        //ProductTableViewのインスタンスを生成
        setProductTableView(0)
        setProductTableView(self.view.frame.width)
        setProductTableView(self.view.frame.width*2)
        setProductTableView(self.view.frame.width*3)
        setProductTableView(self.view.frame.width*4)
        setProductTableView(self.view.frame.width*5)
        //HeadScrollViwのボタンインスタンスを生成
                 setTabButton(self.view.center.x/2, text: "法学部",color: blue, tag: 1)
        setTabButton(self.view.center.x, text: "商学部", color: red,tag: 2)
        setTabButton(self.view.center.x*3/2, text: "経済学部",color: yellow, tag: 3)
        setTabButton(self.view.center.x*5/2, text: "文学部",color: blue, tag: 4)
        setTabButton(self.view.center.x*6/2, text: "総合政策学部",color: red, tag: 5)
        setTabButton(self.view.center.x*7/2, text: "その他",color: yellow, tag: 6)
        
          setSelectedButton(tabButtons[0], selected: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func setProductTableView(x: CGFloat){
        let frame = CGRectMake(x, 0, self.view.frame.width, sitesScrollView.frame.height)
        let productTableView = ProductTableView(frame: frame, style: UITableViewStyle.Plain)
        self.sitesScrollView.addSubview(productTableView)
    }
     //HeadScrollViwのボタンを指定
    func setTabButton(x: CGFloat, text: String, color: UIColor, tag: Int){
        let tabButton = UIButton()
        tabButton.frame.size = CGSizeMake(80, 20)
        tabButton.center = CGPointMake(x, 22)
        tabButton.setTitle(text, forState: UIControlState.Normal)
        tabButton.setTitleColor(color, forState: UIControlState.Selected)
        tabButton.titleLabel?.font = UIFont(name: "HirakakuProN-W6", size: 13)
        tabButton.setTitleColor(UIColor.grayColor(), forState: UIControlState.Normal)
        tabButton.titleLabel?.font = UIFont(name: "HirakakuProN-W6", size: 13)
        tabButton.tag = tag
        tabButton.addTarget(self, action: "tapTabButton:", forControlEvents: UIControlEvents.TouchUpInside)
        tabButton.layer.masksToBounds = true
        self.HeadScrollView.addSubview(tabButton)
        tabButtons.append(tabButton)
      }
    
    
    
    func tapTabButton(sender: UIButton){
        let pointX = self.view.frame.width * CGFloat(sender.tag - 1)
        sitesScrollView.setContentOffset(CGPointMake(pointX, 0), animated: true)
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        if sitesScrollView.contentOffset.x == 0 {
            setSelectedButton(tabButtons[0], selected: true)
            setSelectedButton(tabButtons[1], selected: false)
            setSelectedButton(tabButtons[2], selected: false)
            setSelectedButton(tabButtons[3], selected: false)
            setSelectedButton(tabButtons[4], selected: false)
            setSelectedButton(tabButtons[5], selected: false)
        } else if sitesScrollView.contentOffset.x == self.view.frame.width {
            setSelectedButton(tabButtons[0], selected: false)
            setSelectedButton(tabButtons[1], selected: true)
            setSelectedButton(tabButtons[2], selected: false)
            setSelectedButton(tabButtons[3], selected: false)
            setSelectedButton(tabButtons[4], selected: false)
            setSelectedButton(tabButtons[5], selected: false)
           
        } else if sitesScrollView.contentOffset.x == self.view.frame.width * 2 {
            setSelectedButton(tabButtons[0], selected: false)
            setSelectedButton(tabButtons[1], selected: false)
            setSelectedButton(tabButtons[2], selected: true)
            setSelectedButton(tabButtons[3], selected: false)
            setSelectedButton(tabButtons[4], selected: false)
            setSelectedButton(tabButtons[5], selected: false)
           
        } else if sitesScrollView.contentOffset.x == self.view.frame.width * 3 {
            setSelectedButton(tabButtons[0], selected: false)
            setSelectedButton(tabButtons[1], selected: false)
            setSelectedButton(tabButtons[2], selected: false)
            setSelectedButton(tabButtons[3], selected: true)
            setSelectedButton(tabButtons[4], selected: false)
            setSelectedButton(tabButtons[5], selected: false)
        } else if sitesScrollView.contentOffset.x == self.view.frame.width * 4 {
            setSelectedButton(tabButtons[0], selected: false)
            setSelectedButton(tabButtons[1], selected: false)
            setSelectedButton(tabButtons[2], selected: false)
            setSelectedButton(tabButtons[3], selected: false)
            setSelectedButton(tabButtons[4], selected: true)
            setSelectedButton(tabButtons[5], selected: false)
        } else if sitesScrollView.contentOffset.x == self.view.frame.width * 5 {
            setSelectedButton(tabButtons[0], selected: false)
            setSelectedButton(tabButtons[1], selected: false)
            setSelectedButton(tabButtons[2], selected: false)
            setSelectedButton(tabButtons[3], selected: false)
            setSelectedButton(tabButtons[4], selected: false)
            setSelectedButton(tabButtons[5], selected: true)
        }
    }
    

    func setSelectedButton(button: UIButton, selected: Bool) {
       button.selected = selected    }


func scrollViewDidEndScrollingAnimation(scrollView: UIScrollView) {
    //#自動スクロールによってスクロールが終了されたタイミングで行いたい処理を記述
    if sitesScrollView.contentOffset.x == 0 {
        setSelectedButton(tabButtons[0], selected: true)
        setSelectedButton(tabButtons[1], selected: false)
        setSelectedButton(tabButtons[2], selected: false)
        setSelectedButton(tabButtons[3], selected: false)
        setSelectedButton(tabButtons[4], selected: false)
        setSelectedButton(tabButtons[5], selected: false)
    } else if sitesScrollView.contentOffset.x == self.view.frame.width {
        setSelectedButton(tabButtons[0], selected: false)
        setSelectedButton(tabButtons[1], selected: true)
        setSelectedButton(tabButtons[2], selected: false)
        setSelectedButton(tabButtons[3], selected: false)
        setSelectedButton(tabButtons[4], selected: false)
        setSelectedButton(tabButtons[5], selected: false)
        
    } else if sitesScrollView.contentOffset.x == self.view.frame.width * 2 {
        setSelectedButton(tabButtons[0], selected: false)
        setSelectedButton(tabButtons[1], selected: false)
        setSelectedButton(tabButtons[2], selected: true)
        setSelectedButton(tabButtons[3], selected: false)
        setSelectedButton(tabButtons[4], selected: false)
        setSelectedButton(tabButtons[5], selected: false)
        
    } else if sitesScrollView.contentOffset.x == self.view.frame.width * 3 {
        setSelectedButton(tabButtons[0], selected: false)
        setSelectedButton(tabButtons[1], selected: false)
        setSelectedButton(tabButtons[2], selected: false)
        setSelectedButton(tabButtons[3], selected: true)
        setSelectedButton(tabButtons[4], selected: false)
        setSelectedButton(tabButtons[5], selected: false)
    } else if sitesScrollView.contentOffset.x == self.view.frame.width * 4 {
        setSelectedButton(tabButtons[0], selected: false)
        setSelectedButton(tabButtons[1], selected: false)
        setSelectedButton(tabButtons[2], selected: false)
        setSelectedButton(tabButtons[3], selected: false)
        setSelectedButton(tabButtons[4], selected: true)
        setSelectedButton(tabButtons[5], selected: false)
    } else if sitesScrollView.contentOffset.x == self.view.frame.width * 5 {
        setSelectedButton(tabButtons[0], selected: false)
        setSelectedButton(tabButtons[1], selected: false)
        setSelectedButton(tabButtons[2], selected: false)
        setSelectedButton(tabButtons[3], selected: false)
        setSelectedButton(tabButtons[4], selected: false)
        setSelectedButton(tabButtons[5], selected: true)
    }
}
    
}



