//
//  TriviaAnswersController.swift
//  UnitTestingLab
//
//  Created by Amy Alsaydi on 12/3/19.
//  Copyright © 2019 Amy Alsaydi. All rights reserved.
//

import UIKit

class TriviaAnswersController: UIViewController {
    
    
    @IBOutlet weak var questionnLabel: UILabel!
    @IBOutlet weak var buttonA: UIButton!
    @IBOutlet weak var buttonB: UIButton!
    @IBOutlet weak var buttonC: UIButton!
    @IBOutlet weak var buttonD: UIButton!
    @IBOutlet var buttons: [UIButton]!
    @IBOutlet weak var messageLabel: UILabel!
    
    
    
    var triviaQuestion: TriviaQuestion?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        displayQuestion()
        buttons.map{ $0.isEnabled = true }
        messageLabel.text = ""
        
    }
    
    func displayQuestion() {
        
        guard let theQuestion = triviaQuestion else {fatalError("error")}
        questionnLabel.text = theQuestion.question.removingPercentEncoding
        
        
        var options = [String]()
        options.append(theQuestion.correct_answer.removingPercentEncoding ?? "")
        theQuestion.incorrect_answers.map {options.append($0.removingPercentEncoding ?? "")}
        options = options.shuffled()
        
        // if answer is true or false
        
        if options.count == 2 {
            buttonA.setTitle(options[0],for: .normal)
            buttonB.setTitle(options[1], for: .normal)
            buttonC.borderColor = .clear
            buttonD.borderColor = .clear
            buttonC.isEnabled = false
            buttonD.isEnabled = false 
        }
        
        if options.count > 2 {
            buttonA.setTitle(options[0],for: .normal)
            buttonB.setTitle(options[1], for: .normal)
            buttonC.setTitle(options[2], for: .normal)
            buttonD.setTitle(options[3], for: .normal)
            
        }
    }
    
    // Actions:
    
    @IBAction func answerSelected(_ sender: UIButton) {
        let answer = sender.titleLabel?.text ?? ""
        guard let theQuestion = triviaQuestion else {fatalError("error")}
        
        buttons.map{ $0.isEnabled = false }
        
        if answer == theQuestion.correct_answer.removingPercentEncoding {
            messageLabel.text = "Correct 🥳"
            view.backgroundColor = .green
            
        } else {
            messageLabel.text = "Wrong 👎🏼 The correct answer was \(theQuestion.correct_answer.removingPercentEncoding ?? ""), DUH"
            view.backgroundColor = .red
        }
    }
}

// Added to allow the buttons to be rounded
@IBDesignable extension UIButton {

    @IBInspectable var borderWidth: CGFloat {
        set {
            layer.borderWidth = newValue
        }
        get {
            return layer.borderWidth
        }
    }

    @IBInspectable var cornerRadius: CGFloat {
        set {
            layer.cornerRadius = newValue
        }
        get {
            return layer.cornerRadius
        }
    }

    @IBInspectable var borderColor: UIColor? {
        set {
            guard let uiColor = newValue else { return }
            layer.borderColor = uiColor.cgColor
        }
        get {
            guard let color = layer.borderColor else { return nil }
            return UIColor(cgColor: color)
        }
    }
}
