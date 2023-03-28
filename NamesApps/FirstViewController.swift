//
//  ViewController.swift
//  NamesApps
//
//  Created by Perizat Omar on 28.01.2023.
//

import UIKit

class  FirstViewController: UIViewController {
    
    @IBOutlet weak var yourNameTF: UITextField!
    
    @IBOutlet weak var partnerNameTF: UITextField!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destinationVC = segue.destination as? ResultViewController else { return }
        destinationVC.firstName = yourNameTF.text
        destinationVC.secondName = partnerNameTF.text
    }
    
    @IBAction func resoultButtonTapped() {
        guard let firstName = yourNameTF.text, let secondName = partnerNameTF.text else { return }
        if firstName.isEmpty || secondName.isEmpty {
            showAlert(
                title: "Names are missing",
                message: "Please, enter both names! 😉"
            )
            return
        }
        performSegue(withIdentifier: "goToResault", sender: nil)
    }
    
    @IBAction func unwindSegueToFirstVC(segue:UIStoryboardSegue){
        yourNameTF.text = ""
        partnerNameTF.text = ""
    }
}

extension FirstViewController {
    private func showAlert(title: String, message:String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        present(alert , animated: true)
    }
}

extension FirstViewController: UITextFieldDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == yourNameTF {
            partnerNameTF.becomeFirstResponder()
        } else {
            resoultButtonTapped()
        }
        return true
    }
}


