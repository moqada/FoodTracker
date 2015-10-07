//
//  TiqavCell.swift
//  TiqavViewer
//
//  Created by Masahiko Okada on 2015/10/06.
//
//

import UIKit

class TiqavCell: UITableViewCell {
    // MARK: Properties
    @IBOutlet weak var tiqavImageView: UIImageView!
    @IBOutlet weak var tiqavUrlLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        tiqavUrlLabel.backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.95, alpha: 0.95)
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
