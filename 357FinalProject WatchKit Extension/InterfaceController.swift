//
//  InterfaceController.swift
//  demo WatchKit Extension
//

import WatchKit
import Foundation

class InterfaceController: WKInterfaceController {

    @IBOutlet weak var teamOneNameLabel: WKInterfaceLabel!
    @IBOutlet weak var teamTwoNameLabel: WKInterfaceLabel!
    
    @IBOutlet weak var teamOneButton: WKInterfaceButton!
    @IBOutlet weak var teamTwoButton: WKInterfaceButton!
    
    var teamOneScore: Int = 0
    var teamTwoScore: Int = 0
    
    var scoreUnits: Int = 1
    override func awake(withContext context: Any?) {
        // Configure interface objects here.
    }
    
    @IBAction func teamOneButtonClicked() {
        teamOneScore += scoreUnits
        teamOneButton.setTitle("\(teamOneScore)")
    }
    
    @IBAction func teamTwoButtonClicked() {
        teamTwoScore += scoreUnits
        teamTwoButton.setTitle("\(teamTwoScore)")
    }
    
    @IBAction func teamOneDecrement() {
        teamOneScore -= scoreUnits
        teamOneButton.setTitle("\(teamOneScore)")
    }
    
    @IBAction func teamTwoDecrement() {
        teamTwoScore -= scoreUnits
        teamTwoButton.setTitle("\(teamTwoScore)")
    }
    
    @IBAction func resetClicked() {
        teamOneScore = 0
        teamTwoScore = 0
        teamOneButton.setTitle("\(teamOneScore)")
        teamTwoButton.setTitle("\(teamTwoScore)")
    }
    
    override func contextForSegue(withIdentifier segueIdentifier: String) -> Any? {
        return self
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
    }

}
