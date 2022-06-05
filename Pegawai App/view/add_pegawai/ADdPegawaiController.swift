//
//  AddPegawaiController.swift
//  Pegawai App
//
//  Created by IDOUDA on 27/03/22.
//

import UIKit

class AddPegawaiController: UIViewController, AddPegawaiDelegate {
    
    var vm: AddPegawaiViewModel?
    
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var jabatan: UITextField!
    @IBOutlet weak var gaji: UITextField!
    @IBOutlet weak var loading: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.vm = AddPegawaiViewModel(repo: PegawaiRepository(), dg: self)

        // Do any additional setup after loading the view.
    }

    @IBAction func onSave(_ sender: Any) {
        self.vm?.addPegawai(pegawai: Pegawai(id: nil, nama: name.text, posisi: jabatan.text, gaji: gaji.text))
    }

    func onLoading() {
        loading.isHidden = false
    }
    
    func onFinishLoading() {
        loading.isHidden = true
    }
    
    func onSuccessAdd(message: String) {
        let alert = UIAlertController(title: "Success", message: message, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "OK", style: .default, handler: {
            _ in
            self.dismiss(animated: true, completion: nil)
        })
        alert.addAction(alertAction)
        present(alert, animated: true, completion: nil)
    }
    
    func onFailedAdd(message: String) {
        let alert = UIAlertController(title: "Failed", message: message, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(alertAction)
        present(alert, animated: true, completion: nil)
    }
    


}
