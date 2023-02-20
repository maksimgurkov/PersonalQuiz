//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Alexey Efimov on 19.02.2023.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet weak var emojiLabel: UILabel!
    @IBOutlet weak var descriptionAnimal: UILabel!
    
    var answers: [Answer]!

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        result()
    }
    
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    private func result() {
        var frequentOfAnimal: [Animal: Int] = [:]
        let animals = answers.map { $0.animal }
        
        for animal in animals {
            if let animalsType = frequentOfAnimal[animal] {
                frequentOfAnimal.updateValue(animalsType + 1, forKey: animal)
            } else {
                frequentOfAnimal[animal] = 1
            }
        }
        
        let sortedAnimal = frequentOfAnimal.sorted { $0.value > $1.value }
        guard let resultAnimal = sortedAnimal.first?.key else { return }
        
        updateUI(animal: resultAnimal)
    }
    
    private func updateUI(animal: Animal) {
        emojiLabel.text = "ВЫ - \(animal.rawValue)"
        descriptionAnimal.text = animal.definition
    }
    
}
