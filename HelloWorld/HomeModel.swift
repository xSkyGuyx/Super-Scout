//
//  HomeModel.swift
//  SuperScoutStoryboard
//
//  Created by Skyhlar Myers on 1/27/20.
//  Copyright © 2020 Skyhlar Myers. All rights reserved.
//

import UIKit
import Foundation

protocol HomeModelProtocol: class {
    func itemsDownloaded(items: NSArray)
}
let location = LocationModel()
var red1Array = [String]()
var red2Array = [String]()
var red3Array = [String]()
var blue1Array = [String]()
var blue2Array = [String]()
var blue3Array = [String]()
var red1String = ""
var red2String = ""
var red3String = ""
var blue1String = ""
var blue2String = ""
var blue3String = ""

class HomeModel: NSObject {
    weak var delegate: HomeModelProtocol!
    
    var data = Data()
    
    let urlPath: String = "---INSERT PHP LINK---"
    
    func downloadItems(){
        let url: URL = URL(string: urlPath)!;
        let defaultSession = Foundation.URLSession(configuration: URLSessionConfiguration.default)
        
        let task = defaultSession.dataTask(with: url){ (data,response,error)
            in
            if error != nil{
                print("failed to download data")
            }else{
                print("Data Downloaded")
                self.parseJSON(data!)
            }
        }
        task.resume()
    }
    
    func parseJSON(_ data:Data){
        var jsonResult = NSArray()
        
        do{
            jsonResult = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments) as! NSArray
        }catch let error as NSError{
            print(error)
        }
        
        var jsonElement = NSDictionary()
        let locations = NSMutableArray()
        
        for i in 0 ..< jsonResult.count{
            jsonElement = jsonResult[i] as! NSDictionary
            
            if let name = jsonElement["Match Number"] as? String,
                let red1 = jsonElement["Red 1"] as? String,
                let red2 = jsonElement["Red 2"] as? String,
                let red3 = jsonElement["Red 3"] as? String,
                let blue1 = jsonElement["Blue 1"] as? String,
                let blue2 = jsonElement["Blue 2"] as? String,
                let blue3 = jsonElement["Blue 3"] as? String{
                print("loop activated")
                location.matchNumber = name
                location.red1 = red1
                location.red2 = red2
                location.red3 = red3
                location.blue1 = blue1
                location.blue2 = blue2
                location.blue3 = blue3
                red1Array.append(location.red1)
                red2Array.append(location.red2)
                red3Array.append(location.red3)
                blue1Array.append(location.blue1)
                blue2Array.append(location.blue2)
                blue3Array.append(location.blue3)
                red1String = red1String + String(Int(red1)!) + "\n"
                red2String = red2String + String(Int(red2)!) + "\n"
                red3String = red3String + String(Int(red3)!) + "\n"
                blue1String = blue1String + String(Int(blue1)!) + "\n"
                blue2String = blue2String + String(Int(blue2)!) + "\n"
                blue3String = blue3String + String(Int(blue3)!) + "\n"
            }
            else{
                print("failed")
            }
            locations.add(location)
        }
        DispatchQueue.main.async(execute: {() -> Void in self.delegate.itemsDownloaded(items: locations)})
        ViewController().writeFiles()
    }
    
}
