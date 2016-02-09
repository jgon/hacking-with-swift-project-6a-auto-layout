//
//  ViewController.swift
//  P2GuessTheFlag
//
//  Created by Jacques on 24/11/15.
//  Copyright © 2015 J4SOFT. All rights reserved.
//

import UIKit
import GameKit

class ViewController: UIViewController {

    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    
    var countries = [String]()
    var score = 0
    var correctAnswer = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        countries.append("estonia")
//        countries.append("france")
//        countries.append("germany")
//        countries.append("ireland")
//        countries.append("italy")
//        countries.append("monaco")
//        countries.append("nigeria")
//        countries.append("poland")
//        countries.append("russia")
//        countries.append("spain")
//        countries.append("uk")
//        countries.append("us")
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        
        setupButtonAppearance(button1)
        setupButtonAppearance(button2)
        setupButtonAppearance(button3)
        
        askQuestion()
    }
    
    func setupButtonAppearance(button: UIButton) {
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.lightGrayColor().CGColor
    }
    
    func askQuestion() {
        countries = GKRandomSource.sharedRandom().arrayByShufflingObjectsInArray(countries) as! [String]
        correctAnswer =  GKRandomSource.sharedRandom().nextIntWithUpperBound(3)
        button1.setImage(UIImage(named: countries[0]), forState: .Normal)
        button2.setImage(UIImage(named: countries[1]), forState: .Normal)
        button3.setImage(UIImage(named: countries[2]), forState: .Normal)
        title = countries[correctAnswer].uppercaseString
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func buttonTapped(sender: UIButton) {
        var title: String
        if sender.tag == correctAnswer {
            title = "Correct"
            ++score
        } else {
            title = "Wrong"
            --score
        }
        let alert = UIAlertController(title: title, message: "Your score is \(score)", preferredStyle: UIAlertControllerStyle.Alert)
        
        // Cannot convert value of type '() -> ()' to expected argument type '((UIAlertAction) -> Void)?'
//      let alertAction = alert.addAction(UIAlertAction(title: title, style: UIAlertActionStyle.Default, handler: askQuestion))
        
        let alertAction = UIAlertAction(title: "Continue", style: UIAlertActionStyle.Default) { (UIAlertAction) -> Void in
            self.askQuestion()
        }

        alert.addAction(alertAction)
        presentViewController(alert, animated: true, completion: nil)
    }
}

