//
//  Meal.swift
//  FoodTracker
//
//  Created by Masahiko Okada on 2015/10/03.
//
//

import UIKit

class Meal {
    // MARK: Properties
    var name: String
    var photo: UIImage?
    var rating: Int
    
    // MARK: Initialization
    init?(name: String, photo: UIImage?, rating: Int) {
        self.name = name
        self.photo = photo
        self.rating = rating
        
        // Inititialization should fail if there is no name or if the rating is negative.
        if name.isEmpty || rating < 0 {
            return nil
        }
    }
}
