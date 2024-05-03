//
//  RepositoryTableViewCell.swift
//  GithubProject(Snapkit&Searchbar)
//
//  Created by 배지해 on 5/2/24.
//

import UIKit

class RepositoryTableViewCell: UITableViewCell {

    @IBOutlet weak var repositoryName: UILabel!
    @IBOutlet weak var starCount: UILabel!
    @IBOutlet weak var repoLanguage: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func bind(repository: GitRepository) {
        repositoryName.text = repository.name
        starCount.text = "\(repository.stargazersCount)"
        repoLanguage.text = repository.language
    }
    
}
