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
    
    func apiGetBirthdays(completion: @escaping (_ response: BirthdaysResponse?) -> Void) {
        let todosEndpoint: String = "https://randomuser.me/api/?results=1000&seed=chalkboard&inc=name,dob"
        let request = AF.request(todosEndpoint)
        request.responseDecodable() { (response: DataResponse<BirthdaysResponse, AFError>) in
            completion(response.value)
        }
    }
}
