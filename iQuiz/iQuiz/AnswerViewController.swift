//
//  AnswerViewController.swift
//  iQuiz
//
//  Created by gmhding on 2017/11/14
//  Copyright © 2017年 gmhding. All rights reserved.
//

import UIKit

class AnswerViewController: UIViewController {
    
    var totalQuestion = 2
    var currentQ = 1
    var score = 0
    var correctA = "Answer 1"
    var answer = ""
    
    @IBOutlet weak var correctAnswer: UILabel!
    @IBOutlet weak var rightOrW: UILabel!
    
    @IBAction func nextPressed(_ sender: Any) {
        nextScreen()
    }
    
    @IBAction func backPressed(_ sender: Any) {
        homeScreen()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        correctAnswer.text = correctA
        if (answer == correctA) {
            score += 1
            rightOrW.text = "You answer it right!"
        } else {
            rightOrW.text = "You answer it wrong!"
        }
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(AnswerViewController.swipedR(_:)))
        swipeRight.direction = UISwipeGestureRecognizerDirection.right
        self.view.addGestureRecognizer(swipeRight)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(AnswerViewController.swipedL(_:)))
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
        if currentQ < totalQuestion {
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "QuestionViewController") as! QuestionViewController
            self.navigationController?.pushViewController(vc, animated: true)
            currentQ += 1
            vc.currentQ = currentQ
            vc.score = score
        } else {
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "FinishViewController") as! FinishViewController
            vc.totalscore = totalQuestion
            vc.scores = score
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
