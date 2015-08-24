//
//  SentMemesTableViewController.swift
//  MemeApp
//
//  Created by SUN Ka Meng Isaac on 3/7/15.
//  Copyright (c) 2015 SUN Ka Meng Isaac. All rights reserved.
//

import UIKit

//  This table view loads stored Meme image in the AppDelegate

class SentMemesTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var memes: ([Meme]!)
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        memes = ((UIApplication.sharedApplication().delegate) as! AppDelegate).memes
        tableView.delegate = self
        tableView.reloadData()
    }
    
    // MARK: - UITableViewDataSource delegate methods
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memes!.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("MemeTableViewCell", forIndexPath: indexPath) as! UITableViewCell

        let meme = memes![indexPath.item]
        
        cell.textLabel?.text = meme.topText
        cell.detailTextLabel?.text = meme.bottomText
        cell.imageView?.image = meme.memedImage
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let detailViewController = self.navigationController?.storyboard!.instantiateViewControllerWithIdentifier("MemesDetailViewController") as! MemesDetailViewController
        detailViewController.meme = memes![indexPath.item]
        navigationController!.pushViewController(detailViewController, animated: true)
        tableView.reloadData()
    }
}
