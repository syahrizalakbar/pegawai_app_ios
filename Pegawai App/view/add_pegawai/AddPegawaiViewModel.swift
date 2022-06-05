//
//  AddPegawaiViewModel.swift
//  Pegawai App
//
//  Created by IDOUDA on 27/03/22.
//

import Foundation

protocol AddPegawaiDelegate {
    func onLoading()
    func onFinishLoading()
    func onSuccessAdd(message: String)
    func onFailedAdd(message: String)
}

class AddPegawaiViewModel {
    
    var repo: PegawaiRepository?
    var dg: AddPegawaiDelegate?
    
    init(repo: PegawaiRepository, dg: AddPegawaiDelegate) {
        self.repo = repo
        self.dg = dg
    }
    
    func addPegawai(pegawai: Pegawai) {
        guard pegawai.nama != nil && pegawai.posisi != nil && pegawai.gaji != nil else {
            self.dg?.onFailedAdd(message: "Please fill all form")
            return
        }
        
        guard Int(pegawai.gaji!) != nil else {
                self.dg?.onFailedAdd(message: "Gaji must be a number")
            return
        }
        
        self.dg?.onLoading()
        self.repo?.addPegawai(pegawai: pegawai, onSucces: { message in
            self.dg?.onFinishLoading()
            self.dg?.onSuccessAdd(message: message)
        }, onError: { message in
            self.dg?.onFinishLoading()
            self.dg?.onFailedAdd(message: message)
        })
    }
    
}
