//
//  RatingControl.swift
//  FoodTracker
//
//  Created by Masahiko Okada on 2015/10/03.
//
//

import UIKit

class RatingControl: UIView {
    // MARK: Initialization
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 44, height: 44))
        button.backgroundColor = UIColor.redColor()
        addSubview(button)
    }
}
