//
//  ViewController.swift
//  Project2
//
//  Created by srrmstk on 23.05.2023.
//

import UIKit

class ViewController: UIViewController {
  @IBOutlet var button1: UIButton!
  @IBOutlet var button2: UIButton!
  @IBOutlet var button3: UIButton!

  var countries = [String]()
  var score = 0
  var correctAnswer = 0
  var questionNumber = 0
  let questionCount = 10
  
  override func viewDidLoad() {
    super.viewDidLoad()

    navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .compose, target: self, action: #selector(showScore))

    countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]

    button1.layer.borderWidth = 1
    button2.layer.borderWidth = 1
    button3.layer.borderWidth = 1

    button1.layer.borderColor = UIColor.lightGray.cgColor
    button2.layer.borderColor = UIColor.lightGray.cgColor
    button3.layer.borderColor = UIColor.lightGray.cgColor

    askQuestion(action: nil)
  }

  func askQuestion(action: UIAlertAction!) {
    countries.shuffle()
    button1.setImage(UIImage(named: countries[0]), for: .normal)
    button2.setImage(UIImage(named: countries[1]), for: .normal)
    button3.setImage(UIImage(named: countries[2]), for: .normal)
    correctAnswer = Int.random(in: 0...2)
    title = "\(countries[correctAnswer].uppercased()) Score: \(score)"
  }

  @objc func showScore() {
    let vc = UIAlertController(title: "Your current score", message: "Your score is \(score)", preferredStyle: .alert)
    vc.addAction(UIAlertAction(title: "Close", style: .cancel))
    present(vc, animated: true)
  }

  @IBAction func buttonTapped(_ sender: UIButton) {
    var title: String
    var message: String

    if (sender.tag == correctAnswer) {
      score += 1
      title = "Correct"
    } else {
      score -= 1
      title = "Wrong! This is a flag of \(countries[sender.tag].uppercased())"
    }
    questionNumber += 1

    if questionNumber != questionCount {
      message = "Your score is \(score)"
    } else {
      message = "Your final score is \(score)"
    }

    let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
    alertController.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
    present(alertController, animated: true)
  }

}

