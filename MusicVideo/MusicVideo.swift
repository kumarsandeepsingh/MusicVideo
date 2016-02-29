//
//  File.swift
//  MusicVideo
//
//  Created by ASHUTOSH on 29/02/16.
//  Copyright © 2016 divyatech. All rights reserved.
//

import Foundation

class Videos {
    
    //data Encapsulation 
    
//    private var _vName:String
//    private var _vImageUrl:String
//    private var _vVideoUrl:String
    
//       
//    //make a getter
//    var vName: String
//        {
//        return _vName
//    }
//    
//    var vImageUrl:String
//        {
//        return _vImageUrl
//    }
//    
//    var vVideoUrl:String
//        {
//        return _vVideoUrl
//    }
//    
//    
//    init (data: JSONDictionary)
//    {
//        //if se do not initialize all properties we will get error message 
//        // return from initiallizer without initializing all sored properties 
//        
//        
//        // Video name 
//        
//        if let name = data["im:name"] as? JSONDictionary,
//        vName = name["label"] as? String
//        {
//            self._vName = vName
//        }
//        else
//        {
//            // you may not always get data back from the json - you may want to display massage 
//            //element in the json is unexpeced
//            _vName = ""
//            
//        }
//        
//        //the video image
//        
//        if let img = data["im:image"] as? JSONArray,
//        image = img[2] as? JSONDictionary,
//            immage = image["label"] as? String{
//                _vImageUrl = immage.stringByReplacingOccurrencesOfString("100*100", withString: "600*600")
//                
//        }
//        else
//        {
//            //
//            _vImageUrl = ""
//            
//        }
//        // the video url
//        
//        
//        if let video = data["link"] as? JSONArray,
//        //vUrl = video[1] as? JSONDictionary,
//        vUrl = video[1] as? JSONDictionary,
//        vHref = vUrl["attributs"] as? JSONDictionary,
//        vVideoUrl = vHref["href"] as? String
//        {
//            self._vVideoUrl = vVideoUrl
//        }
//        else
//        {
//            _vVideoUrl = ""
//            
//        }
//        
//        
    
    //}
    
    // data encapsulation
    
    private var _vName:String
    private var _vRights:String
    private var _vPrice:String
    private var _vImageUrl:String
    private var _vArtist:String
    private var _vVideoUrl:String
    private var _vImid:String
    private var _vGenre:String
    private var _vLinkToiTunes:String
    private var _vReleaseDte:String
    
    //
    var vImageData:NSData?
    
    //Make a getter
    
    var vName: String{
        return _vName
    }
    
    var vRights: String{
        return _vRights
    }
    
    var vPrice: String{
        return _vPrice
    }
    
    var vImageUrl: String{
        return _vImageUrl
    }
    
    var vArtist: String{
        return _vArtist
    }
    
    var vVideoUrl:String{
        return _vVideoUrl
    }
    
    var vImid:String{
        return _vImid
    }
    
    var vGenre:String{
        return _vGenre
    }
    
    var vLinkToiTunes:String{
        return _vLinkToiTunes
    }
    var vReleasDte:String{
        return _vReleaseDte
    }
    
    init (data: JSONDictionary) {
        //if we do not initialize all poperties se sill get error message 
        //return from initializer without initializing all stored proprrties 
        
        //video name
        
        if let name = data["im:name"] as? JSONDictionary,
            vName = name["label"] as? String{
                self._vName = vName
        }
        else{
            // you may not always get back from the json - you may want to display
//            message
            //element in the json is unespected
            
            _vName  = ""
        
        }
        
        // the studio name
        
        if let rights = data["rights"] as? JSONDictionary,
            vRights = rights["label"] as? String{
                self._vRights = vRights
        }
        
        else
        {
           _vRights = ""
        }
        
        // the price
        
        if let price = data["im:price"] as? JSONDictionary,
        vPrice = price["label"] as? String
        {
            self._vPrice = vPrice
        }
        else
        {
            _vPrice = ""
        }
        
        
        // the video image
        
        if let img = data["im:image"] as? JSONArray,
        image = img[2] as? JSONDictionary,
        immage = image["label"] as? String
        {
            _vImageUrl = immage.stringByReplacingOccurrencesOfString("100*100", withString: "600*600")
        }
        else
        {
            _vImageUrl = ""
            
        }
        
        
        // the artist name 
        
        if let artist = data["im:artist"]   as? JSONDictionary,
            vArtist = artist["label"] as? String{
                self._vArtist = vArtist
        }
        else
        {
            _vArtist = ""
            
        }
        
        // video Url 
        if let video = data["link"] as? JSONArray,
        vUrl  = video[1] as? JSONDictionary,
        vHref = vUrl["attributes"] as? JSONDictionary,
        vVideoUrl = vHref["href"] as? String
        {
            self._vVideoUrl = vVideoUrl
        }
        else {
            
            _vVideoUrl = ""
        }
        
        //
        
        //the atrist id for itunes search api
         if let imid = data["id"] as? JSONDictionary,
        vid = imid["attributes"] as? JSONDictionary,
            vImid = vid["im:id"] as? String{
                self._vImid = vImid
        }
        
        else
         {
            _vImid = ""
        }
        
        
        // the genre 
        if let genre = data["category"] as? JSONDictionary,
        rel2 = genre["attributes"] as? JSONDictionary,
        vGenre = rel2["term"] as? String
        {
            self._vGenre = vGenre
        }
        
        else
        {
            _vGenre = ""
        }
        
        //video link to itues 
        if let release2 = data["id"] as? JSONDictionary,
        vLinkToiTunes = release2["label"] as? String
        {
            self._vLinkToiTunes = vLinkToiTunes
        }
        else{
            _vLinkToiTunes = ""
        }
        
        //THE RELEASE DATE
            if let release2 = data["im:releaseDate"] as? JSONDictionary,
                rel2 = release2["attributes"] as? JSONDictionary,
                vReleasDte = rel2["label"] as? String
            {
                    self._vReleaseDte = vReleasDte
        }
        else
            {
                _vReleaseDte = ""
        }
    }

}