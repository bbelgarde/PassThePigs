//
//  ViewController.swift
//  Pass The Pigs
//
//  Created by Bryce Belgarde on 2/21/22.
//

import UIKit

class ViewController: UIViewController {

    let possiblePlayers = ["2","3","4","5","6"]
    var numberOfPlayers = "2"
    
    @IBOutlet weak var playerNumber: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        playerNumber.dataSource = self
        playerNumber.delegate = self
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
           // Get a reference to the second view controller
           let secondViewController = segue.destination as! SecondViewController
           // Set a variable in the second view controller with the String to pass
           secondViewController.receivedString = numberOfPlayers
       }

}

extension ViewController : UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return possiblePlayers.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        numberOfPlayers = possiblePlayers[row]
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return possiblePlayers[row]
    }
}
