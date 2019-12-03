//
//  StarWarsController.swift
//  UnitTestingLab
//
//  Created by Amy Alsaydi on 12/2/19.
//  Copyright © 2019 Amy Alsaydi. All rights reserved.
//

import UIKit

class StarWarsController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var episodes = [Episode]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadData()
        tableView.dataSource = self

    }
    
    func loadData() {
        let filename = "StarWarsData"
        let ext = "json"
        let data = Bundle.readRawJSONData(filename: filename, ext: ext)
        episodes = Episode.getEpisodes(from: data)
    }
    
}



extension StarWarsController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        episodes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        let episode = episodes[indexPath.row]
        
        cell.textLabel?.text = episode.title
        return cell
    }
    
    
}

