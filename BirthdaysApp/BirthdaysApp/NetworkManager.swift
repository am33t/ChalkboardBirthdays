//
//  APIService.swift
//  BirthdaysApp
//
//  Created by Amit Tandel on 18/01/21.
//

import Foundation
import Alamofire

class NetworkManager {
    static let shared = NetworkManager()

    func apiCall() {
        let todosEndpoint: String = "https://randomuser.me/api/?results=1000&seed=chalkboard&inc=name,dob"
        let request = AF.request(todosEndpoint)
        request.responseDecodable() { (result: DataResponse<BirthdaysResponse, AFError>) in
            
        }
    }
}
