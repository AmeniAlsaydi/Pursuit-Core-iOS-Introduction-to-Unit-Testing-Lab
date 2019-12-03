//
//  ViewController.swift
//  UnitTestingLab
//
//  Created by Amy Alsaydi on 12/2/19.
//  Copyright © 2019 Amy Alsaydi. All rights reserved.
//

import UIKit

class JokesController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var jokes = [Joke]() {
        didSet {
            tableView.reloadData()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        loadData()
        // Do any additional setup after loading the view.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let detailVC = segue.destination as? JokesDetailController, let indexPath = tableView.indexPathForSelectedRow else {
            fatalError("failed to get indexPath and detailVC")
        }
        
        detailVC.joke = jokes[indexPath.row]
    }
    
    func loadData() {
        let filename = "JokesData"
        let ext = "json"
        let data = Bundle.readRawJSONData(filename: filename, ext: ext)
        jokes = Joke.getJokes(from: data)
        
    }
    


}

extension JokesController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        jokes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        
        let joke = jokes[indexPath.row]
        
        cell.textLabel?.text = joke.setup
        
        return cell
    }
    
    
}

