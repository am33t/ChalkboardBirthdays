//
//  BirthdaysListPresentable.swift
//  BirthdaysApp
//
//  Created by Amit Tandel on 18/01/21.
//

import UIKit

protocol BirthdaysListPresentable {
    func onLoad()
    func onClickIndex(index: Int)
    var birthdayVMs: [BirthdayPresentable] { get }
    var delegate: BirthdaysListPresentableDelegate? { get set }
}

protocol BirthdaysListPresentableDelegate: NSObject {
    func refreshUI()
    func navigateToBirthday(vm: BirthdayPresentable, index: Int)
}


protocol BirthdayPresentable {
    var name: String { get }
    var initials: String { get }
    var birthday: String { get }
    var age: String { get }

}
