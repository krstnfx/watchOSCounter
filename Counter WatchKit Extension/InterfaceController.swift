//
//  InterfaceController.swift
//  Counter WatchKit Extension
//
//  Created by Thai, Kristina on 9/18/16.
//
//

import WatchKit
import Foundation
//2 - Import Watch Connectivity
import WatchConnectivity

//3 - Replace your class InterfaceController with this line:
class InterfaceController: WKInterfaceController, WCSessionDelegate {

    @IBOutlet var counterLabel: WKInterfaceLabel!
    
    //1 - Create a variable for your counter
    var counter = 0
    
    //4 - Set up Watch Connectivity
    private let session : WCSession? = WCSession.isSupported() ? WCSession.default() : nil
    
    override init() {
        super.init()
        
        session?.delegate = self
        session?.activate()
    }
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        
    }
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

    //5 - Setup your saveCounter() function
    @IBAction func saveCounter() {
        let applicationData = ["counterValue" : counter]
        
        // The paired iPhone has to be connected via Bluetooth.
        if let session = session, session.isReachable {
            session.sendMessage(applicationData,
                replyHandler: { replyData in
                    // handle reply from iPhone app here
                    print(replyData)
                }, errorHandler: { error in
                    // catch any errors here
                    print(error)
            })
        } else {
            // when the iPhone is not connected via Bluetooth
        }
    }
    
    //6 - Setup your incrementCounter() function
    @IBAction func incrementCounter() {
        counter+=1;
        counterLabel.setText(String(counter))
    }
}
