//
//  RequestService.swift
//  TapPaymentsTest
//
//  Created by MahmoudShaabanAllam on 12/11/2022.
//

import Foundation
import Alamofire

struct RequestService {
    
    static func get(path: String, params: [String: Any]?, headers: HTTPHeaders?, success: @escaping (Data) -> Void, failure: @escaping (ErrorModel) -> Void) {
        
        guard let requestURL = URL(string: "\(Constants.iTunes.baseURL)\(path)") else {
            failure(ErrorModel.other(string: "URL encoding error."))
            return
        }
        AF.request(requestURL, method: .get, parameters: params, encoding: URLEncoding.default, headers: headers).responseData { (data) in
            
          guard let responseData = data.data else {
                failure(ErrorModel.parse(string: "Data parse error."))
                return
            }
            
            guard data.response?.statusCode == 200  else {
                failure(ErrorModel.network(string: "Connection error."))
                return
            }
            success(responseData)
        }
    }
}
