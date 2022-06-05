//
//  ServiceInterceptor.swift
//  Pegawai App
//
//  Created by IDOUDA on 27/03/22.
//

import Foundation
import Alamofire

class HttpInterceptor : RequestInterceptor {
    func adapt(_ urlRequest: URLRequest, for session: Session, completion: @escaping (Result<URLRequest, Error>) -> Void) {
        
        let method = urlRequest.httpMethod
        let url = urlRequest.url!.absoluteString
        let headers = urlRequest.headers
        let data = NSString(data: urlRequest.httpBody ?? Data(), encoding: String.Encoding.utf8.rawValue)!
        print("""
            \(method ?? "-")
            \(url)
            \(headers)
            \(data)
        """)
        completion(.success(urlRequest))
    }
}
