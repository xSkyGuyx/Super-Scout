import UIKit
import MultipeerConnectivity
class mpc: NSObject, MCSessionDelegate {

    var peerID:MCPeerID!
    var session:MCSession!
    var browser:MCBrowserViewController!
    var advertiser:MCAdvertiserAssistant? = nil

    func setupPeerWithDisplayName (displayName:String){
        peerID = MCPeerID(displayName: displayName)
    }

    func setupSession(){
        session = MCSession(peer: peerID)
        session.delegate = self
    }

    func setupBrowser(){
        browser = MCBrowserViewController(serviceType: "ADDCONNECTIONNAME", session: session)

    }

    func advertiseSelf(advertise:Bool){
        if advertise{
            advertiser = MCAdvertiserAssistant(serviceType: "ADDCONNECTIONNAME", discoveryInfo: nil, session: session)
            advertiser!.start()
        }else{
            advertiser!.stop()
            advertiser = nil
        }
    }

    func sendData (variable: String, data: AnyObject, sendTo: AnyObject){
        //Send Data
        let archived = NSKeyedArchiver.archivedData(withRootObject: [variable : data])
        do{
            try session.send(archived, toPeers: session.connectedPeers, with: .unreliable)
        }catch _ as NSError {
            print("Error: Cannot send Message.")
        }

    }

    func session(_ session: MCSession, peer peerID: MCPeerID, didChange state: MCSessionState) {

    }

    func session(session: MCSession, didReceiveData data: NSData, fromPeer peerID: MCPeerID) {
    //Receive Data
        DispatchQueue.global(priority: DISPATCH_QUEUE_PRIORITY_DEFAULT).async() {
            let archived = NSKeyedUnarchiver.unarchiveObjectWithData(data as Data) as! Dictionary<String, AnyObject>

            if archived.indexForKey("Variable1") != nil {
                let data = archived["Variable1"] //as! [String],Int,Bool...

            }else if archived.indexForKey("Variable2") != nil {
                let data = archived["Variable2"] //as! [String],Int,Bool...
            }
        }
    }

    func session(session: MCSession, didFinishReceivingResourceWithName resourceName: String, fromPeer peerID: MCPeerID, atURL localURL: NSURL, withError error: NSError?) {

    }

    func session(_ session: MCSession, didStartReceivingResourceWithName resourceName: String, fromPeer peerID: MCPeerID, with progress: Progress) {

    }

    func session(_ session: MCSession, didReceive stream: InputStream, withName streamName: String, fromPeer peerID: MCPeerID) {

    }
}
