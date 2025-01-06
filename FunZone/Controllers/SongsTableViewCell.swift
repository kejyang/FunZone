//
//  SongsTableViewCell.swift
//  FunZone
//
//  Created by admin on 12/29/24.
//

import UIKit

class SongsTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBOutlet weak var songImg: UIImageView!
    @IBOutlet weak var songName: UILabel!
}
