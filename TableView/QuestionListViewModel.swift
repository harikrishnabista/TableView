//
//  QuestionListViewModel.swift
//  SingleViewApp
//
//  Created by Hari Bista on 9/16/21.
//  Copyright © 2021 Hari Bista. All rights reserved.
//

import UIKit

// MARK: - QuestionList

struct QuestionList: Codable {
    let questions: [Question]
}

// MARK: - Question
struct Question: Codable {
    let query: String
    let questionId: String
    let answers: [Answer]
    let correctAnswerId: String
}

// MARK: - Answer
struct Answer: Codable {
    let answerId: String
    let url: String
}

class QuestionListViewModel {
    var questionList: QuestionList?
    
    func updateQuestionList(questionList: QuestionList){
        self.questionList = questionList
    }

    func fetchQuestionList(url: URL, completion: @escaping (Bool, Error?) -> ()) {
        ApiCaller<QuestionList>().callApi(url: url) { result in
            switch result {
            case .success(let questionList):
                self.questionList = questionList
                completion(true,nil)
            case .failure(let error):
                completion(false,error)
            }
        }
    }
    
}
