//
//  ViewController.swift
//  MusicVideo
//
//  Created by ASHUTOSH on 29/02/16.
//  Copyright © 2016 divyatech. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var videos = [Videos]()
    override func viewDidLoad() {
        super.viewDidLoad()
        //call api
        let api  = APIManager()
        api.loadData("https://itunes.apple.com/us/rss/topmusicvideos/limit=10/json",
            completion: didLoadData)
        
        
    }

    func didLoadData(videos: [Videos])
        
    {
        self.videos = videos
        for item in videos {
            print("name = \(item.vName)")
        }
        
        
        for (index , item) in videos.enumerate(){
            print("\(index) name= \(item.vName)")
        }
//        for i in 0..<videos.count{
//            let video = videos[i]
//            print("\(i) name = \(video.vName)")
//        }
//        for var i = 0; i < videos.count; i++ {
//            let video = videos[i]
//            print("\(i) name = \(video.vName)")
//        }
    }
    
    
}

