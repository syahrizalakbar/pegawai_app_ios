//
//  MainViewModel.swift
//  Pegawai App
//
//  Created by IDOUDA on 27/03/22.
//

import Foundation

class MainViewModel {
    
    let mainDelegate: MainDelegate
    let pegawaiRepository: PegawaiRepository
    
    init(with mainDelegate: MainDelegate, pegawaiRepository: PegawaiRepository) {
        self.mainDelegate = mainDelegate
        self.pegawaiRepository = pegawaiRepository
    }
    
    func getListPegawai() {
        pegawaiRepository.getPegawai { listPegawai in
            self.mainDelegate.onSuccessListPegawai(listPegawai: listPegawai)
        } onError: { error in
            self.mainDelegate.onError(errorMessage: error?.description ?? "Error")
        }
    }
    
}

protocol MainDelegate {
    func onSuccessListPegawai(listPegawai: [Pegawai])
    func onError(errorMessage: String)
}
