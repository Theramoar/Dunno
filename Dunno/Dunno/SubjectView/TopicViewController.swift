//
//  SubjectViewController.swift
//  Dunno
//
//  Created by Misha Kuznecov on 04/12/2020.
//

import UIKit

class TopicViewController: UIViewController {
    var topic: Topic!
    

    @IBOutlet weak var mentorButton: UIButton!
    
    @IBOutlet weak var studentButton: UIButton!
    
    override func viewDidLoad() {
        navigationItem.title = topic.name
    }
    
   
    @IBAction func mentorButtonPressed(_ sender: Any) {
        presentTestAlert()
    }
    
    
    @IBAction func studentButtonPressed(_ sender: Any) {
        let vc = ChooseMentorViewController()
        vc.studentsMentors = dummyMentors
        navigationController?.pushViewController(vc, animated: true)
    }
    
    private func presentTestAlert() {
        let alert = UIAlertController(title: "You need to pass test", message: "Before becoming a mentor you need to pass a test", preferredStyle: .alert)
        let cancel = UIAlertAction(title: "Cancel", style: .cancel)
        let takeTest = UIAlertAction(title: "Take test", style: .default) { [weak self] _ in
            let vc = TestViewController()
            self?.present(vc, animated: true)
        }
        alert.addAction(cancel)
        alert.addAction(takeTest)
        
        present(alert, animated: true)
    }
}

