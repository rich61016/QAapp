//
//  ResultViewController.swift
//  QAapp
//
//  Created by YA on 2021/3/28.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet weak var score: UILabel!
    
    @IBOutlet weak var lv_image: UIImageView!
    var que = QuestionViewController()
    var total_score :Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        score.text = String(total_score)
        totalScore()
    }
    

    @IBAction func paly_again(_ sender: Any) {
        self.dismiss(animated: false, completion: nil)
    }
    

    
    // 總分計算Function
    func totalScore() {
        if total_score == 5 {
            lv_image.image = UIImage(named: "大師球.png")
        }
        else if total_score <= 4 && total_score > 1 {
            lv_image.image = UIImage(named: "超級球.png")
        }
        else {
            lv_image.image = UIImage(named: "寶貝球.png")
        }

    }
    
}
