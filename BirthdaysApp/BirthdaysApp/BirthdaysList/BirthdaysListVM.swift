//
//  BirthdaysListVM.swift
//  BirthdaysApp
//
//  Created by Amit Tandel on 18/01/21.
//

import UIKit

class BirthdaysListVM: BirthdaysListPresentable {
    private var birthdays: [BirthdaysResponse.Result] = []

    var birthdayVMs: [BirthdayPresentable] = []
    
    weak var delegate: BirthdaysListPresentableDelegate?

     func onLoad() {
         fetchData()
     }
    
    func onClickIndex(index: Int) {
        if let birthdayVM = birthdayVMs[safe: index] {
            delegate?.navigateToBirthday(vm: birthdayVM, index: index)
        }
    }
    
    private func fetchData() {
        NetworkManager.shared.apiGetBirthdays { [weak self] (response) in
            if let response = response {
                self?.birthdays = response.results ?? []
                self?.refreshBirthdayVMs()
                self?.notifyDelegate()
            }
        }
    }
    
    private func refreshBirthdayVMs() {
        var vms = [BirthdayVM]()
        for birthday in birthdays {
            vms.append(BirthdayVM(birthday: birthday))
        }
        birthdayVMs = vms
    }
    
    private func notifyDelegate() {
        delegate?.refreshUI()
    }
}

class BirthdayVM: BirthdayPresentable {
    var age: String
    var name: String
    var initials: String
    var birthday: String
    
    init(birthday: BirthdaysResponse.Result) {
        name = [birthday.name?.first ?? "", birthday.name?.last ?? ""].joined(separator: " ")
        self.birthday = birthday.dob?.date?.toDate(format: dateFormat1)?.toString(format: dateFormat2) ?? ""
        var chars: [String] = [String]()
        if let char = birthday.name?.first?.first {
            chars.append(String(char))
        }
        if let char = birthday.name?.last?.first {
            chars.append(String(char))
        }
    
        self.initials = chars.joined(separator: "")
        if let age = birthday.dob?.age {
            self.age = "\(String(age)) YEARS OLD"
        } else {
            self.age = ""
        }
    }
}
