//
//  DriveRatingViewController.swift
//  HelloWorld
//
//  Created by Skyhlar Myers on 2/9/20.
//  Copyright © 2020 AppCoda. All rights reserved.
//

import UIKit

var team1RatingNum = 0
var team2RatingNum = 0
var team3RatingNum = 0

class DriveRatingViewController: UIViewController {

    @IBOutlet weak var matchNumLabel: UILabel!
    @IBOutlet weak var red1Label: UILabel!
    @IBOutlet weak var red2Label: UILabel!
    @IBOutlet weak var red3Label: UILabel!
    @IBOutlet weak var red1Rating: UISegmentedControl!
    @IBOutlet weak var red2Rating: UISegmentedControl!
    @IBOutlet weak var red3Rating: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        matchNumLabel.text = "Match Number: \(matchNumber)"
        if(redTeam){
            red1Rating.tintColor = UIColor.red
            red2Rating.tintColor = UIColor.red
            red3Rating.tintColor = UIColor.red
            red1Label.text = "Red 1 - \(red1)"
            red1Label.textColor = UIColor.red
            red2Label.text = "Red 2 - \(red2)"
            red2Label.textColor = UIColor.red
            red3Label.text = "Red 3 - \(red3)"
            red3Label.textColor = UIColor.red
        }else{
                red1Rating.tintColor = UIColor.blue
                red2Rating.tintColor = UIColor.blue
                red3Rating.tintColor = UIColor.blue
                red1Label.text = "Blue 1 - \(blue1)"
                red1Label.textColor = UIColor.blue
                red2Label.text = "Blue 2 - \(blue2)"
                red2Label.textColor = UIColor.blue
                red3Label.text = "Blue 3 - \(blue3)"
                red3Label.textColor = UIColor.blue
        }
        // Do any additional setup after loading the view.
    }
    
    @IBAction func advancePressed(_ sender: Any) {
        team1RatingNum = red1Rating.selectedSegmentIndex+1
        team2RatingNum = red2Rating.selectedSegmentIndex+1
        team3RatingNum = red3Rating.selectedSegmentIndex+1
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
