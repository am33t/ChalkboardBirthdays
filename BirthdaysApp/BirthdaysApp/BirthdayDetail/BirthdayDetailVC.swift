//
//  BirthdayDetailVC.swift
//  BirthdaysApp
//
//  Created by Amit Tandel on 18/01/21.
//

import UIKit

class BirthdayDetailVC: UIViewController {
    
    @IBOutlet private weak var lblInitials: UILabel?
    @IBOutlet private weak var lblName: UILabel?
    @IBOutlet private weak var lblBirthData: UILabel?
    @IBOutlet private weak var lblAge: UILabel?
    @IBOutlet private weak var btnBack: UIButton?
    
    
    var viewModel: BirthdayPresentable? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        refreshData()
    }
    
    private func setupUI() {
        btnBack?.layer.cornerRadius = 5
        lblInitials?.superview?.layer.cornerRadius = 150 / 2
    }
    
    private func refreshData() {
        lblName?.text = viewModel?.name
        lblInitials?.text = viewModel?.initials
        lblBirthData?.text = viewModel?.birthday
        lblAge?.text = viewModel?.age
    }

    
    @IBAction private func btnBackClick(sender: UIButton?) {
        self.navigationController?.popViewController(animated: true)
    }
}
