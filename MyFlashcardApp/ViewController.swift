//
//  ViewController.swift
//  MyFlashcardApp
//
//  Created by iD Student on 7/4/17.
//  Copyright © 2017 iDTech. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet weak var questionTextView: UITextView!
    
    @IBOutlet weak var answerPickerView: UIPickerView!
    
    @IBAction func submitButtonPressed(_ sender: Any) {
        var alert: UIAlertController
        if CardCollection.instance.checkAnswer(answerPickerView.selectedRow(inComponent: 0)) {
            
        }
    }
    @IBOutlet weak var questionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setupCardUI()
        answerPickerView.dataSource = self
        answerPickerView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupCardUI() {
        questionTextView.text = CardCollection.instance.currentCard.question
        
        questionLabel.text = "Question \(CardCollection.instance.currentIndex + 1)/\(CardCollection.instance.cards.count)"
    }

    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return CardCollection.instance.currentCard.options.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return CardCollection.instance.currentCard.options[row];
    }
}

