//
//  DetailPegawaiViewModel.swift
//  Pegawai App
//
//  Created by IDOUDA on 27/03/22.
//

import Foundation

protocol DetailPegawaiDelegate {
    func onDeleting()
    func onSuccessDelete(message: String)
    func onFailedDelete(message: String)
}

class DetailPegawaiViewModel {
    
    var pegawaiRepository: PegawaiRepository?
    var detailPegawaiDelegate: DetailPegawaiDelegate?
    
    init(pegawaiRepository: PegawaiRepository, detailPegawaiDelegate: DetailPegawaiDelegate) {
        self.pegawaiRepository = pegawaiRepository
        self.detailPegawaiDelegate = detailPegawaiDelegate
    }
    
    func deletePegawai(pegawai: Pegawai) {
        self.detailPegawaiDelegate?.onDeleting()
        self.pegawaiRepository?.deletePegawai(pegawai: pegawai, onSuccess: { message in
            self.detailPegawaiDelegate?.onSuccessDelete(message: message)
        }, onError: { message in
            self.detailPegawaiDelegate?.onFailedDelete(message: message)
        })
    }
    
}
