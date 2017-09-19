import UIKit

class ViewController: UIViewController {
    @IBOutlet var questionLabel: UILabel!   // Outlet to Next Question UILabel
    @IBOutlet var answerLabel: UILabel!     // Outlet to Show Answer UILabel
    
    //questions array
    let questions: [String] = [
        "What is 7+7?",
        "What is the capital of Vermont?",
        "What is cognac made from?"
    ]
    
    //answers array
    let answers: [String] = [
        "14",
        "Montpelier",
        "Grapes"
    ]
    
    var currentQuestionIndex: Int = 0;
    
    // show initial question on view load
    override func viewDidLoad() {
        super.viewDidLoad()
        questionLabel.text = questions[currentQuestionIndex]
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Set the label's intial alpha
        questionLabel.alpha = 0
    }
    
    // Action method to show the next question
    @IBAction func showNextQuestion(_ sender: UIButton) {
        currentQuestionIndex += 1
        
        if currentQuestionIndex == questions.count {
            currentQuestionIndex = 0
        }
        
        let question: String = questions[currentQuestionIndex]
        questionLabel.text = question
        answerLabel.text = "???"
        
        animateLabelTransitions()
    }
    
    // Action method to show answer to current question
    @IBAction func showAnswer(_ sender: UIButton) {
        let answer: String = answers[currentQuestionIndex]
        answerLabel.text = answer
    }
    
    //Animation function for label transition
    func animateLabelTransitions() {
        //Animate the alpha
        UIView.animate(withDuration: 2, animations: {
            self.questionLabel.alpha = 1
        })
    }
}
