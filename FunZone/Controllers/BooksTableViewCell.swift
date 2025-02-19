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
        
        contentView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            contentView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            contentView.topAnchor.constraint(equalTo: self.topAnchor, constant:10),
            contentView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
            contentView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10)
        ])
        contentView.layer.cornerRadius = 5
        contentView.layer.masksToBounds = true
        contentView.backgroundColor = .white
        
        backgroundColor = .clear
        coverPicture.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            coverPicture.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            coverPicture.topAnchor.constraint(equalTo: contentView.topAnchor),
            coverPicture.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            coverPicture.widthAnchor.constraint(equalTo: coverPicture.heightAnchor, multiplier: 1.0)
        ])
        coverPicture.contentMode = .scaleAspectFill
        coverPicture.layer.cornerRadius = 5
        coverPicture.clipsToBounds = true
        self.selectionStyle = .none
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func layoutSubviews(){
        super.layoutSubviews()
        //contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
    }

    
    @IBOutlet weak var authorName: UILabel!
    @IBOutlet weak var coverPicture: UIImageView!
    @IBOutlet weak var bookName: UILabel!
}
