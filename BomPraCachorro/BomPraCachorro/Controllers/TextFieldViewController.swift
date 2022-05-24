//
//  TextFieldViewController.swift
//  BomPraCachorro
//
//  Created by ditthales on 20/05/22.
//

import UIKit

class TextFieldViewController: UIViewController {
    
    @IBOutlet var textField: UITextField!
    @IBOutlet var textLabel: UILabel!
    var textinho: String?
    var index: String?
    var informacao: String?
    weak var delegate : TextFieldViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        textLabel.text = textinho

        // Do any additional setup after loading the view.
    }
    
    @IBAction func okayButtonAction() {
        if let delegate = delegate {
            delegate.doSomethingWith(data: [textField.text!, index!])
        }
        self.dismiss(animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

protocol TextFieldViewControllerDelegate : NSObjectProtocol{
    func doSomethingWith(data: [String])
}
