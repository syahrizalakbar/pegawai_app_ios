//
//  DeletePegawai.swift
//  Pegawai App
//
//  Created by IDOUDA on 27/03/22.
//

import Foundation

struct DeletePegawai : Decodable {
    let isSuccess: Bool
    let message: String
    
    enum CodingKeys: String, CodingKey {
        case isSuccess = "is_success"
        case message
    }
}
