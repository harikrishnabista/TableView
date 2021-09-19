//
//  ViewController.swift
//  SingleViewApp
//
//  Created by Hari Bista on 9/15/21.
//  Copyright © 2021 Hari Bista. All rights reserved.
//

import UIKit

class QuestionListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var viewModel: QuestionListViewModel = QuestionListViewModel()
    
    let questionListUrl = URL(string: "https://raw.githubusercontent.com/harikrishnabista/SimpleApiCaller/master/QuestionsList.json")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.dataSource = self
        
        self.loadQuestionList()
    }
    
    func loadQuestionList(){
        if let url = self.questionListUrl {
            self.viewModel.fetchQuestionList(url: url) { (success, error) in
                DispatchQueue.main.async {
                    if success {
                        self.tableView.reloadData()
                    } else {
                        print(error.debugDescription)
                    }
                }
            }
        }
    }

}

extension QuestionListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.questionList?.questions.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "QuestionCell") as! QuestionCell
        
        if let question = self.viewModel.questionList?.questions[indexPath.row] {
            cell.display(question: question)
        }
        
        return cell
    }

}

