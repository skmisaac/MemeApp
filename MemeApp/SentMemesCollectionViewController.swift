//
//  SentMemesCollectionViewController.swift
//  MemeApp
//
//  Created by SUN Ka Meng Isaac on 22/6/15.
//  Copyright (c) 2015 SUN Ka Meng Isaac. All rights reserved.
//

import Foundation
import UIKit

//  This is a tabBar View embedded with a CollectionView and TableView Controller
//  to show user saved meme image.
//  When the user select any meme image, the app pushes the detail meme view to the scene.

class SentMemesCollectionViewController: UIViewController, UICollectionViewDataSource {
    var memes: ([Meme]!)

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var flowLayout: UICollectionViewFlowLayout!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Collection View Flow Layout - Settings
        let space: CGFloat = 3.0
        var dimension = (self.view.frame.size.width - (2 * space)) / 3.0
        
        flowLayout.minimumInteritemSpacing = space
        flowLayout.itemSize = CGSizeMake(dimension, dimension)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        memes = ((UIApplication.sharedApplication().delegate) as! AppDelegate).memes
        
        tabBarController?.tabBar.hidden = false
        collectionView.dataSource = self
        collectionView.reloadData()
    }
    
    // MARK: - UICollectionViewDataSource delegate methods
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return memes!.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("MemeCollectionViewCell", forIndexPath: indexPath) as! CustomMemeCell

        let meme = memes![indexPath.row]
        let imageView = UIImageView(image: meme.memedImage)
        cell.backgroundView = imageView
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let detailViewController = navigationController?.storyboard!.instantiateViewControllerWithIdentifier("MemesDetailViewController") as! MemesDetailViewController
        detailViewController.meme = memes![indexPath.row]
        navigationController!.pushViewController(detailViewController, animated: true)
    }    
}