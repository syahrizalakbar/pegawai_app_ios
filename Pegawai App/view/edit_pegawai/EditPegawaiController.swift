//
//  EditPegawaiController.swift
//  Pegawai App
//
//  Created by IDOUDA on 27/03/22.
//

import UIKit

class EditPegawaiController: UIViewController, EditPegawaiDelegate {
    
    var pegawai: Pegawai?
    var vm: EditPegawaiViewModel?
    
    @IBOutlet weak var nama: UITextField!
    @IBOutlet weak var posisi: UITextField!
    @IBOutlet weak var gaji: UITextField!
    @IBOutlet weak var loading: UIActivityIndicatorView!

    override func viewDidLoad() {
        super.viewDidLoad()
        let pegawaiRepository = PegawaiRepository()
        self.vm = EditPegawaiViewModel(pegawaiRepository: pegawaiRepository, editPegawaiDelegate: self)
        nama.text = pegawai?.nama ?? ""
        posisi.text = pegawai?.posisi ?? ""
        gaji.text = pegawai?.gaji ?? ""
    }

    @IBAction func onSave(_ sender: Any) {
        print("test")
        self.vm?.editPegawai(pegawai: Pegawai(id: self.pegawai?.id, nama: nama.text, posisi: posisi.text, gaji: gaji.text))
    }
    
    @IBAction func onBack(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    func osSuccessEdit(message: String) {
        let alert = UIAlertController(title: "Success", message: message, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(alertAction)
        present(alert, animated: true, completion: nil)
    }
    
    func onErrorEdit(message: String) {
        let alert = UIAlertController(title: "Failed", message: message, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(alertAction)
        present(alert, animated: true, completion: nil)
    }
    
    func onLoading() {
        loading.isHidden = false
    }
    
    func onLoadingComplete() {
        loading.isHidden = true
    }
    
}
