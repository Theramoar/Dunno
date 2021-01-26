//
//  TestPrepVC.swift
//  Dunno
//
//  Created by MihailsKuznecovs on 26/01/2021.
//

import UIKit

class TestPrepViewController: UIViewController {
    
    @IBOutlet private var enterNameTextField: UITextField!
    @IBOutlet private var startTestButton: UIButton!
    @IBOutlet private var countdownLabel: UILabel!
    
    override func viewDidLoad() {
        countdownLabel.isHidden = true
        setAppNavigationBar(title: "Prepare for the test!")
    }
    
    @IBAction private func startTestButtonPressed(_ sender: Any) {
        let vc = TestViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
}
