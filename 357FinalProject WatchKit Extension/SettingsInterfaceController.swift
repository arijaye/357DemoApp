//
//  SettingsInterfaceController.swift
//  demo
//

import Foundation
import WatchKit

class SettingsInterfaceController: WKInterfaceController {
        var teamOneNameLabel: WKInterfaceLabel?
        var teamTwoNameLabel: WKInterfaceLabel?
        
        var teamOneName: String = ""
        var teamTwoName: String = ""

        var units: Int = 1
        var mainInterface: InterfaceController?
    
        @IBOutlet weak var scoreUnitsLabel: WKInterfaceLabel!
        
        override func awake(withContext context: Any?) {
            super.awake(withContext: context)
            
            if let main = context as? InterfaceController {
                if let teamOne = main.teamOneNameLabel {
                    if let teamTwo = main.teamTwoNameLabel {
                        mainInterface = main
                        teamOneNameLabel = teamOne
                        teamTwoNameLabel = teamTwo
                        self.units = main.scoreUnits
                    }
                }
            }
            
            self.scoreUnitsLabel.setText("Score Units: \(self.units)")
        }
    
    @IBAction func teamOneNameChanged(_ value: NSString?){
        if let name = value {
            if name.length > 0 {
                    teamOneName = name as String
            }
        }
    }
    
    @IBAction func teamTwoNameChanged(_ value: NSString?) {
        if let name = value {
            if name.length > 0 {
                teamTwoName = name as String
            }
        }
    }

    @IBAction func saveClicked() {
        mainInterface?.scoreUnits = self.units
        
        if(teamOneName.count > 0){
            teamOneNameLabel?.setText(teamOneName)
        }

        if(teamTwoName.count > 0){
            teamTwoNameLabel?.setText(teamTwoName)
        }
        
        self.pop()
    }
    
    override func contextForSegue(withIdentifier segueIdentifier: String) -> Any? {
        return self
    }


}
