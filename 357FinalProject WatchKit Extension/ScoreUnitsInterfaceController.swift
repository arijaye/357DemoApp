//
//  ScoreUnitsInterfaceController.swift
//  demo WatchKit Extension
//

import Foundation
import WatchKit

class ScoreUnitsInterfaceController: WKInterfaceController {
    @IBOutlet weak var selectionLabel: WKInterfaceLabel!
    @IBOutlet weak var unitsPicker: WKInterfacePicker!
    
    var selection: Int = 1
    
    var unitOptions: [WKPickerItem]? = (0...100).map {
        let unitOption = WKPickerItem()
        unitOption.title = "\($0)"
        return unitOption
    }
    
    var settingsScoreUnitsLabel: WKInterfaceLabel?
    var settingsInterface: SettingsInterfaceController?

    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        unitsPicker.setItems(unitOptions)
        
        if let settings = context as? SettingsInterfaceController {
            if let label = settings.scoreUnitsLabel {
                settingsInterface = settings
                settingsScoreUnitsLabel = label
            }
        }
    }

    @IBAction func unitSelected(_ value: Int){
        let selectedUnit = unitOptions![value]
        if let unitValue = Int(selectedUnit.title!) {
            selection = unitValue
            selectionLabel.setText("Score Units: \(selection)")
        }
    }
    
    @IBAction func clickSave() {
        settingsInterface?.units = selection
        settingsScoreUnitsLabel?.setText("Score Units: \(selection)")
        self.pop()
    }
}
