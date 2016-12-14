//
//  ViewController.swift
//  JOCStopwatch
//
//  Created by Lisa Cook on 9/1/16.
//  Copyright © 2016 Lisa Cook. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {

    @IBOutlet var splitTimerLabel: UILabel!
    @IBOutlet var cumTimerLabel: UILabel!
//    @IBOutlet var timeDisplay: UITextView!
    @IBOutlet var startStopButton: UIButton!
    
    var splitCount = 0
    var cumCount = 0
    var timerRunning = false
    var timer = NSTimer()
    var splitTimes = [Int]()
    var pointsArray = [Int]()
    var points = Int()
    
    @IBAction func startTimer() {
        if timerRunning == false {
            timerRunning = true
            timer = NSTimer.scheduledTimerWithTimeInterval(0.6, target: self, selector: (#selector(ViewController.incrementTimer)), userInfo: nil, repeats: true)
            startStopButton.setTitle("Stop", forState: .Normal)
            startStopButton.backgroundColor = UIColor(red: 255/255, green: 93/255, blue: 30/255, alpha: 1)
        } else if timerRunning == true {
            timer.invalidate()
            timerRunning = false
            splitTimes.append(splitCount)
            displayPoints()
            splitCount = 0
            addPoints()
            startStopButton.setTitle("Start", forState: .Normal)
            startStopButton.backgroundColor = UIColor(red: 6/255, green: 201/255, blue: 4/255, alpha: 1)
        }
    }
    @IBAction func resetTimer() {
        timer.invalidate()
        splitCount = 0
        cumCount = 0
        timerRunning = false
        splitTimerLabel.text = "Individual Time: 0\(splitCount)"
        splitTimes = []
        cumTimerLabel.text = "Cumulative Time: 0\(cumCount)"
//        timeDisplay.text = ""
    }
//    @IBAction func displayTimes() {
//        var results = "Times \n"
//        for (splitCount) in splitTimes {
//            if splitCount < 10 {
//                results += "0\(splitCount)\n"
//            } else {
//                results += "\(splitCount)\n"
//            }
//        }
//        timeDisplay.text = results
//    }
    @IBAction func splitTimer() {
        splitTimes.append(splitCount)
        displayPoints()
        splitCount = 0
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        splitTimerLabel.text = "Individual Time: 0\(splitCount)"
        cumTimerLabel.text = "Cumulative Time: 0\(cumCount)"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func incrementTimer() {
        splitCount += 1
        if splitCount < 10 {
           splitTimerLabel.text = "Individual Time: 0\(splitCount)"
        } else {
            splitTimerLabel.text = "Individual Time: \(splitCount)"
        }
        cumCount += 1
        if cumCount < 10 {
            cumTimerLabel.text = "Cumulative Time: 0\(cumCount)"
        } else {
            cumTimerLabel.text = "Cumulative Time: \(cumCount)"
        }
    }
    func displayPoints() {
        if (splitCount <= 9) {
            points = 3
        }
        if (10 ... 19 ~= splitCount) {
            points = 2
        }
        if (20 ..< 30 ~= splitCount) {
            points = 1
        }
        if (splitCount >= 30) {
            points = 0
        }
        pointsArray.append(points)
    }
    func addPoints() {
        let pointsTotal = pointsArray.reduce(0, combine: +)
        print(pointsTotal)
    }
}

