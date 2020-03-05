//
//  HangmanViewController
//  Hangman
//
//  Created by iOS Decal on Feb 11 2020.
//  Copyright © 2020 iosdecal. All rights reserved.
//

import UIKit

class HangmanViewController: UIViewController {

    // MARK: - Instances: Models
    var curGame: Hangman = Hangman()

    // MARK: - IBOutlets
    @IBOutlet weak var curPhrase: UILabel!
    
    @IBOutlet weak var hangManImg: UIImageView!
    @IBOutlet weak var wrongGuess: UILabel!
    
    @IBOutlet weak var InputText: UITextField!
    
    // MARK: - Class Props/Vars
    let incorrectHeader = "Incorrect guesses: "
    
    // MARK: - IBActions
        
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        curGame.setPhrase()
        curPhrase.text = curGame.getPhrase()
        wrongGuess.text = incorrectHeader
        hangManImg.image = UIImage(named: "hangman1")
    }
    
    
    @IBAction func pressGuess(_ sender: UIButton) {
        var guessChar: Character = "_"
        if let c = InputText.text {
            guessChar = Character(c)
        }
        if curGame.guess(cur: guessChar) {
            curPhrase.text = curGame.getPhrase()
        } else {
            hangManImg.image = UIImage(named: "hangman" + "\(curGame.countImg)")
            wrongGuess.text = String(curGame.wrongChar)
        }
        
    }
    
    // MARK: - Class Methods
    
    private func reset() -> Void { return }
    private func playTurn() -> Void { return }
    private func endGame() -> Void { return }

    // Optional Example Code, but might be useful...
    
    
    /* PREPARING AND PRESENTING A SEGUE (TRANSITION)
     ... { _ in
         // Segue to the high score screen
         CATransaction.setCompletionBlock({
             self.performSegue(withIdentifier: "ExampleSegue", sender: nil)
         })
     }
     
    self.present(endGameAlert, animated: true, completion: nil)
     
     
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // 1. Get the new view controller using segue.destination.
        // 2. Pass the selected object to the new view controller.
        if let dest = segue.destination as? EndGameViewController {
            dest.userScore = counter
        }
    */
    
}
