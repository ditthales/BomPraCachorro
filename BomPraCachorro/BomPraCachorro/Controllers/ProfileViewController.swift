//
//  File.swift
//  BomPraCachorro
//
//  Created by ditthales on 18/05/22.
//

import Foundation
import UIKit
import PhotosUI

class ProfileViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, TextFieldViewControllerDelegate, PickerViewViewControllerDelegate, PHPickerViewControllerDelegate {
    
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        picker.dismiss(animated: true, completion: nil)
        
        let identifiers = results.compactMap(\.assetIdentifier)
        let fetchResult = PHAsset.fetchAssets(withLocalIdentifiers: identifiers, options: nil)
        fetchResult.enumerateObjects { (asset, index, stop) -> Void in
                    PHImageManager.default().requestImage(for: asset,
                                                          targetSize: CGSize.init(width: 48, height: 48),
                                                          contentMode: PHImageContentMode.aspectFill,
                                                          options: nil) { (image: UIImage?, _: [AnyHashable : Any]?) in
                        self.profilePic.image = image
                        
                    }
        }
        
    }
    

    let titulos: [String] = ["Nome", "Idade", "Raça", "Pelagem", "Peso", "Porte", "Tipo Sanguíneo", "Atividade"]
    var atributos = ["Não especificado", "Não especificado", "Não especificado", "Não especificado", "Não especificado", "Não especificado", "Não especificado", "Não especificado"]
    var textoTitulo: String = ""
    var infoRecebida: [Any] = []
    var indexRecebido: String?
    var indexForRowOriginal: String?
    var imagemPerfilUsuario: UIImage?
    
    
    @IBOutlet var labelNomeDoCao: UILabel!
    @IBOutlet var profilePic: UIImageView!
    @IBOutlet var tableViewOne: UITableView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        profilePic.layer.cornerRadius = 16
        tableViewOne.delegate = self
        tableViewOne.dataSource = self
        tableViewOne.backgroundColor = .white
    }
    
    func doSomethingWith(data: [String]) {
        infoRecebida = data
        let i = Int(data[1])
        atributos[i!] = data[0]
        self.tableViewOne.reloadData()
        labelNomeDoCao.text = atributos[0]
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableViewOne.dequeueReusableCell(withIdentifier: "pickerCell", for: indexPath) as! CelulaTableViewCell
        //var content = cell.defaultContentConfiguration()
        //content.text = titulos[indexPath.row]
        //content.textProperties.color = UIColor(red: 74/255.0, green: 65/255.0, blue: 140/255.0, alpha: 1.0)
        //cell.contentConfiguration = content
        cell.textLabel?.text = titulos[indexPath.row]
        cell.textLabel?.textColor = UIColor(red: 74/255.0, green: 65/255.0, blue: 140/255.0, alpha: 1.0)
        cell.textLabel?.font = UIFont.systemFont(ofSize: 17)
        cell.detailTextLabel?.textColor = .systemGray2
        cell.detailTextLabel?.font = UIFont.systemFont(ofSize: 15)
        cell.detailTextLabel?.text = atributos[indexPath.row]
        cell.backgroundColor = .white
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 8
    }
    
    @IBAction func tocouFotoPerfil() {
        var config = PHPickerConfiguration(photoLibrary: PHPhotoLibrary.shared())
        config.selectionLimit = 1
        config.filter = PHPickerFilter.images
        let imagePickerVC = PHPickerViewController(configuration: config)
        imagePickerVC.delegate = self
        self.present(imagePickerVC, animated: true, completion: nil)
    }
    @IBAction func shareButtonFunc() {
        let alert = UIAlertController(title: "Calma lá!", message: "Essa função ainda não foi implementada, quando estiver disponível você será avisade via atualização <3", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
            switch action.style{
                case .default:
                print("default")
                
                case .cancel:
                print("cancel")
                
                case .destructive:
                print("destructive")
                
                
            @unknown default:
                fatalError()
            }
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 || indexPath.row == 2 || indexPath.row == 3{
            if indexPath.row == 0{
                textoTitulo = " o nome "
                indexRecebido = String(indexPath.row)
            }else if indexPath.row == 2{
                textoTitulo = " a raça "
                indexRecebido = String(indexPath.row)
            }else if indexPath.row == 3{
                textoTitulo = " a cor da pelagem "
                indexRecebido = String(indexPath.row)
            }
            self.performSegue(withIdentifier: "textFieldSegue", sender: self)
        }else{
            if indexPath.row == 1{
                indexRecebido = "0"
            }else if indexPath.row == 4{
                    indexRecebido = "1"
            }else if indexPath.row == 5{
                indexRecebido = "2"
            }else if indexPath.row == 6{
                indexRecebido = "3"
            }else if indexPath.row == 7{
                indexRecebido = "4"
            }
            indexForRowOriginal = String(indexPath.row)
            self.performSegue(withIdentifier: "selectionSegue", sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "selectionSegue"{
            let pickerViewVC = segue.destination as! PickerViewViewController
            pickerViewVC.delegate = self
            pickerViewVC.index1 = indexRecebido
            pickerViewVC.indexForRow = indexForRowOriginal
            
        }else if segue.identifier == "textFieldSegue"{
            let textFieldVC = segue.destination as! TextFieldViewController
            textFieldVC.delegate = self
            textFieldVC.textinho = "Digite" + textoTitulo + "abaixo"
            textFieldVC.index = indexRecebido
        }
    }
    
    
    
}
