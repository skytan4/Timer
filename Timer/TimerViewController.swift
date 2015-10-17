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

    override func viewDidLoad() {
        super.viewDidLoad()
        
        minutePickerView.selectRow(1, inComponent: 0, animated: false)
        
    }
    
    @IBAction func startButtonTapped() {
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
}


