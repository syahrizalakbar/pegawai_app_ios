//
//  ViewController.swift
//  Pegawai App
//
//  Created by IDOUDA on 26/03/22.
//

import UIKit

class ViewController: UIViewController, MainDelegate, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tablePegawai: UITableView!
    
    var viewModel: MainViewModel?
    var listPegawai: [Pegawai]?
    
    func onSuccessListPegawai(listPegawai: [Pegawai]) {
        self.listPegawai = listPegawai
        self.tablePegawai.reloadData()
    }
    
    func onError(errorMessage: String) {
        let alert = UIAlertController(title: "Failed", message: errorMessage, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(alertAction)
        present(alert, animated: true, completion: nil)
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (listPegawai ?? []).count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemPegawaiCell", for: indexPath) as! ItemPegawaiCell
        
        let pegawai = listPegawai![indexPath.row]
        
        cell.namaPegawai.text = pegawai.nama ?? "-"
        cell.gajiPegawai.text = pegawai.gaji ?? "-"
        
        return cell;
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let pegawai = listPegawai?[indexPath.row]
        let detailPegawaiPage = DetailPegawaiController(nibName: "DetailPegawaiController", bundle: nil)
        detailPegawaiPage.pegawai = pegawai
        detailPegawaiPage.modalPresentationStyle = .overFullScreen
        detailPegawaiPage.modalTransitionStyle = .coverVertical
        present(detailPegawaiPage, animated: true, completion: nil)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        /// setup
        let pegawaiRepository = PegawaiRepository()
        viewModel = MainViewModel(with: self, pegawaiRepository: pegawaiRepository)
        tablePegawai.dataSource = self
        tablePegawai.delegate = self
        /// act
        viewModel?.getListPegawai()
    }


}

