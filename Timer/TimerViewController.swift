//
//  TimerViewController.swift
//  Timer
//
//  Updated by Taylor Mott on 10/16/15.
//  Copyright © 2015 DevMountain. All rights reserved.
//

import UIKit

class TimerViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var hourPickerView: UIPickerView!
    @IBOutlet weak var minutePickerView: UIPickerView!
    @IBOutlet weak var pauseButton: UIButton!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var pickerStackView: UIStackView!
    @IBOutlet weak var progressView: UIProgressView!
    
    var totalSecondsSetOnTimer = Int(0)
    
    let timer = Timer()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "updateTimerBasedViews", name: Timer.kTimerSecondTickNotification, object: timer)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "timerComplete", name: Timer.kTimerCompleteNotification, object: timer)
        
        minutePickerView.selectRow(1, inComponent: 0, animated: false)
        
        view.layoutIfNeeded()
        
        pauseButton.layer.cornerRadius = pauseButton.bounds.height / 2
        pauseButton.layer.masksToBounds = true
        pauseButton.layer.borderWidth = 2.0
        pauseButton.layer.borderColor = UIColor.blueColorTimer().CGColor
        
        startButton.layer.cornerRadius = startButton.bounds.height / 2
        startButton.layer.masksToBounds = true
        startButton.layer.borderWidth = 2.0
        startButton.layer.borderColor = UIColor.lightBlueColorTimer().CGColor
    }
    
    @IBAction func startButtonTapped() {
        if timer.isOn {
            //user wants to cancel timer
            timer.stopTimer()
            pickerStackView.hidden = false
            timerLabel.hidden = true
            progressView.hidden = true
            startButton.setTitle("Start", forState: .Normal)
            
            startButton.setTitleColor(UIColor.lightBlueColorTimer(), forState: .Normal)
            startButton.layer.borderColor = UIColor.lightBlueColorTimer().CGColor
            pauseButton.setTitleColor(UIColor.blueColorTimer(), forState: .Normal)
            pauseButton.layer.borderColor = UIColor.blueColorTimer().CGColor
            
        } else {
            timerLabel.hidden = false
            progressView.setProgress(0.0, animated: false)
            progressView.hidden = false
            pickerStackView.hidden = true
            startButton.setTitle("Cancel", forState: .Normal)
            
            startButton.setTitleColor(UIColor.blueColorTimer(), forState: .Normal)
            startButton.layer.borderColor = UIColor.blueColorTimer().CGColor
            pauseButton.setTitleColor(UIColor.lightBlueColorTimer(), forState: .Normal)
            pauseButton.layer.borderColor = UIColor.lightBlueColorTimer().CGColor
            
            let hours = hourPickerView.selectedRowInComponent(0)
            let minutes = minutePickerView.selectedRowInComponent(0) + (hours * 60)
            totalSecondsSetOnTimer = minutes * 60
            
            timer.setTime(NSTimeInterval(totalSecondsSetOnTimer))
            updateTimerBasedViews()
            timer.startTimer()
        }
        
    }
    
    @IBAction func pauseButtonTapped(sender: UIButton) {
    }

    //MARK: - UIPickerView Data Source
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == hourPickerView {
            return 24
        } else {
            return 60
        }
    }
    
    //MARK: - UIPickerView Delegate
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return String(row)
    }
    
    //MARK: - Update Helper Methods
    
    func updateTimerLabel() {
        
        timerLabel.text = timer.timerString()
    }
    
    func updateProgressView() {
        
        let secondsElasped = totalSecondsSetOnTimer - Int(timer.seconds)
        let progress = Float(secondsElasped) / Float(totalSecondsSetOnTimer)
        
        progressView.setProgress(progress, animated: true)
        
    }
    
    func updateTimerBasedViews() {
        updateTimerLabel()
        updateProgressView()
    }
    
    func timerComplete() {
        pickerStackView.hidden = false
        timerLabel.hidden = true
        progressView.hidden = true
        startButton.setTitle("Start", forState: .Normal)
        
        startButton.setTitleColor(UIColor.lightBlueColorTimer(), forState: .Normal)
        startButton.layer.borderColor = UIColor.lightBlueColorTimer().CGColor
        pauseButton.setTitleColor(UIColor.blueColorTimer(), forState: .Normal)
        pauseButton.layer.borderColor = UIColor.blueColorTimer().CGColor
    }
    
}


