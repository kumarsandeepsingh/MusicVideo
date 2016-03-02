//
//  ViewController.swift
//  MusicVideo
//
//  Created by ASHUTOSH on 29/02/16.
//  Copyright © 2016 divyatech. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var videos = [Videos]()
//    @IBOutlet var displayLabel: NSLayoutConstraint!
    
    
    @IBOutlet weak var displayLabel: UILabel!
    @IBOutlet weak var tableVIew: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableVIew.dataSource = self
        tableVIew.delegate = self
        
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector:"reachabilityStatusChanged", name: "ReachStatusChanged", object: nil)
        reachabilityStatusChanged()
        
        
        
        //call api
        
        let api  = APIManager()
        api.loadData("https://itunes.apple.com/us/rss/topmusicvideos/limit=50/json",
            completion: didLoadData)
        
        
    }

    
    func didLoadData(videos: [Videos])
        
    {
        print(reachabilityStatus)
        self.videos = videos
        for item in videos {
            print("name = \(item.vName)")
        }
        
        
        for (index , item) in videos.enumerate(){
            print("\(index) name= \(item.vName)")
        }
        tableVIew.reloadData()
//        for i in 0..<videos.count{
//            let video = videos[i]
//            print("\(i) name = \(video.vName)")
//        }
//        for var i = 0; i < videos.count; i++ {
//            let video = videos[i]
//            print("\(i) name = \(video.vName)")
//        }
    }
    
    func reachabilityStatusChanged()
    {
        switch reachabilityStatus {
        case NOACCESS : view.backgroundColor = UIColor.redColor()
            displayLabel.text = " NO Internet"
        case WIFI : view.backgroundColor = UIColor.greenColor()
            displayLabel.text = "Reachable with wifi"
        case WWAN : view.backgroundColor = UIColor.yellowColor()
            displayLabel.text = "reachable with cellular"
        default: return
            
            
        }
    }
    
    deinit {
        
        NSNotificationCenter.defaultCenter().removeObserver(self,name: "ReachStatusChanged", object: nil )
        
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return videos.count
    }
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
       let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        let video = videos[indexPath.row]
        cell.textLabel?.text = ("\(indexPath.row+1)")
        cell.detailTextLabel?.text = video.vName
        return cell
        
    }
    
        // Default is 1 if not implemented
    

}

