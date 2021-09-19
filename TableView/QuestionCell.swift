//
//  QuestionCell.swift
//  SingleViewApp
//
//  Created by Hari Bista on 9/16/21.
//  Copyright © 2021 Hari Bista. All rights reserved.
//

import UIKit

class QuestionCell: UITableViewCell {
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.collectionView.dataSource = self
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    var question: Question?
    
    func display(question: Question){
        self.question = question
        self.questionLabel.text = question.query
    }

}

extension  QuestionCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.question?.answers.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AnswerCell", for: indexPath) as! AnswerCell
        
        if let answer = self.question?.answers[indexPath.row] {
            cell.display(answer: answer)
        }
        
        return cell
        
    }
    
    
}
