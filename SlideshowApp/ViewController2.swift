//
//  ViewController2.swift
//  SlideshowApp
//
//  Created by ICHIRO KAWATA on 2018/06/24.
//  Copyright © 2018年 ICHIRO KAWATA. All rights reserved.
//

import UIKit

class ViewController2: UIViewController {

    @IBOutlet weak var largeimageview: UIImageView!
    var x:Int = 0
    var dispImageNo = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
      displayImage()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func   displayImage(){
        
        let dispImageNo = x
       print(dispImageNo)
        let imageNameArray = [
            "images.jpeg",
            "Unknown.jpeg",
            "Unknown-1.jpeg",
            "Unknown-2.jpeg",
            ]
        
        // 表示している画像の番号から名前を取り出し
        let name = imageNameArray[dispImageNo]
        
        // 画像を読み込み
        let image = UIImage(named: name)
        
        // Image Viewに読み込んだ画像をセット
        largeimageview.image = image
    }
    
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
