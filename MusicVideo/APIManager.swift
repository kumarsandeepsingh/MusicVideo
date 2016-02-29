//
//  APIManager.swift
//  MusicVideo
//
//  Created by ASHUTOSH on 29/02/16.
//  Copyright © 2016 divyatech. All rights reserved.
//

import Foundation

class APIManager{

    func loadData(urlString: String, completion: [Videos] -> Void  ) {
        
        let config = NSURLSessionConfiguration.ephemeralSessionConfiguration()
        let session = NSURLSession(configuration: config)
        
        
//        let session = NSURLSession.sharedSession()
        let url = NSURL(string: urlString)!
        let task = session.dataTaskWithURL(url)
            {
                (data, response , error ) -> Void in
                 dispatch_async(dispatch_get_main_queue())
                    {
                        if error != nil{
                            
                            print(error!.localizedDescription)
                            
                            
                                        }
                        else
                        {
                            
//                            print(data)
//                            do{
//                                if let json = try NSJSONSerialization.JSONObjectWithData(data!, options: .AllowFragments) as? JSONDictionary
//                                {
//                                    print(json)
//                                    let priority = DISPATCH_QUEUE_PRIORITY_HIGH
//                                    dispatch_async(dispatch_get_global_queue(priority, 0))
//                                        {
//                                            dispatch_async(dispatch_get_main_queue())
//                                                {
//                                                    completion(result: "JSONSerialization Successful")
//                                                }
//                                      }
//                                    
//                                }
//                                
//                            }
//                            catch
//                            {
//                                dispatch_async(dispatch_get_main_queue())
//                                    {
//                                        completion(result: "error in NSJSONSerialization")
//                                    }
//                            }
                            
                            do{
                                
                            
                    if let json = try NSJSONSerialization.JSONObjectWithData(data!, options: .AllowFragments ) as? JSONDictionary,
                            feed = json["feed"] as? JSONDictionary,
                            entries = feed["entry"] as? JSONArray
                            {
                                var videos = [Videos]()
                                for entry in entries {
                                    let entry = Videos(data: entry as! JSONDictionary)
                                    videos.append(entry)
                                    
                                }
                                let i = videos.count
                                print("itunes \(i)")
                                print(" ")
                                let priority = DISPATCH_QUEUE_PRIORITY_DEFAULT
                                dispatch_async(dispatch_get_global_queue(priority, 0)){
                                    dispatch_async(dispatch_get_main_queue()){
                                        completion(videos)
                                    }
                                }
                            }
                           
                        }
                        catch
                        {
                            print("error iin NSJSONSerializatio")
                        }
                }
        }
    }
        
        task.resume()
  }
}