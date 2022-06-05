//
//  Pegawai.swift
//  Pegawai App
//
//  Created by IDOUDA on 26/03/22.
//

import Foundation

struct Pegawai : Decodable {
    let id: String?
    let nama: String?
    let posisi: String?
    let gaji: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case nama
        case posisi
        case gaji
    }
}
