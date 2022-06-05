//
//  EditPegawaiViewModel.swift
//  Pegawai App
//
//  Created by IDOUDA on 27/03/22.
//

import Foundation

protocol EditPegawaiDelegate {
    func osSuccessEdit(message: String)
    func onErrorEdit(message: String)
    func onLoading()
    func onLoadingComplete()
}

class EditPegawaiViewModel {
    
    var pegawaiRepository: PegawaiRepository?
    var dg: EditPegawaiDelegate?
    
    init(pegawaiRepository: PegawaiRepository, editPegawaiDelegate: EditPegawaiDelegate) {
        self.pegawaiRepository = pegawaiRepository
        self.dg = editPegawaiDelegate
    }
    
    func editPegawai(pegawai: Pegawai) {
        guard pegawai.id != nil else {
            self.dg?.onErrorEdit(message: "ID Pegawai not found")
            return
        }
        
        dg?.onLoading()
        pegawaiRepository?.editPegawai(pegawai: pegawai, onSucces: { message in
            self.dg?.onLoadingComplete()
            self.dg?.osSuccessEdit(message: message)
        }, onError: { message in
            self.dg?.onLoadingComplete()
            self.dg?.onErrorEdit(message: message)
        })
        
        
    }
    
}
