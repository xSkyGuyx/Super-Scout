//
//  ReSendViewController.swift
//  HelloWorld
//
//  Created by Skyhlar Myers on 2/10/20.
//  Copyright © 2020 AppCoda. All rights reserved.
//

import UIKit
import MultipeerConnectivity

class ReSendViewController: UIViewController, MCSessionDelegate, MCBrowserViewControllerDelegate {
    @IBOutlet weak var matchNumTextBox: UITextField!
    @IBOutlet weak var sendDataPressed: UIButton!
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
    

    override func viewDidLoad() {
        super.viewDidLoad()
        peerID = MCPeerID(displayName: UIDevice.current.name)
        mcSession = MCSession(peer: peerID, securityIdentity: nil, encryptionPreference: .required)
        mcSession.delegate = self
        sendDataPressed.isEnabled = false
        // Do any additional setup after loading the view.
    }
    var peerID: MCPeerID!
    var mcSession: MCSession!
    var mcAdvertiserAssistant: MCAdvertiserAssistant!
    var messageToSend: String!
    var selectedMatchNum = 0

    
    @IBAction func sendDataPressed(_ sender: Any) {
        messageToSend = messagesSent[selectedMatchNum]
        let message = messageToSend.data(using: String.Encoding.utf8, allowLossyConversion: false)
        
        do {
          try self.mcSession.send(message!, toPeers: self.mcSession.connectedPeers, with: .unreliable)
        }
        catch {
          print("Error sending message")
        }
    }
    
    @IBAction func matchNumChanged(_ sender: Any) {
        if(validResends.firstIndex(of: Int(matchNumTextBox!.text!) ?? 9999) != nil &&  validResends.firstIndex(of: Int(matchNumTextBox!.text!) ?? 9999) != 9999){
            selectedMatchNum = Int(matchNumTextBox.text!) ?? 9999
            if(self.mcSession.connectedPeers.count>0){
            sendDataPressed.isEnabled = true
            }
        }else{
            let ac = UIAlertController(title: "Invalid Selection", message: nil, preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .default))
            sendDataPressed.isEnabled = false
        }
    
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
