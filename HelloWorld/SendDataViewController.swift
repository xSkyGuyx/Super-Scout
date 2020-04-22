//
//  SendDataViewController.swift
//  HelloWorld
//
//  Created by Skyhlar Myers on 2/9/20.
//  Copyright © 2020 AppCoda. All rights reserved.
//

import UIKit
import MultipeerConnectivity

class SendDataViewController: UIViewController, MCSessionDelegate, MCBrowserViewControllerDelegate {
    @IBOutlet weak var teamNumbersLabel: UILabel!
    @IBOutlet weak var matchNumLabel: UILabel!
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
    
    func session(_ session: MCSession, didReceive data: Data, fromPeer peerID: MCPeerID) {
        
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
    var peerID2: MCPeerID!
    var mcSession2: MCSession!

    override func viewDidLoad() {
        super.viewDidLoad()
       peerID2 = MCPeerID(displayName: "IDevice.current.name")
       if(!isHosting){
       peerID = MCPeerID(displayName: "Scedule Send")
       mcSession = MCSession(peer: peerID, securityIdentity: nil, encryptionPreference: .required)
       mcSession.delegate = self
       mcAdvertiserAssistant = MCAdvertiserAssistant(serviceType: "ioscreator-chat", discoveryInfo: nil, session: mcSession)
           isHosting = true
           mcAdvertiserAssistant.start()

       }
        matchNumLabel.text = "Match Number: \(matchNumber)"
        // Do any additional setup after loading the view.
        if(redTeam){
            teamNumbersLabel.textColor = UIColor.red
            teamNumbersLabel.text = "\(red1) -- \(team1RatingNum) \n\n\(red2) -- \(team2RatingNum)\n\n\(red3) -- \(team3RatingNum)"
        }else{
            teamNumbersLabel.textColor = UIColor.blue
            teamNumbersLabel.text = "\(blue1) -- \(team1RatingNum) \n\n\(blue2) -- \(team2RatingNum)\n\n\(blue3) -- \(team3RatingNum)"
        }
    }
    var mcAdvertiserAssistant2: MCAdvertiserAssistant!
    var messageToSend: String!

    
    @IBAction func shareButtonPressed(_ sender: Any) {
        print(mcSession.connectedPeers)
        if(mcSession.connectedPeers.count==0){
            let ac = UIAlertController(title: "No Connected Peers", message: nil, preferredStyle: .alert)
                ac.addAction(UIAlertAction(title: "OK", style: .default))
            present(ac, animated: true)
            return;
        }
        generateMessage()
        let message = messageToSend.data(using: String.Encoding.utf8, allowLossyConversion: false)
        print(mcSession.connectedPeers)
        do {
          try mcSession.send(message!, toPeers: mcSession.connectedPeers, with: .unreliable)
            print("sent \(messageToSend)")
        }
        catch {
          print("Error sending message")
        }
    }
    
    func generateMessage(){
        if(redTeam){
            messageToSend = "*  \(matchNumber)&red&\(red1)|\(red2)|\(red3)|"
        }else{
            messageToSend = "*\(matchNumber)&blue&\(blue1)|\(blue2)|\(blue3)|"
        }
        messageToSend += "\(numOfNotEffective1)|\(numOfSlowedDown1)|\(numOfEffective1)|\(numOfShutDownDef1)|\(numOfEvades1)|\(numOfSlightlyImpacted1)|\(numOfVeryImpacted1)|\(numOfShutDown1)|\(numOfFouls1)|\(numOfTechFouls1)|\(numOfYellowCards1)|\(numOfRedCards1)|\(team1RatingNum)"
        messageToSend += "|\(numOfNotEffective2)|\(numOfSlowedDown2)|\(numOfEffective2)|\(numOfShutDownDef2)|\(numOfEvades2)|\(numOfSlightlyImpacted2)|\(numOfVeryImpacted2)|\(numOfShutDown2)|\(numOfFouls2)|\(numOfTechFouls2)|\(numOfYellowCards2)|\(numOfRedCards2)|\(team2RatingNum)"
        messageToSend += "|\(numOfNotEffective3)|\(numOfSlowedDown3)|\(numOfEffective3)|\(numOfShutDownDef3)|\(numOfEvades3)|\(numOfSlightlyImpacted3)|\(numOfVeryImpacted3)|\(numOfShutDown3)|\(numOfFouls3)|\(numOfTechFouls3)|\(numOfYellowCards3)|\(numOfRedCards3)|\(team3RatingNum)|"
        messagesSent[matchNumber] = messageToSend
        validResends.append(matchNumber)
    }

}
