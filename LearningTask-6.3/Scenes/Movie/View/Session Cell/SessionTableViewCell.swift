//
//  SessionTableViewCell.swift
//  LearningTask-6.3
//
//  Created by Laura Pinheiro Marson on 04/11/22.
//

import UIKit

class SessionTableViewCell: UITableViewCell {
    
    @IBOutlet weak var dateTimeLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    
    func setup(for session: Session) {
        dateTimeLabel.text = DateFormatter.format(date: session.dateTime, to: .hoursPlusMinutes)
        typeLabel.text = session.type.rawValue
    }
}
