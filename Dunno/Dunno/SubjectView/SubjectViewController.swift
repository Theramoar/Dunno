//
//  SubjectViewController.swift
//  Dunno
//
//  Created by Misha Kuznecov on 04/12/2020.
//

import UIKit

class SubjectViewController: UIViewController {
    var subject: Subject!
    

    @IBOutlet weak var mentorButton: UIButton!
    
    @IBOutlet weak var studentButton: UIButton!
    
    override func viewDidLoad() {
        navigationItem.title = subject.name
    }
    
   
    @IBAction func mentorButtonPressed(_ sender: Any) {
    }
    
    
    @IBAction func studentButtonPressed(_ sender: Any) {
        let vc = ChooseMentorViewController()
        vc.studentsMentors = dummyMentors
//        present(vc, animated: true)
        navigationController?.pushViewController(vc, animated: true)
    }
}

let dummyMentors = [Student(name: "Ivan"),
                    Student(name: "Misha"),
                    Student(name: "Slavik")]
