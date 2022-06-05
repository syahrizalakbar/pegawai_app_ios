//
//  pegawai_repository.swift
//  Pegawai App
//
//  Created by IDOUDA on 26/03/22.
//

import Foundation
import Alamofire

class PegawaiRepository {
    func getPegawai(
        onSuccess: @escaping (_ data : [Pegawai]) -> Void,
        onError: @escaping (_ error: NSError?) -> Void) {
        AF.request(Constant.BASE_URL + "getPegawai.php",
                   method: .get,
                   interceptor: HttpInterceptor())
            .responseDecodable(
                of: GetPegawai.self,
                completionHandler: { (res) in
                    switch (res.result) {
                        case .success(_):
                            onSuccess(res.value?.data ?? [])
                        case .failure(_):
                            onError(res.error as NSError?)
                    }
        })
    }
    
    func editPegawai(pegawai: Pegawai, onSucces: @escaping (_ message: String) -> Void, onError: @escaping (_ message: String) -> Void ) {
        
        let params : [String : Any] = [
            "idPegawai": pegawai.id!,
            "namaPegawai": pegawai.nama!,
            "posisiPegawai": pegawai.posisi!,
            "gajiPegawai": Int(pegawai.gaji!) ?? 0
        ]
        
        AF.request(Constant.BASE_URL + "editPegawai.php",
                   method: .post,
                   parameters: params,
                   interceptor: HttpInterceptor())
            .responseDecodable(of: EditPegawai.self) { res in
                switch (res.result) {
                case .success(_):
                    if (res.value?.isSuccess == true) {
                        onSucces(res.value?.message ?? "Success")
                    } else {
                        onError(res.value?.message ?? "Failed")
                    }
                case .failure(_):
                    onError(res.error?.errorDescription ?? "Error")
                }
            }
    }
    
    
    func addPegawai(pegawai: Pegawai, onSucces: @escaping (_ message: String) -> Void, onError: @escaping (_ message: String) -> Void ) {
        
        let params : [String : Any] = [
            "namaPegawai": pegawai.nama!,
            "posisiPegawai": pegawai.posisi!,
            "gajiPegawai": Int(pegawai.gaji!) ?? 0
        ]
        
        AF.request(Constant.BASE_URL + "addPegawai.php",
                   method: .post,
                   parameters: params,
                   interceptor: HttpInterceptor())
            .responseDecodable(of: AddPegawai.self) { res in
                switch (res.result) {
                case .success(_):
                    if (res.value?.isSuccess == true) {
                        onSucces(res.value?.message ?? "Success")
                    } else {
                        onError(res.value?.message ?? "Failed")
                    }
                case .failure(_):
                    onError(res.error?.errorDescription ?? "Error")
                }
            }
    }
    
    func deletePegawai(pegawai: Pegawai,
                       onSuccess: @escaping (_ message: String) -> Void,
                       onError: @escaping (_ message: String) -> Void) {
        guard pegawai.id != nil else {
            onError("ID Not Provided")
            return
        }
        
        let params = ["idPegawai": pegawai.id!];
        
        AF.request(Constant.BASE_URL + "deletePegawai.php",
                   method: .post,
                   parameters: params,
                   interceptor: HttpInterceptor())
            .responseDecodable(of: DeletePegawai.self) { res in
                switch (res.result) {
                case .success(_):
                    if (res.value?.isSuccess == true) {
                        onSuccess(res.value?.message ?? "Success")
                    } else {
                        onError(res.value?.message ?? "Failed")
                    }
                case .failure(_):
                    onError(res.error?.errorDescription ?? "Error")
                }
            }
    }
}
