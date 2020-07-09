//
//  MainTableViewCell.swift
//  FirstLeague
//
//  Created by Ali Emre Değirmenci on 6.07.2020.
//  Copyright © 2020 Ali Emre Degirmenci. All rights reserved.
//

import UIKit
import SnapKit

class MainTableViewCell: UITableViewCell {

    let rankLabel = UILabel()
    let teamLabel = UILabel()
    let playLabel = UILabel()
    let goalDistanceLabel = UILabel()
    let pointLabel = UILabel()


    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        rankLabel.textAlignment = NSTextAlignment.left
        rankLabel.font = UIFont.systemFont(ofSize: 19)
        teamLabel.textAlignment = NSTextAlignment.left
        teamLabel.font = UIFont.systemFont(ofSize: 19)
        playLabel.textAlignment = NSTextAlignment.left
        playLabel.font = UIFont.systemFont(ofSize: 19)
        goalDistanceLabel.textAlignment = NSTextAlignment.left
        goalDistanceLabel.font = UIFont.systemFont(ofSize: 19)
        pointLabel.textAlignment = NSTextAlignment.left
        pointLabel.font = UIFont.systemFont(ofSize: 19)
        contentView.addSubview(rankLabel)
        contentView.addSubview(teamLabel)
        contentView.addSubview(playLabel)
        contentView.addSubview(goalDistanceLabel)
        contentView.addSubview(pointLabel)

        rankLabel.snp.makeConstraints { (make) -> Void in
            make.edges.equalTo(contentView).inset(UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 0))
        }
        teamLabel.snp.makeConstraints { (make) -> Void in
            make.edges.equalTo(contentView).inset(UIEdgeInsets(top: 10, left: 30, bottom: 10, right: 0))
        }
        playLabel.snp.makeConstraints { (make) -> Void in
            make.edges.equalTo(contentView).inset(UIEdgeInsets(top: 10, left: 285, bottom: 10, right: 0))
        }
        goalDistanceLabel.snp.makeConstraints { (make) -> Void in
            make.edges.equalTo(contentView).inset(UIEdgeInsets(top: 10, left: 315, bottom: 10, right: 0))
        }
        pointLabel.snp.makeConstraints { (make) -> Void in
            make.edges.equalTo(contentView).inset(UIEdgeInsets(top: 10, left: 345, bottom: 10, right: 0))
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configure(with result: Team) {
        rankLabel.text = result.rank
        teamLabel.text = result.team
        playLabel.text = result.play
        goalDistanceLabel.text = result.goalDistance
        pointLabel.text = result.point
    }
}
