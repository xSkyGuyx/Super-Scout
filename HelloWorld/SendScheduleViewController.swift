//
//  SendScheduleViewController.swift
//  HelloWorld
//
//  Created by Skyhlar Myers on 2/10/20.
//  Copyright © 2020 AppCoda. All rights reserved.
//

import UIKit
import MultipeerConnectivity

class SendScheduleViewController: UIViewController, MCSessionDelegate, MCBrowserViewControllerDelegate {
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
    var peerID: MCPeerID!
    var mcSession: MCSession!
    var mcAdvertiserAssistant: MCAdvertiserAssistant!
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
    

    override func viewDidLoad() {
        super.viewDidLoad()
        super.viewDidLoad()
        peerID = MCPeerID(displayName: UIDevice.current.name)
        mcSession = MCSession(peer: peerID, securityIdentity: nil, encryptionPreference: .required)
        mcSession.delegate = self
        // Do any additional setup after loading the view.
    }
    

    @IBAction func connectPressed(_ sender: Any) {
        mcAdvertiserAssistant = MCAdvertiserAssistant(serviceType: "ioscreator-chat", discoveryInfo: nil, session: mcSession)
        mcAdvertiserAssistant.start()
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func sendDataPressed(_ sender: Any) {
        messageToSend = "\(red1Array)|\(red2Array)|\(red3Array)|\(blue1Array)|\(blue2Array)|\(blue3Array)|"
        let message = messageToSend.data(using: String.Encoding.utf8, allowLossyConversion: false)
        
        do {
          try self.mcSession.send(message!, toPeers: self.mcSession.connectedPeers, with: .unreliable)
        }
        catch {
          print("Error sending message")
        }
    }
    
}
