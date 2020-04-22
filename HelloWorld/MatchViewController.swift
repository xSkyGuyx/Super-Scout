//
//  MatchViewController.swift
//  HelloWorld
//
//  Created by Skyhlar Myers on 2/9/20.
//  Copyright © 2020 AppCoda. All rights reserved.
//

import UIKit
var selectedButton = 0
var numOfFouls1 = 0
var numOfTechFouls1 = 0
var numOfYellowCards1 = 0
var numOfRedCards1 = 0
var numOfEvades1 = 0
var numOfSlightlyImpacted1 = 0
var numOfVeryImpacted1 = 0
var numOfShutDown1 = 0
var numOfNotEffective1 = 0
var numOfSlowedDown1 = 0
var numOfEffective1 = 0
var numOfShutDownDef1 = 0
var numOfFouls2 = 0
var numOfTechFouls2 = 0
var numOfYellowCards2 = 0
var numOfRedCards2 = 0
var numOfEvades2 = 0
var numOfSlightlyImpacted2 = 0
var numOfVeryImpacted2 = 0
var numOfShutDown2 = 0
var numOfNotEffective2 = 0
var numOfSlowedDown2 = 0
var numOfEffective2 = 0
var numOfShutDownDef2 = 0
var numOfFouls3 = 0
var numOfTechFouls3 = 0
var numOfYellowCards3 = 0
var numOfRedCards3 = 0
var numOfEvades3 = 0
var numOfSlightlyImpacted3 = 0
var numOfVeryImpacted3 = 0
var numOfShutDown3 = 0
var numOfNotEffective3 = 0
var numOfSlowedDown3 = 0
var numOfEffective3 = 0
var numOfShutDownDef3 = 0
class MatchViewController: UIViewController {

    @IBOutlet weak var modeButton: UILabel!
    @IBOutlet weak var notEffectiveButton: UIButton!
    @IBOutlet weak var slowedDownButton: UIButton!
    @IBOutlet weak var effectiveButton: UIButton!
    @IBOutlet weak var shutDownButton: UIButton!
    @IBOutlet weak var teamNumberLabel: UILabel!
    @IBOutlet weak var blue3Button: UIButton!
    @IBOutlet weak var blue2Button: UIButton!
    @IBOutlet weak var blue1Button: UIButton!
    @IBOutlet weak var defenderButton: UIButton!
    @IBOutlet weak var resistorButton: UIButton!
    @IBOutlet weak var foulButton: UIButton!
    @IBOutlet weak var normalFoulButton: UIButton!
    @IBOutlet weak var techFoulButton: UIButton!
    @IBOutlet weak var yellowCardFoul: UIButton!
    @IBOutlet weak var redCardFoul: UIButton!
    @IBOutlet weak var evadedButton: UIButton!
    @IBOutlet weak var slightlyImpactedButton: UIButton!
    @IBOutlet weak var highlyButtonPressed: UIButton!
    @IBOutlet weak var shutDownResistButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        hideShit()
        teamNumberLabel.isHidden = true
        defenderButton.isHidden = true
        resistorButton.isHidden = true
        foulButton.isHidden = true
        blue1Button.layer.borderWidth = 5
        blue2Button.layer.borderWidth = 5
        blue3Button.layer.borderWidth = 5
        defenderButton.layer.borderWidth = 5
        resistorButton.layer.borderWidth = 5
        foulButton.layer.borderWidth = 5
        
