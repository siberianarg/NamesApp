//
//  ResaultViewController.swift
//  NamesApps
//
//  Created by Perizat Omar on 30.01.2023.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet weak var namesLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBOutlet weak var progressView: UIProgressView!
    var firstName: String!
    var secondName: String!
    
    private var resultValue = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resultValue = findResault()
        
        namesLabel.text = "\(firstName ?? "") and \(secondName ?? "")"
        resultLabel.text = resultValue.formatted(.percent)
        
        progressView.progress = Float(resultValue)/100
        progressView.transform = progressView.transform.scaledBy(x: 1, y: 4 )
    }
    
    private func findValue(for name: String) ->Int {
        var count = 0
        
        for character in name.lowercased() {
            switch character {
            case "b", "c", "d", "e", "f", "g":
                count += 1
            case "j", "k", "l", "m", "n", "o", "p":
                count += 2
            default:
                count += 0
            }
        }
        return count
    }
    
    private func findResault() -> Int {
        var resault = 0
        
        let firstValue = findValue(for: firstName)
        let secondValue = findValue(for: secondName)
        let absDifference = abs(firstValue - secondValue)
        
        switch absDifference {
        case 0,1,2:
            resault = 100
        case 3,4:
            resault = 65
        case 5:
            resault = 50
        case 6:
            resault = 40
        default:
            resault = 30
        }
        return resault
    }
}
