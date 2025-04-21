import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var responseLabel: UILabel!
    @IBOutlet weak var cycleDayTextField: UITextField!
    @IBOutlet weak var flowStatusSegmentedControl: UISegmentedControl!

    // Track cycle day and blood flow
    var cycleDay: Int = 1
    var flowStatus: String = "Light"

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        questionLabel.text = "How are you feeling today?"
        responseLabel.text = ""
        cycleDayTextField.placeholder = "Enter cycle day"
    }

    // Actions for the 3 mood buttons
    @IBAction func crampyTapped(_ sender: UIButton) {
        updateUI(for: "Crampy")
    }
    
    @IBAction func goodTapped(_ sender: UIButton) {
        updateUI(for: "Good")
    }
    
    @IBAction func tiredTapped(_ sender: UIButton) {
        updateUI(for: "Tired")
    }

  
    func updateUI(for mood: String) {
        responseLabel.text = getRandomQuote(for: mood)
        view.backgroundColor = getBackgroundColor(for: mood)
        trackCycleAndFlow()
    }

    // Get random quote based on mood
    func getRandomQuote(for mood: String) -> String {
        let crampyQuotes = [
            "Your body is working hard. Rest is resistance.",
            "You deserve all the comfort today.",
            "Take it easy. You are enough."
        ]
        
        let goodQuotes = [
            "You are glowing today!",
            "Feel the sunshine inside you!",
            "Celebrate your energy. You earned it."
        ]
        
        let tiredQuotes = [
            "Rest is productive too.",
            "Breathe and take your time.",
            "You are doing amazing, even when you slow down."
        ]
        
        switch mood {
        case "Crampy": return crampyQuotes.randomElement()!
        case "Good": return goodQuotes.randomElement()!
        case "Tired": return tiredQuotes.randomElement()!
        default: return ""
        }
    }

    // Background color based on mood
    func getBackgroundColor(for mood: String) -> UIColor {
        switch mood {
        case "Crampy": return UIColor.systemPink.withAlphaComponent(0.3)
        case "Good": return UIColor.systemGreen.withAlphaComponent(0.3)
        case "Tired": return UIColor.systemBlue.withAlphaComponent(0.3)
        default: return UIColor.systemBackground
        }
    }

    // Track cycle day and blood flow status
    func trackCycleAndFlow() {
        // Track cycle day entered by the user
        if let cycleDayInput = cycleDayTextField.text, let day = Int(cycleDayInput) {
            cycleDay = day
        }
        
        switch flowStatusSegmentedControl.selectedSegmentIndex {
        case 0: flowStatus = "Light"
        case 1: flowStatus = "Medium"
        case 2: flowStatus = "Heavy"
        default: break
        }

        // Print current cycle day and flow status 
        print("Cycle Day: \(cycleDay), Flow Status: \(flowStatus)")
    }
}
