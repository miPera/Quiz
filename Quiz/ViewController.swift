import UIKit

class ViewController: UIViewController {
    @IBOutlet var currentQuestionLabel: UILabel!    // Outlet for current question label
    @IBOutlet var nextQuestionLabel: UILabel!       // Outlet for next question label
    @IBOutlet var answerLabel: UILabel!             // Outlet to Show Answer UILabel
    
    //questions array containing 3 fixed Strings
    let questions: [String] = [
        "What is 7+7?",
        "What is the capital of Vermont?",
        "What is cognac made from?"
    ]
    
    //answers array containing 3 fixed Strings
    let answers: [String] = [
        "14",
        "Montpelier",
        "Grapes"
    ]
    
    var currentQuestionIndex: Int = 0;
    
    // show initial question on view load. Method is called after view loads.
    override func viewDidLoad() {
        super.viewDidLoad()
        currentQuestionLabel.text = questions[currentQuestionIndex]
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Set the label's intial alpha
        nextQuestionLabel.alpha = 0
    }
    
    // Action method to show the next question
    @IBAction func showNextQuestion(_ sender: UIButton) {
        currentQuestionIndex += 1   // go to next question in array
        
        // loop back to start of array if index equals array length
        if currentQuestionIndex == questions.count {
            currentQuestionIndex = 0
        }
        
        // set question text
        let question: String = questions[currentQuestionIndex]
        nextQuestionLabel.text = question
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
            self.currentQuestionLabel.alpha = 0
            self.nextQuestionLabel.alpha = 1
        })
    }
}
