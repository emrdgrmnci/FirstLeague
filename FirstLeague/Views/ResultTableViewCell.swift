//
//  ResultTableViewCell.swift
//  FirstLeague
//
//  Created by Ali Emre Değirmenci on 9.07.2020.
//  Copyright © 2020 Ali Emre Degirmenci. All rights reserved.
//

import UIKit
import SnapKit

class ResultTableViewCell: UITableViewCell {
    /*
     "skor": "4 - 2",
     "date": "04 Temmuz 2020 Cumartesi 20:00",
     "away": "Adanaspor",
     "home": "EG Menemenspor"
     */

    let dateLabel = UILabel()
    let homeLabel = UILabel()
    let scoreLabel = UILabel()
    let awayLabel = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        dateLabel.textAlignment = NSTextAlignment.left
        dateLabel.font = UIFont.systemFont(ofSize: 12)
        homeLabel.textAlignment = NSTextAlignment.left
        homeLabel.font = UIFont.systemFont(ofSize: 19)
        scoreLabel.textAlignment = NSTextAlignment.left
        scoreLabel.font = UIFont.systemFont(ofSize: 19)
        awayLabel.textAlignment = NSTextAlignment.left
        awayLabel.font = UIFont.systemFont(ofSize: 19)
        contentView.addSubview(dateLabel)
        contentView.addSubview(homeLabel)
        contentView.addSubview(scoreLabel)
        contentView.addSubview(awayLabel)

        dateLabel.snp.makeConstraints { (make) -> Void in
            make.edges.equalTo(contentView).inset(UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 0))
        }
        homeLabel.snp.makeConstraints { (make) -> Void in
            make.edges.equalTo(contentView).inset(UIEdgeInsets(top: 10, left: 30, bottom: 10, right: 0))
        }
        scoreLabel.snp.makeConstraints { (make) -> Void in
            make.edges.equalTo(contentView).inset(UIEdgeInsets(top: 10, left: 285, bottom: 10, right: 0))
        }
        awayLabel.snp.makeConstraints { (make) -> Void in
            make.edges.equalTo(contentView).inset(UIEdgeInsets(top: 10, left: 315, bottom: 10, right: 0))
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configure(with result: Result) {
        dateLabel.text = result.date
        homeLabel.text = result.home
        scoreLabel.text = result.skor
        awayLabel.text = result.away
    }
}
