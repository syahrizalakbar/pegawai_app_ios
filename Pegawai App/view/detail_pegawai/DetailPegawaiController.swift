//
//  DetailPegawaiController.swift
//  Pegawai App
//
//  Created by IDOUDA on 27/03/22.
//

import UIKit

class DetailPegawaiController: UIViewController, DetailPegawaiDelegate {
    
    var pegawai: Pegawai?
    var vm : DetailPegawaiViewModel?
    
    @IBOutlet weak var nama: UILabel!
    @IBOutlet weak var posisi: UILabel!
    @IBOutlet weak var gaji: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.vm = DetailPegawaiViewModel(pegawaiRepository: PegawaiRepository(), detailPegawaiDelegate: self)
        nama.text = pegawai?.nama ?? "-"
        posisi.text = pegawai?.posisi ?? "-"
        gaji.text = pegawai?.gaji ?? "-"
    }
    
    @IBAction func onEdit(_ sender: Any) {
        let pegawaiEdit = EditPegawaiController(nibName: "EditPegawaiController", bundle: nil)
        pegawaiEdit.pegawai = self.pegawai
        pegawaiEdit.modalPresentationStyle = .overFullScreen
        pegawaiEdit.modalTransitionStyle = .crossDissolve
        present(pegawaiEdit, animated: true, completion: nil)
    }
    
    @IBAction func onDelete(_ sender: Any) {
        let alert = UIAlertController(title: "Confirmation", message: "Are you sure to delete this data?", preferredStyle: .actionSheet)
        let deleteAction = UIAlertAction(title: "Delete", style: .destructive) { _ in
            self.vm?.deletePegawai(pegawai: self.pegawai!)
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alert.addAction(deleteAction)
        alert.addAction(cancelAction)
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func onBack(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func onAdd(_ sender: Any) {
        let addPegawai = AddPegawaiController(nibName: "AddPegawaiController", bundle: nil)
        addPegawai.modalTransitionStyle = .flipHorizontal
        addPegawai.modalPresentationStyle = .overFullScreen
        present(addPegawai, animated: true, completion: nil)
    }
    
    
    func onDeleting() {
        print("Deleting...")
    }
    
    func onSuccessDelete(message: String) {
        let alert = UIAlertController(title: "Info", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            self.dismiss(animated: true, completion: nil)
        }
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
    
    func onFailedDelete(message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
    
}
