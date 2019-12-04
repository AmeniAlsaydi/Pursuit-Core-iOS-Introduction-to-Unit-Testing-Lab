//
//  TriviaController.swift
//  UnitTestingLab
//
//  Created by Amy Alsaydi on 12/3/19.
//  Copyright © 2019 Amy Alsaydi. All rights reserved.
//

import UIKit

class TriviaController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var triviaQuestions = [TriviaQuestion]() {
        didSet {
            tableView.reloadData()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        tableView.dataSource = self

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let answerVC = segue.destination as? TriviaAnswersController, let indexPath = tableView.indexPathForSelectedRow else {
            fatalError("failed to get indexPath and answerVC")
        }
        answerVC.triviaQuestion = triviaQuestions[indexPath.row]
        
    }
    
    func loadData() {
        let filename = "TriviaData"
        let ext = "json"
        let data = Bundle.readRawJSONData(filename: filename, ext: ext)
        triviaQuestions = TriviaQuestion.getTrivia(from:
            data)
    }

}

extension TriviaController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return triviaQuestions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        
        let triviaQuestion = triviaQuestions[indexPath.row]
        
        cell.textLabel?.text = triviaQuestion.question.removingPercentEncoding 
        
        return cell
    }
    
    
}
