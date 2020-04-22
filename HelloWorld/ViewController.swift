//
//  ViewController.swift
//  HelloWorld
//
//  Created by Simon Ng on 2/8/2018.
//  Copyright © 2018 AppCoda. All rights reserved.
//

import UIKit
import Network
import MultipeerConnectivity
var red1 = ""
var red2 = ""
var red3 = ""
var blue1 = ""
var blue2 = ""
var blue3 = ""
var redTeams = [Int]()
var blueTeams = [Int]()
var isConnected = false
var matchNumber = 1
var numOfMatches = 1
var isHosting = false
var redTeam = false
var peerID: MCPeerID!
var mcSession: MCSession!
var mcAdvertiserAssistant: MCAdvertiserAssistant!
var messagesSent = Array(repeating: "", count: 100)
var validResends = [Int]()
let connectionManager = ConnectionManager()

class ViewController: UIViewController, MCSessionDelegate, MCBrowserViewControllerDelegate,
HomeModelProtocol {
        var feedItems: NSArray = NSArray()
        var selectedLocation : LocationModel = LocationModel()
        
        func itemsDownloaded(items: NSArray) {
            feedItems = items
        }
    @IBOutlet weak var allianceLabel: UILabel!
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var matchNumLabel: UILabel!
    @IBOutlet weak var redTeamLabel: UILabel!
    @IBOutlet weak var blueTeamLabel: UILabel!
    @IBOutlet weak var idSelect: UISegmentedControl!

    @IBAction func minusButton(_ sender: Any) {
    }
    
    let monitor = NWPathMonitor()

        
    let red1FileName = "red1teams"
    let red2FileName = "red2teams"
    let red3FileName = "red3teams"
    let blue1FileName = "blue1teams"
    let blue2FileName = "blue2teams"
    let blue3FileName = "blue3teams"
    let dir = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
    override func viewDidLoad() {
        super.viewDidLoad()
        if(redTeam){
            idSelect.selectedSegmentIndex = 1
            allianceLabel.text = "Red Alliance"
            allianceLabel.textColor = UIColor.red


        }
        else{
            idSelect.selectedSegmentIndex = 0
            allianceLabel.text = "Blue Alliance"
            allianceLabel.textColor = UIColor.blue
        }
        
        matchNumLabel.text = String(matchNumber)                                    
        if(!isHosting){
        peerID = MCPeerID(displayName:  "Super Scout: "+UIDevice.current.name)
        mcSession = MCSession(peer: peerID, securityIdentity: nil, encryptionPreference: .required)
        mcSession.delegate = self
        mcAdvertiserAssistant = MCAdvertiserAssistant(serviceType: "ioscreator-chat", discoveryInfo: nil, session: mcSession)
            isHosting = true
            mcAdvertiserAssistant.start()

        }
        if(blue1Array.count>0){
            red1 = red1Array[matchNumber]
            red2 = red2Array[matchNumber]
            red3 = red3Array[matchNumber]
            blue1 = blue1Array[matchNumber]
            blue2 = blue2Array[matchNumber]
            blue3 = blue3Array[matchNumber]
            redTeamLabel.text = ("\(red1) \n\n\(red2) \n\n\(red3)")
            blueTeamLabel.text = ("\(blue1) \n\n\(blue2) \n\n\(blue3)")
        }
    }
    
    
    @IBAction func loadPressed(_ sender: Any) {
        
               let homeModel = HomeModel()
               homeModel.delegate = self
               homeModel.downloadItems()
    }
    
    @IBAction func readPressed(_ sender: Any) {
        monitor.pathUpdateHandler = { path in
            if path.status == .satisfied {
                print("We're connected!")
                isConnected = true
            } else {
                print("No connection.")
                isConnected = false
            }
            self.messageToSend = "\(red1Array.dropFirst())|\(red2Array.dropFirst())|\(red3Array.dropFirst())|\(blue1Array.dropFirst())|\(blue2Array.dropFirst())|\(blue3Array.dropFirst())|"

            print(path.isExpensive)
        }
        if let fileURL = dir?.appendingPathComponent(red1FileName).appendingPathExtension("txt"){
            var inString = ""
            do{
                inString = try String(contentsOf: fileURL)
                print(inString)
            }catch{
                print("shit")
            }
//            print("read from the file \(inString)")
            red1Array = inString
                .split(separator: "\n").map{(String($0))}
            print("red 1: \(red1Array)")

        }
        if let fileURL = dir?.appendingPathComponent(red2FileName).appendingPathExtension("txt"){
                    var inString = ""
                    do{
                        inString = try String(contentsOf: fileURL)
                        print(inString)
                    }catch{
                        print("shit")
                    }
        //            print("read from the file \(inString)")
                    red2Array = inString
                        .split(separator: "\n").map{(String($0))}
                    print("red 2: \(red2Array)")

                }
        if let fileURL = dir?.appendingPathComponent(red3FileName).appendingPathExtension("txt"){
                    var inString = ""
                    do{
                        inString = try String(contentsOf: fileURL)
                        print(inString)
                    }catch{
                        print("shit")
                    }
        //            print("read from the file \(inString)")
                    red3Array = inString
                        .split(separator: "\n").map{(String($0))}
                    print("red 3: \(red3Array)")

                }
        if let fileURL = dir?.appendingPathComponent(blue1FileName).appendingPathExtension("txt"){
                    var inString = ""
                    do{
                        inString = try String(contentsOf: fileURL)
                        print(inString)
                    }catch{
                        print("shit")
                    }
        //            print("read from the file \(inString)")
                    blue1Array = inString
                        .split(separator: "\n").map{(String($0))}
                    print("blue 1: \(blue1Array)")

                }
        if let fileURL = dir?.appendingPathComponent(blue2FileName).appendingPathExtension("txt"){
                    var inString = ""
                    do{
                        inString = try String(contentsOf: fileURL)
                        print(inString)
                    }catch{
                        print("shit")
                    }
        //            print("read from the file \(inString)")
                    blue2Array = inString
                        .split(separator: "\n").map{(String($0))}
                    print("blue 2: \(blue2Array)")

                }
        if let fileURL = dir?.appendingPathComponent(blue3FileName).appendingPathExtension("txt"){
                    var inString = ""
                    do{
                        inString = try String(contentsOf: fileURL)
                        print(inString)
                    }catch{
                        print("shit")
                    }
        //            print("read from the file \(inString)")
                    blue3Array = inString
                        .split(separator: "\n").map{(String($0))}
                    print("re\(blue3Array)")

                }
        red1Array.insert("", at: 0)
        red2Array.insert("", at: 0)
        red3Array.insert("", at: 0)
        blue1Array.insert("", at: 0)
        blue2Array.insert("", at: 0)
        blue3Array.insert("", at: 0)
        numOfMatches = blue1Array.count
        red1 = red1Array[matchNumber]
        red2 = red2Array[matchNumber]
        red3 = red3Array[matchNumber]
        blue1 = blue1Array[matchNumber]
        blue2 = blue2Array[matchNumber]
        blue3 = blue3Array[matchNumber]
        redTeamLabel.text = ("\(red1) \n\n\(red2) \n\n\(red3)")
        blueTeamLabel.text = ("\(blue1) \n\n\(blue2) \n\n\(blue3)")
    }
    func writeFiles(){
        if let fileURL = dir?.appendingPathComponent(red1FileName).appendingPathExtension("txt"){
            let outString=red1String
            do{
                try outString.write(to: fileURL, atomically: true, encoding: .utf8)
            }catch{
                print("Failed to write to red1")
            }
        }
        if let fileURL = dir?.appendingPathComponent(red2FileName).appendingPathExtension("txt"){
            let outString=red2String
            do{
                try outString.write(to: fileURL, atomically: true, encoding: .utf8)
            }catch{
                print("Failed to write to red2")
            }
        }
        if let fileURL = dir?.appendingPathComponent(red3FileName).appendingPathExtension("txt"){
            let outString=red3String
            do{
                try outString.write(to: fileURL, atomically: true, encoding: .utf8)
            }catch{
                print("Failed to write to red3")
            }
        }
        if let fileURL = dir?.appendingPathComponent(blue1FileName).appendingPathExtension("txt"){
            let outString=blue1String
            do{
                try outString.write(to: fileURL, atomically: true, encoding: .utf8)
            }catch{
                print("Failed to write to blue1")
            }
        }
        if let fileURL = dir?.appendingPathComponent(blue2FileName).appendingPathExtension("txt"){
            let outString=blue2String
            do{
                try outString.write(to: fileURL, atomically: true, encoding: .utf8)
            }catch{
                print("Failed to write to blue2")
            }
        }
        if let fileURL = dir?.appendingPathComponent(blue3FileName).appendingPathExtension("txt"){
            let outString=blue3String
            do{
                try outString.write(to: fileURL, atomically: true, encoding: .utf8)
            }catch{
                print("Failed to write to blue3")
            }
        }
    }
    
    
    @IBAction func addButtonPressed(_ sender: Any) {
        if(matchNumber == 1){
            minusButton.isEnabled = false
        }else{
            minusButton.isEnabled = true
        }
        if(matchNumber == numOfMatches-1){
            plusButton.isEnabled = false
        }else{
            plusButton.isEnabled = true
        }
        if(numOfMatches>1){
        matchNumber += 1
        matchNumLabel.text = String(matchNumber)
        red1 = red1Array[matchNumber]
        red2 = red2Array[matchNumber]
        red3 = red3Array[matchNumber]
        blue1 = blue1Array[matchNumber]
        blue2 = blue2Array[matchNumber]
        blue3 = blue3Array[matchNumber]
        redTeamLabel.text = ("\(red1) \n\n\(red2) \n\n\(red3)")
        blueTeamLabel.text = ("\(blue1) \n\n\(blue2) \n\n\(blue3)")
        if(matchNumber == 1){
            minusButton.isEnabled = false
        }else{
            minusButton.isEnabled = true
        }
        if(matchNumber == numOfMatches-1){
            plusButton.isEnabled = false
        }else{
            plusButton.isEnabled = true
        }
        }
    }
    
    @IBAction func decreaseButtonPressed(_ sender: Any) {
        if(numOfMatches>1){
        matchNumber -= 1
        matchNumLabel.text = String(matchNumber)
        red1 = red1Array[matchNumber]
        red2 = red2Array[matchNumber]
        red3 = red3Array[matchNumber]
        blue1 = blue1Array[matchNumber]
        blue2 = blue2Array[matchNumber]
        blue3 = blue3Array[matchNumber]
        redTeamLabel.text = ("\(red1) \n\n\(red2) \n\n\(red3)")
        blueTeamLabel.text = ("\(blue1) \n\n\(blue2) \n\n\(blue3)")
        if(matchNumber == 1){
            minusButton.isEnabled = false
        }else{
            minusButton.isEnabled = true
        }
        if(matchNumber == numOfMatches){
            plusButton.isEnabled = false
        }else{
            plusButton.isEnabled = true
        }
    }
    }
    
    @IBAction func idChanged(_ sender: Any) {
        if(idSelect.selectedSegmentIndex == 0){
            allianceLabel.text = "Blue Alliance"
            allianceLabel.textColor = UIColor.blue
            redTeam = false
        }else if(idSelect.selectedSegmentIndex == 1){
            allianceLabel.text = "Red Alliance"
            allianceLabel.textColor = UIColor.red
            redTeam = true
        }
    }
    
    @IBAction func resendPressed(_ sender: Any) {

    }
    
    func session(_ session: MCSession, peer peerID: MCPeerID, didChange state: MCSessionState) {
        switch state {
        case .connected:
          print("Connected: \(peerID.displayName)")
        case .connecting:
          print("Connecting: \(peerID.displayName)")
        case .notConnected:
          print("Not Connected: \(peerID.displayName)")
        @unknown default:
          print("fatal error")
        }
    }
    var messageToSend: String!
    
    func session(_ session: MCSession, didReceive data: Data, fromPeer peerID: MCPeerID) {
        let message = NSString(data: data as Data, encoding: String.Encoding.utf8.rawValue)! as String
        if(message == "1"){
            let ac = UIAlertController(title: "Message Sent Successfully", message: nil, preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .default))
            present(ac, animated: true)
        }
        print(message)
    }
    
    func session(_ session: MCSession, didReceive stream: InputStream, withName streamName: String, fromPeer peerID: MCPeerID) {
        
    }
    
    func session(_ session: MCSession, didStartReceivingResourceWithName resourceName: String, fromPeer peerID: MCPeerID, with progress: Progress) {
        
    }
    
    func session(_ session: MCSession, didFinishReceivingResourceWithName resourceName: String, fromPeer peerID: MCPeerID, at localURL: URL?, withError error: Error?) {
        
    }
    
    func browserViewControllerDidFinish(_ browserViewController: MCBrowserViewController) {
        dismiss(animated: true)
    }
    
    func browserViewControllerWasCancelled(_ browserViewController: MCBrowserViewController) {
        dismiss(animated: true)
    }
    @IBAction func sendSchedulePressed(_ sender: Any) {
//        print(mcSession.connectedPeers)
        self.messageToSend = "\(red1Array.dropFirst())|\(red2Array.dropFirst())|\(red3Array.dropFirst())|\(blue1Array.dropFirst())|\(blue2Array.dropFirst())|\(blue3Array.dropFirst())|"
        if(mcSession.connectedPeers.count>0){
            let message = messageToSend.data(using: String.Encoding.utf8, allowLossyConversion: false)
            
            do {
              try mcSession.send(message!, toPeers: mcSession.connectedPeers, with: .unreliable)
            }
            catch {
              print("Error sending message")
            }
        }
        else{
                let ac = UIAlertController(title: "No Connected Peers", message: nil, preferredStyle: .alert)
                ac.addAction(UIAlertAction(title: "OK", style: .default))
            present(ac, animated: true)

        }
    }
    
    @IBAction func nextButtonPressed(_ sender: Any) {
        mcSession.disconnect()
    }
    
    
}

