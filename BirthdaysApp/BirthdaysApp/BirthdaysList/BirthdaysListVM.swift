//
//  BirthdaysListVM.swift
//  BirthdaysApp
//
//  Created by Amit Tandel on 18/01/21.
//

import UIKit

class BirthdaysListVM: BirthdaysListPresentable {
    weak var delegate: BirthdaysListPresentableDelegate?
    var birthdays: [BirthdaysResponse.Result] = []

     func onLoad() {
         fetchData()
     }
    
    private func fetchData() {
        NetworkManager.shared.apiGetBirthdays { (response) in
            if let response = response {
                self.birthdays = response.results ?? []
            }
            
        }
    }

}

