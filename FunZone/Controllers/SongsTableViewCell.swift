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
        //.layer.cornerRadius = songImg.frame.size.width / 2
        songImg.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            songImg.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            songImg.topAnchor.constraint(equalTo: contentView.topAnchor),
            songImg.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            songImg.widthAnchor.constraint(equalTo: songImg.heightAnchor, multiplier: 1.0)
        ])
        songImg.contentMode = .scaleAspectFill
        songImg.clipsToBounds = true
        songImg.layer.cornerRadius = 5
        self.selectionStyle = .none
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    override func layoutSubviews(){
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
        
    }

    @IBOutlet weak var songImg: UIImageView!
    @IBOutlet weak var songName: UILabel!
    
    @IBOutlet weak var artistName: UILabel!
}
