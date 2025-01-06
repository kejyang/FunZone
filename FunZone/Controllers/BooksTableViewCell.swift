//
//  BooksTableViewCell.swift
//  FunZone
//
//  Created by admin on 12/30/24.
//

import UIKit

class BooksTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
    @IBOutlet weak var authorName: UILabel!
    @IBOutlet weak var coverPicture: UIImageView!
    @IBOutlet weak var bookName: UILabel!
}
