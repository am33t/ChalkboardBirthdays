//
//  BirthdaysListPresentable.swift
//  BirthdaysApp
//
//  Created by Amit Tandel on 18/01/21.
//

import UIKit

protocol BirthdaysListPresentable {
    func onLoad()
    var birthdays: [BirthdaysResponse.Result] { get }
    var delegate: BirthdaysListPresentableDelegate? { get set }
}

protocol BirthdaysListPresentableDelegate: NSObject {
    func refreshUI()
}
