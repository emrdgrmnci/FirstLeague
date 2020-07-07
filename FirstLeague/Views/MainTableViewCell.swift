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

    func configure(with result: Result) {
        rankLabel.text = result.rank
        teamLabel.text = result.team
        playLabel.text = result.play
        goalDistanceLabel.text = result.goalDistance
        pointLabel.text = result.point
    }

}
