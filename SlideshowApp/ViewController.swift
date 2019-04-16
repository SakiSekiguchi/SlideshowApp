//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 関口 咲季 on 2019/04/15.
//  Copyright © 2019 saki.sekiguchi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var charaView: UIImageView!
    
    @IBOutlet weak var nextButton: UIButton!
    
    @IBOutlet weak var backButton: UIButton!
    
    @IBOutlet weak var aniButton: UIButton!
    
    
    var  timer: Timer!
    
    
    //クリックカウント
    var clickNumber:Int! = 0
    
    
    //イラスト配列
    var imageArray : Array<UIImage> = []
    
    //表示画像の番号
    var dispImageNo:Int! = 0
    
    func displayImage() {
        //画像配列
        let imageArray:[String] = [
            "sozai01",
            "sozai02",
            "sozai03",
            "sozai04",
            "sozai05",
            "sozai06",
            "sozai07",
            "sozai08",
        ]
        
        //範囲チェック
        if dispImageNo < 0{
            dispImageNo = 7
        }
        if dispImageNo > 7{
            dispImageNo = 0
        }
        
        //画像番号から名前を取り出し
        let imageName:String = imageArray[dispImageNo]
        //画像読み込み
        let image = UIImage(named: imageName)
        //読み込んだ画像をセット
        charaView.image = image
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //初期画像表示
        let image = UIImage(named: "sozai01")
        charaView.image = image
    
    }
    

    @IBAction func goNext(_ sender: Any) {
        //番号をプラスして表示
        dispImageNo += 1
        displayImage()
    }
    
    @IBAction func goBack(_ sender: Any) {
        //番号をマイナスして表示
        dispImageNo -= 1
        displayImage()
        
    }
    
    @IBAction func moveButton(_ sender: Any) {
        //戻る、進む無効
        nextButton.isEnabled = false
        backButton.isEnabled = false
        
        //カウントアップ
        clickNumber = clickNumber + 1
        
        //タイマー設定
        if self.timer == nil{
            
            timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(ViewController.imageTimer), userInfo: nil, repeats: true)
            
        }
        
        if(clickNumber % 2 == 1){
            
            imageTimer()
            
            //ボタンテキスト変更
            aniButton.setTitle("停止", for: .normal)
            
            //メッセージ
            
            
        }else if(clickNumber % 2 == 0){
            //戻る、進む有効
            nextButton.isEnabled = true
            backButton.isEnabled = true
            
            //ボタンテキスト変更
            aniButton.setTitle("再生", for: .normal)
            
            if self.timer != nil{
                timer.invalidate()
            }
            
        }else{
            
        }
        
    }
    
    @objc func imageTimer(){
        
        dispImageNo += 1
        displayImage()
        
    }
    
    //ImageViewで画面遷移
    @IBAction func tapAction(_ sender: Any) {
        
        self.performSegue(withIdentifier: "toNextView", sender: nil)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let next:NextViewController = segue.destination as! NextViewController
        next.selectedImage = self.charaView.image
        
    }
    
    
}

