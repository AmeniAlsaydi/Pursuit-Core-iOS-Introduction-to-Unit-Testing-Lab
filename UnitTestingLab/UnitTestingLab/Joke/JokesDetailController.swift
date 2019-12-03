//
//  JokesDetailController.swift
//  UnitTestingLab
//
//  Created by Amy Alsaydi on 12/2/19.
//  Copyright © 2019 Amy Alsaydi. All rights reserved.
//

import UIKit

class JokesDetailController: UIViewController {

    @IBOutlet weak var punchLineLabel: UILabel!
    @IBOutlet weak var setUpLabel: UILabel!
    
    var joke: Joke?

    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        
    }
    
    func updateUI() {
        guard let theJoke = joke else {return}
        punchLineLabel.text = theJoke.punchline
        setUpLabel.text = "\(theJoke.setup)..."
    }

}
