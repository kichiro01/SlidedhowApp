//
//  ViewController.swift
//  SlideshowApp
//
//  Created by ICHIRO KAWATA on 2018/06/24.
//  Copyright © 2018年 ICHIRO KAWATA. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var bottonlabel: UIButton!
    @IBOutlet weak var imageview: UIImageView!
    var timer :Timer!
    var dispImageNo = 0
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let image = UIImage(named: "images.jpeg")
        imageview.image = image
        
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //スライド画像の設定
    func   displayImage(){
        
        let imageNameArray = [
            "images.jpeg",
            "Unknown.jpeg",
            "Unknown-1.jpeg",
            "Unknown-2.jpeg",
            ]
        
        // 画像の番号が正常な範囲を指しているかチェック

        if dispImageNo < 0 {
            dispImageNo = 3
        }
        
        // 範囲より上を指している場合、最初の画像を表示
        if dispImageNo > 3 {
            dispImageNo = 0
        }
        
        // 表示している画像の番号から名前を取り出し
        let name = imageNameArray[dispImageNo]
        
        // 画像を読み込み
        let image = UIImage(named: name)
        
        // Image Viewに読み込んだ画像をセット
        imageview.image = image
    }
    
    //スライド再生の処理
    @objc func slide(timer:Timer){
         dispImageNo += 1
          displayImage()
    }
    
    //再生ボタンの処理
    @IBAction func timer(_ sender: Any) {
        if self.timer == nil{
        self.timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(slide), userInfo: nil, repeats: true)
             bottonlabel.setTitle("停止", for: [])
        }
        else {
            self.timer.invalidate()
            self.timer = nil
            bottonlabel.setTitle("再生", for: [])

        }
    }
    
    //進むボタンの処理
    @IBAction func forward(_ sender: Any) {
        if self.timer == nil {
            dispImageNo += 1
            displayImage()
        }
    }
    //戻るボタンの処理
    @IBAction func back(_ sender: Any) {
        if self.timer == nil {
            dispImageNo -= 1
            displayImage()
        }
    }
      //画像タップ時の処理
  
 
    
    @IBAction func tap(_ sender: UITapGestureRecognizer) {
          performSegue(withIdentifier: "closeup", sender: dispImageNo)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // segueから遷移先のViewController2を取得する
        let resultViewController:ViewController2 = segue.destination as! ViewController2
        // 遷移先のViewController2で宣言しているx, yに値を代入して渡す
        resultViewController.x = dispImageNo
    }
  
   
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
        // 他の画面から segue を使って戻ってきた時に呼ばれる
    }
    
}

