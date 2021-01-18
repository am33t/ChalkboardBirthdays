//
//  BirthdaysListViewController.swift
//  BirthdaysApp
//
//  Created by Amit Tandel on 18/01/21.
//

import UIKit

class BirthdaysListVC: UIViewController {
    var viewModel: BirthdaysListPresentable? = nil
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel?.delegate = self
        viewModel?.onLoad()
    }

}

extension BirthdaysListVC: BirthdaysListPresentableDelegate {
    func refreshUI() {
    }
    
    
}