        if(!redTeam){
            modeButton.textColor = UIColor.blue
            teamNumberLabel.textColor = UIColor.blue
            blue1Button.setTitle(blue1, for: .normal)
            blue2Button.setTitle(blue2, for: .normal)
            blue3Button.setTitle(blue3, for: .normal)
            blue1Button.setTitleColor(UIColor.blue, for: .normal)
            blue2Button.setTitleColor(UIColor.blue, for: .normal)
            blue3Button.setTitleColor(UIColor.blue, for: .normal)
            blue1Button.layer.borderColor = UIColor.blue.cgColor
            blue2Button.layer.borderColor = UIColor.blue.cgColor
            blue3Button.layer.borderColor = UIColor.blue.cgColor
            defenderButton.setTitleColor(UIColor.blue, for: .normal)
            resistorButton.setTitleColor(UIColor.blue, for: .normal)
            foulButton.setTitleColor(UIColor.blue, for: .normal)
            defenderButton.layer.borderColor = UIColor.blue.cgColor
            resistorButton.layer.borderColor = UIColor.blue.cgColor
            foulButton.layer.borderColor = UIColor.blue.cgColor
        }else{
            modeButton.textColor = UIColor.red
            teamNumberLabel.textColor = UIColor.red
            blue1Button.setTitle(red1, for: .normal)
            blue2Button.setTitle(red2, for: .normal)
            blue3Button.setTitle(red3, for: .normal)
            blue1Button.setTitleColor(UIColor.red, for: .normal)
            blue2Button.setTitleColor(UIColor.red, for: .normal)
            blue3Button.setTitleColor(UIColor.red, for: .normal)
            blue1Button.layer.borderColor = UIColor.red.cgColor
            blue2Button.layer.borderColor = UIColor.red.cgColor
            blue3Button.layer.borderColor = UIColor.red.cgColor

            defenderButton.setTitleColor(UIColor.red, for: .normal)
            resistorButton.setTitleColor(UIColor.red, for: .normal)
            foulButton.setTitleColor(UIColor.red, for: .normal)
            defenderButton.layer.borderColor = UIColor.red.cgColor
            resistorButton.layer.borderColor = UIColor.red.cgColor
            foulButton.layer.borderColor = UIColor.red.cgColor
        }
        // Do any additional setup after loading the view.
    }
    
    @IBAction func blue1Pressed(_ sender: Any) {
        hideShit()
        teamNumberLabel.isHidden = false
        if(redTeam){
            teamNumberLabel.text = red1
        }else{
            teamNumberLabel.text = blue1
        }
        selectedButton = 1
        defenderButton.isHidden = false
        resistorButton.isHidden = false
        foulButton.isHidden = false
        
    }
    
    @IBAction func blue2Pressed(_ sender: Any) {
        hideShit()
        teamNumberLabel.isHidden = false
        if(redTeam){
            teamNumberLabel.text = red2
        }else{
            teamNumberLabel.text = blue2
        }
        selectedButton = 2
        defenderButton.isHidden = false
        resistorButton.isHidden = false
        foulButton.isHidden = false
    }
    @IBAction func blue3Pressed(_ sender: Any) {
        hideShit()
        teamNumberLabel.isHidden = false
        if(redTeam){
            teamNumberLabel.text = red3
        }else{
            teamNumberLabel.text = blue3
        }
        selectedButton = 3
        defenderButton.isHidden = false
        resistorButton.isHidden = false
        foulButton.isHidden = false
    }
    @IBAction func resistorButtonPressed(_ sender: Any) {
        hideShit()
        modeButton.isHidden = false
        modeButton.text = "Resistance"
        evadedButton.isHidden = false
        slightlyImpactedButton.isHidden = false
        highlyButtonPressed.isHidden = false
        shutDownResistButton.isHidden = false
    }
    func hideShit(){
        normalFoulButton.isHidden = true
        techFoulButton.isHidden = true
        yellowCardFoul.isHidden = true
        redCardFoul.isHidden = true
        notEffectiveButton.isHidden = true
        slowedDownButton.isHidden = true
        effectiveButton.isHidden = true
        shutDownButton.isHidden = true
        evadedButton.isHidden = true
        slightlyImpactedButton.isHidden = true
        highlyButtonPressed.isHidden = true
        shutDownResistButton.isHidden = true
        modeButton.isHidden = true
    }
    @IBAction func defenderPushed(_ sender: Any) {
        modeButton.text = "Defense"
        hideShit()
        modeButton.isHidden = false
        notEffectiveButton.isHidden = false
        slowedDownButton.isHidden = false
        effectiveButton.isHidden = false
        shutDownButton.isHidden = false
    }
    
    // MARK: - Navigation
     @IBAction func foulButtonPressed(_ sender: Any) {
        hideShit()
        modeButton.isHidden = false
        modeButton.text = "Foul"
        normalFoulButton.isHidden = false
        techFoulButton.isHidden = false
        yellowCardFoul.isHidden = false
        redCardFoul.isHidden = false
     }
    
    //Variable Buttons
    @IBAction func normalFoulPressed(_ sender: Any) {
        if(selectedButton == 1){
            numOfFouls1 += 1
        }else if(selectedButton == 2){
            numOfFouls2 += 1
        }else if(selectedButton == 3){
            numOfFouls3 += 1
        }
        hideShit()
    }
    
    @IBAction func techFoulPressed(_ sender: Any) {
        if(selectedButton == 1){
            numOfTechFouls1 += 1
        }else if(selectedButton == 2){
            numOfTechFouls2 += 1
        }else if(selectedButton == 3){
            numOfTechFouls3 += 1
        }
        hideShit()
    }
    
    @IBAction func yellowCardPressed(_ sender: Any) {
        if(selectedButton == 1){
            numOfYellowCards1 += 1
        }else if(selectedButton == 2){
            numOfYellowCards2 += 1
        }else if(selectedButton == 3){
            numOfYellowCards3 += 1
        }
        hideShit()
    }
    @IBAction func redCardPressed(_ sender: Any) {
        if(selectedButton == 1){
            numOfRedCards1 += 1
        }else if(selectedButton == 2){
            numOfRedCards2 += 1
        }else if(selectedButton == 3){
            numOfRedCards3 += 1
        }
        hideShit()
    }
    @IBAction func notEffectivePressed(_ sender: Any) {
        if(selectedButton == 1){
            numOfNotEffective1 += 1
        }else if(selectedButton == 2){
            numOfNotEffective2 += 1
        }else if(selectedButton == 3){
            numOfNotEffective3 += 1
        }
        hideShit()
    }
    
    @IBAction func slowedDownPressed(_ sender: Any) {
        if(selectedButton == 1){
            numOfSlowedDown1 += 1
        }else if(selectedButton == 2){
            numOfSlowedDown2 += 1
        }else if(selectedButton == 3){
            numOfSlowedDown3 += 1
        }
        hideShit()
    }
    
    @IBAction func effectiveButtonPressed(_ sender: Any) {
        if(selectedButton == 1){
            numOfEffective1 += 1
        }else if(selectedButton == 2){
            numOfEffective2 += 1
        }else if(selectedButton == 3){
            numOfEffective3 += 1
        }
        hideShit()
    }
    @IBAction func shutDownPressed(_ sender: Any) {
        if(selectedButton == 1){
            numOfShutDownDef1 += 1
        }else if(selectedButton == 2){
            numOfShutDownDef2 += 1
        }else if(selectedButton == 3){
            numOfShutDownDef3 += 1
        }
        hideShit()
    }
    
    @IBAction func evadedPressed(_ sender: Any) {
        if(selectedButton == 1){
            numOfEvades1 += 1
        }else if(selectedButton == 2){
            numOfEvades2 += 1
        }else if(selectedButton == 3){
            numOfEvades3 += 1
        }
        hideShit()
    }
    @IBAction func veryImpactfulPressed(_ sender: Any) {
        if(selectedButton == 1){
            numOfVeryImpacted1 += 1
        }else if(selectedButton == 2){
            numOfVeryImpacted2 += 1
        }else if(selectedButton == 3){
            numOfVeryImpacted3 += 1
        }
        hideShit()
    }
    
    @IBAction func shutDownResistanceButton(_ sender: Any) {
        if(selectedButton == 1){
            numOfShutDown1 += 1
        }else if(selectedButton == 2){
            numOfShutDown2 += 1
        }else if(selectedButton == 3){
            numOfShutDown3 += 1
        }
        hideShit()
    }
    
    @IBAction func slightlyImpactedPressed(_ sender: Any) {
        if(selectedButton == 1){
            numOfSlightlyImpacted1 += 1
        }else if(selectedButton == 2){
            numOfSlightlyImpacted2 += 1
        }else if(selectedButton == 3){
            numOfSlightlyImpacted3 += 1
        }
        hideShit()
    }
}
