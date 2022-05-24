//
//  PickerViewViewController.swift
//  BomPraCachorro
//
//  Created by ditthales on 19/05/22.
//

import UIKit

class PickerViewViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    weak var delegate : PickerViewViewControllerDelegate?
    
    let opcoesNome: [[String]] = [["Não especificado","0","1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20 ou mais"],["Não especificado","0","1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31","32","33","34","35","36","37","38","39","40","41","42","43","44","45","46","47","48","49","50","51","52","53","54","55","56","57","58","59","60","Acima de 60"],["Não especificado", "Mini","Pequeno","Médio","Grande","Gigante"],["Não especificado","DEA 1.1","DEA 1.2","DEA 1.3","DEA 3","DEA 4","DEA 5","DEA 7"],["Não especificado","Sedentário","Moderado","Ativo"]]
    var index1: String?
    var indexForRow: String?
    var opcaoSelecionada: String?

    @IBOutlet var myPickerView: UIPickerView!
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        let intIndex = Int(index1!)
        return opcoesNome[intIndex!].count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let intIndex = Int(index1!)
        return opcoesNome[intIndex!][row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let intIndex = Int(index1!)
        opcaoSelecionada = opcoesNome[intIndex!][row]
    }
    
    @IBAction func okayButtonAction() {
        if let delegate = delegate {
            delegate.doSomethingWith(data: [opcaoSelecionada ?? "Não especificado", indexForRow!])
        }
        self.dismiss(animated: true, completion: nil)
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myPickerView.delegate = self
        myPickerView.dataSource = self
        // Do any additional setup after loading the view.
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

protocol PickerViewViewControllerDelegate : NSObjectProtocol{
    func doSomethingWith(data: [String])
}
