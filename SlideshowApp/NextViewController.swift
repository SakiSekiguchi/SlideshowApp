//
//  NextViewController.swift
//  SlideshowApp
//
//  Created by 関口 咲季 on 2019/04/15.
//  Copyright © 2019 saki.sekiguchi. All rights reserved.
//

import UIKit

class NextViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    
    var selectedImage:UIImage!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.imageView.image = self.selectedImage
        
        
    }
    
    @IBAction func backButtom(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
