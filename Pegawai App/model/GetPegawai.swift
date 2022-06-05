//
//  GetPegawai.swift
//  Pegawai App
//
//  Created by IDOUDA on 26/03/22.
//

import Foundation

struct GetPegawai : Decodable {
    let isSuccess: Bool
    let message: String
    let data: [Pegawai]
    
    enum CodingKeys: String, CodingKey {
        case isSuccess = "is_success"
        case message
        case data
    }
}
