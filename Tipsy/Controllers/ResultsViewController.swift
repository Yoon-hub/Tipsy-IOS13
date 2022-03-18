//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by 최윤제 on 2022/03/17.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet var totalLabel: UILabel!
    @IBOutlet var settingsLabel: UILabel!
    
    var result: String?
    var tip: Int?
    var split: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(result)
        totalLabel.text = result
        settingsLabel.text = "Split between \(split!) people, with \(tip!) tip."
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func recaluatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
