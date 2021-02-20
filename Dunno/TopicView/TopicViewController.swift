//
//  SubjectViewController.swift
//  Dunno
//
//  Created by Misha Kuznecov on 04/12/2020.
//

import UIKit

//class TopicViewController: UIViewController {
//    var topic: Topic!
//    let userData: UserData = .shared
//
//    @IBOutlet weak var mentorButton: UIButton!
//    
//    @IBOutlet weak var studentButton: UIButton!
//    
//    override func viewDidLoad() {
//        navigationItem.title = topic.name
//        setupAppearance(for: mentorButton)
//        setupAppearance(for: studentButton)
//    }
//    
//    private func setupAppearance(for button: UIButton) {
//        button.layer.cornerRadius = 10
//        button.layer.shadowOffset = CGSize(width: 0, height: 2)
//        button.layer.shadowOpacity = 0.3
//        button.layer.shadowRadius = 4
//    }
//    
//    private func filterMentors() -> [Mentor] {
//        let topicMentors = dummyMentors.filter { $0.topic.name == topic.name }
//        return topicMentors.filter {
//            for mentor in userData.userStudent.mentors {
//                if $0.student.name == mentor.student.name,
//                   $0.topic.name == mentor.topic.name {
//                    return false
//                }
//            }
//            return true
//        }
//    }
//    
//   
//    @IBAction func mentorButtonPressed(_ sender: Any) {
////        if userData.userStudent.failedTests.contains(where: { $0.test.title == topic.name }) {
////            presentFailAlert()
////        } else {
////            presentTestAlert()
////        }
//    }
//    
//    
//    @IBAction func studentButtonPressed(_ sender: Any) {
//        let vc = ChooseMentorViewController()
//        let availableMentors = filterMentors()
//        vc.studentsMentors = availableMentors
//        navigationController?.pushViewController(vc, animated: true)
//    }
//    
//    private func presentTestAlert() {
//        guard let topic = topic else { return }
//        let alert = UIAlertController(title: "You need to pass test", message: "Before becoming a mentor you need to pass a test", preferredStyle: .alert)
//        let cancel = UIAlertAction(title: "Cancel", style: .cancel)
//        let takeTest = UIAlertAction(title: "Take test", style: .default) { [weak self] _ in
//            let vc = TestViewController()
//            self?.present(vc, animated: true)
//        }
//        alert.addAction(cancel)
//        alert.addAction(takeTest)
//        
//        present(alert, animated: true)
//    }
//    
//    private func presentFailAlert() {
//        let alert = UIAlertController(title: "You failed the Test", message: "You will be able to retake this test in a week", preferredStyle: .alert)
//        let ok = UIAlertAction(title: "OK", style: .default)
//  
//        alert.addAction(ok)
//        present(alert, animated: true)
//    }
//}

