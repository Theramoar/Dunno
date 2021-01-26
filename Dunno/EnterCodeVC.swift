//
//  EnterCodeVC.swift
//  Dunno
//
//  Created by Misha Kuznecov on 25/01/2021.
//

import UIKit

class EnterCodeViewController: UIViewController {
    
    @IBOutlet private var enterCodeTextField: UITextField!
    @IBOutlet private var startTestButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setAppNavigationBar(title: "Add new test")
    }
    
    @IBAction private func startTestButtonPressed(_ sender: Any) {
        let vc = TestPrepViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}
