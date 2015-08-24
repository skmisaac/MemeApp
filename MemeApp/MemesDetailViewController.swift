//
//  MemesDetailViewController.swift
//  MemeApp
//
//  Created by SUN Ka Meng Isaac on 24/6/15.
//  Copyright (c) 2015 SUN Ka Meng Isaac. All rights reserved.
//

import UIKit

//  This view shows up when user clicks the annotated thumbnail from table view or collection view
class MemesDetailViewController: UIViewController {
    
    var meme: Meme!
    @IBOutlet var memedImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.tabBar.hidden = true
        memedImageView.image = meme.memedImage
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        tabBarController?.tabBar.hidden = false
    }
    
}
