//
//  ViewController.swift
//  iQuiz
//
//  Created by gmhding on 2017/11/14
//  Copyright © 2017年 gmhding. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    let subjects = ["Mathematics", "Marvel Super Heroes", "Science"]
    let descriptions = ["1 + 1 = 2", "Spiderman", "Chemisty, Biology"]
    let images = ["math.png", "hero.png", "science.png"]
    
    @IBAction func settingPressed(_ sender: Any) {
        let alert = UIAlertController(title: "Setting", message: "Settings go here", preferredStyle:UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.tableFooterView = UIView()
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.swipedR(_:)))
        swipeRight.direction = UISwipeGestureRecognizerDirection.right
        self.view.addGestureRecognizer(swipeRight)
        
    }
    
    func swipedR(_ gesture: UIGestureRecognizer) {
        nextScreen()
    }
    
    func nextScreen() {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "QuestionViewController") as! QuestionViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return subjects.count
    }

      
    
    override func tableView(_ cellForRowAttableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        cell.textLabel!.text = subjects[indexPath.row]
        cell.detailTextLabel!.text = descriptions[indexPath.row]
        cell.imageView!.image = UIImage(named: self.images[indexPath.row])
        return cell
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        nextScreen()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

