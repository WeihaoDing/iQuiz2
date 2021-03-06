//
//  QuestionViewController.swift
//  iQuiz
//
//  Created by gmhding on 2017/11/14
//  Copyright © 2017年 gmhding. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {
    var currentQ = 1
    var score = 0
    var selectedAnswer = ""
    
    @IBOutlet weak var questionText: UILabel!
    @IBOutlet weak var answer1: UIButton!
    @IBOutlet weak var answer2: UIButton!
    @IBOutlet weak var answer3: UIButton!
    @IBOutlet weak var answer4: UIButton!

  
    @IBOutlet var answers: [UIButton]!
    
    @IBAction func answerPressed(_ sender: UIButton) {
        for item in answers {
            item.backgroundColor = UIColor.white
        }
        sender.backgroundColor = UIColor.yellow
        selectedAnswer = sender.currentTitle!
    }

    @IBAction func submitPressed(_ sender: UIButton) {
        nextScreen()
    }
    
    @IBAction func backPressed(_ sender: UIButton) {
        homeScreen()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(QuestionViewController.swipedR(_:)))
        swipeRight.direction = UISwipeGestureRecognizerDirection.right
        self.view.addGestureRecognizer(swipeRight)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(QuestionViewController.swipedL(_:)))
        swipeLeft.direction = UISwipeGestureRecognizerDirection.left
        self.view.addGestureRecognizer(swipeLeft)
    }

    func swipedR(_ gesture: UIGestureRecognizer) {
        nextScreen()
    }
    
    func swipedL(_ gesture: UIGestureRecognizer) {
        homeScreen()
    }
    
    func nextScreen() {
        if selectedAnswer != "" {
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "AnswerViewController") as! AnswerViewController
            vc.currentQ = currentQ
            vc.score = score
            vc.answer = selectedAnswer
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    func homeScreen() {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
