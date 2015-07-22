//
//  MemesDetailViewController.swift
//  MemeApp
//
//  Created by SUN Ka Meng Isaac on 24/6/15.
//  Copyright (c) 2015 SUN Ka Meng Isaac. All rights reserved.
//

import UIKit

class MemesDetailViewController: UIViewController {

    var meme: Meme?
    @IBOutlet weak var memedImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBarController?.tabBar.hidden = true
        memedImageView.image = meme?.memedImage
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.tabBar.hidden = false
    }
}
