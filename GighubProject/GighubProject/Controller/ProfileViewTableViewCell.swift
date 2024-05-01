//
//  ProfileViewTableViewCell.swift
//  GighubProject
//
//  Created by 배지해 on 4/9/24.
//

import UIKit

class ProfileViewTableViewCell: UITableViewCell {
    
    @IBOutlet weak var repoName: UILabel!
    @IBOutlet weak var repoStarts: UILabel!
    @IBOutlet weak var repoLanguage: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
