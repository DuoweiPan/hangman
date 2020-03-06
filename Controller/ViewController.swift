//
//  HangmanViewController
//  Hangman
//
//  Created by iOS Decal on Feb 11 2020.
//  Copyright © 2020 iosdecal. All rights reserved.
//

import UIKit

class HangmanViewController: UIViewController, UITextFieldDelegate{

    // MARK: - Instances: Models
    var curGame: Hangman = Hangman()
    

    // MARK: - IBOutlets
    @IBOutlet weak var curPhrase: UILabel!
    
    @IBOutlet weak var hangManImg: UIImageView!
    @IBOutlet weak var wrongGuess: UILabel!
    
    @IBOutlet weak var InputText: UITextField!
    
    // MARK: - Class Props/Vars
    let incorrectHeader = "Incorrect guesses: "
    let winAlert = UIAlertController(title: "result", message: "you won!", preferredStyle: .alert)
    let loseAlert = UIAlertController(title: "result", message: "you lost", preferredStyle: .alert)
    let restartAction = UIAlertAction(title: "Play Again!", style: .default, handler: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //limit input text field to length 1
        InputText.delegate = self
        
        curGame.setPhrase()
        curPhrase.text = curGame.getPhrase()
        wrongGuess.text = incorrectHeader
        hangManImg.image = UIImage(named: "hangman1")
        InputText.placeholder = "Enter your guess!"
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange,
                   replacementString string: String) -> Bool {
        let maxLength = 1
        var currentString: NSString = ""
        if let s = textField.text {
             currentString = s as NSString
        }
        let newString: NSString = currentString.replacingCharacters(in: range, with: string) as NSString
        return newString.length <= maxLength
    }
    
    // MARK: - IBActions
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
        InputText.text = ""
        if !curGame.canContinue() {
            if curGame.checkWin() {
                winAlert.addAction(restartAction)
                present(winAlert, animated: true, completion: nil)
            } else {
                loseAlert.addAction(restartAction)
                present(loseAlert, animated: true, completion: nil)
            }
            curGame = Hangman()
            curGame.setPhrase()
            curPhrase.text = curGame.getPhrase()
            wrongGuess.text = incorrectHeader
            hangManImg.image = UIImage(named: "hangman1")
            InputText.placeholder = "Enter your guess!"
        }
    }
    
    @IBAction func restart(_ sender: UIButton) {
        curGame = Hangman()
        curGame.setPhrase()
        curPhrase.text = curGame.getPhrase()
        wrongGuess.text = incorrectHeader
        hangManImg.image = UIImage(named: "hangman1")
        InputText.placeholder = "Enter your guess!"
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
