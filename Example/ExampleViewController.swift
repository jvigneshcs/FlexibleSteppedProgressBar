//
//  ExampleViewController.swift
//  Example
//
//  Created by Vignesh J on 12/08/20.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import UIKit
import FlexibleSteppedProgressBar

class ExampleViewController: UIViewController {
    
    @IBOutlet private weak var progressBarWithoutLastState: FlexibleSteppedProgressBar!
    @IBOutlet private weak var stateSwitch: UISwitch!
    
    private var progressColor = UIColor(red: 64.0/255.0, green: 146.0/255.0, blue: 243.0/255.0, alpha: 1)
    private var progressCompleteColor = UIColor(red: 86.0/255.0, green: 186.0/255.0, blue: 56.0/255.0, alpha: 1)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setupProgressBarWithoutLastState()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction private func onChangeStepper(_ sender: UIStepper) {
        self.stateSwitch.setOn(false,
                               animated: true)
        self.progressBarWithoutLastState.currentIndex = Int(sender.value)
    }
    
    @IBAction private func onChangeSwitch(_ sender: UISwitch) {
        self.progressBarWithoutLastState.setNeedsDisplay()
    }
    
    private func setupProgressBarWithoutLastState() {
        
        // Customise the progress bar here
        progressBarWithoutLastState.lineHeight = 3
        progressBarWithoutLastState.delegate = self
        progressBarWithoutLastState.selectedBackgoundColor = progressColor
        progressBarWithoutLastState.selectedOuterCircleStrokeColor = .clear
        progressBarWithoutLastState.currentSelectedCenterStartedColor = progressColor
        progressBarWithoutLastState.currentSelectedCenterCompleteColor = progressCompleteColor
        progressBarWithoutLastState.centerLayerTextColor = UIColor.white
        progressBarWithoutLastState.currentSelectedTextColor = progressColor
        progressBarWithoutLastState.viewBackgroundColor = .clear
        
        progressBarWithoutLastState.currentIndex = 0
        
    }
}

extension ExampleViewController: FlexibleSteppedProgressBarDelegate {
    
    func progressBar(_ progressBar: FlexibleSteppedProgressBar, textAtIndex index: Int, position: FlexibleSteppedProgressBarTextLocation) -> String {
        switch position {
        case .center:
            return "\(index + 1)"
        default:
            return ""
        }
    }
    
    func progressBar(_ progressBar: FlexibleSteppedProgressBar, stateAtIndex index: Int) -> FSPBState {
        return (self.stateSwitch.isOn) ? .complete : .started
    }
}
