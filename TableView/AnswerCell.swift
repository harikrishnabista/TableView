//
//  AnswerCell.swift
//  TableView
//
//  Created by Hari Bista on 9/19/21.
//  Copyright © 2021 Hari Bista. All rights reserved.
//

import UIKit

class AnswerCell: UICollectionViewCell {
    
    @IBOutlet weak var answerImageView: UIImageView!
    
    func display(answer: Answer) {
        if let answerImageUrl = URL(string: answer.url) {
            ImageDownloader.downloadImage(url: answerImageUrl) { image in
                DispatchQueue.main.async {
                    if let image = image {
                        self.answerImageView.image = image
                    } else {
                        self.answerImageView.image = UIImage(named: "noImageAvailable")
                    }
                }
            }
        }
    }
}
