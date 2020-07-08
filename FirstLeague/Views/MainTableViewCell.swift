//
//  MainTableViewCell.swift
//  FirstLeague
//
//  Created by Ali Emre Değirmenci on 6.07.2020.
//  Copyright © 2020 Ali Emre Degirmenci. All rights reserved.
//

import UIKit

class MainTableViewCell: UITableViewCell {

    @IBOutlet weak var rankLabel: UILabel!
    @IBOutlet weak var teamLabel: UILabel!
    @IBOutlet weak var playLabel: UILabel!
    @IBOutlet weak var goalDistanceLabel: UILabel!
    @IBOutlet weak var pointLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configure(with result: [Result]) {
        rankLabel.text = result[0].rank
        teamLabel.text = result[0].team
        playLabel.text = result[0].play
        goalDistanceLabel.text = result[0].goalDistance
        pointLabel.text = result[0].point
    }

}
