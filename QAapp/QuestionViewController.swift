//
//  QuestionViewController.swift
//  QAapp
//
//  Created by YA on 2021/3/28.
//

import UIKit

class QuestionViewController: UIViewController {
    
    @IBOutlet weak var q_image: UIImageView!
    @IBOutlet weak var name_label: UILabel!

    @IBOutlet  var answerButton: [UIButton]!
    
    // 題數
    var questionCount = 0
    
    // 分數
    var score = 0
    
    // 正確答案
    var rightAnswer = ""
    
    
    var questionData = [
        Ques(image: "皮卡丘.png",  option: ["皮養丘", "皮卡丘", "皮諾丘", "皮皮丘"], answer: "皮卡丘"),
        Ques(image: "弱丁魚.png",  option: ["鯉魚王", "醜醜魚", "弱丁魚", "強丁魚"], answer: "弱丁魚"),
        Ques(image: "蒼響.png",  option: ["蒼響", "藏瑪然特", "無極汰那", "哲爾尼亞斯"], answer: "蒼響"),
        Ques(image: "蔥遊兵.png",  option: ["大蔥鴨", "蔥憲兵", "蔥遊餅", "蔥遊兵"], answer: "蔥遊兵"),
        Ques(image: "薩戮德.png",  option: ["薩戮德", "過動猿", "魔人啾啾", "投擲猴"], answer: "薩戮德"),
    
       ]

    override func viewDidLoad() {
        super.viewDidLoad()
        

    }
    
    //當view出現時載入的方法
    override func viewDidAppear(_ animated:Bool) {
        super.viewDidAppear(animated)
        restart()
    }
    
    // 遊戲開始
    func startGame() {
        q_image.image = UIImage(named: questionData[questionCount].image)
        rightAnswer = questionData[questionCount].answer
        questionData[questionCount].option.shuffle()
        
        for i in 0...3 {
            answerButton[i].setTitle(questionData[questionCount].option[i], for: .normal)
        }
        
    }
    
    
    // 點擊答案按鈕
    @IBAction func answerClick(_ sender: UIButton) {
        questionCount = questionCount + 1
        
        if sender.currentTitle == rightAnswer {
            score = score + 1
        }else{
            print(rightAnswer)
        }
            
        if questionCount < 5 {
            startGame()
        }
            
        else {
            next_Page()
        }
    }
    
    //換頁
    func next_Page(){
        let controller = storyboard?.instantiateViewController(withIdentifier: "ResultViewController") as! ResultViewController
        controller.total_score = score
        present(controller, animated: true, completion: nil)
    }
    
    // 再玩一次Function
    func restart() {
        score = 0
        questionCount = 0
        questionData.shuffle()
        startGame()
    }
    

 

}


struct Ques {
    var image: String
    var option: [String]
    var answer: String
}


