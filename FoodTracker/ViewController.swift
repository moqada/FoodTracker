//
//  ViewController.swift
//  FoodTracker
//
//  Created by Masahiko Okada on 2015/10/02.
//
//

import UIKit

class ViewController: UIViewController {

    // MARK: Properties
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var mealNameLabel: UILabel!


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    // MARK: Actions
    @IBAction func setDefaultLabelText(sender: UIButton) {
        nameTextField.text = "Default text"
    }
}

