//
//  StarWarsCrawlController.swift
//  UnitTestingLab
//
//  Created by Amy Alsaydi on 12/3/19.
//  Copyright © 2019 Amy Alsaydi. All rights reserved.
//

import UIKit

class StarWarsCrawlController: UIViewController {
    
    @IBOutlet weak var openingCrawl: UILabel!
    var episode: Episode?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()

    }
    
    func updateUI() {
        guard let selectedEpisode = episode else { fatalError("xyz")}
        openingCrawl.text = selectedEpisode.openingCrawl
        
    }


}
