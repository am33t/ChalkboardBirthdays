//
//  BirthdaysListViewController.swift
//  BirthdaysApp
//
//  Created by Amit Tandel on 18/01/21.
//

import UIKit

class BirthdaysListVC: UIViewController {
    var viewModel: BirthdaysListPresentable? = nil
    @IBOutlet private weak var tableView: UITableView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup() {
        self.title = "Birthdays"
        
        viewModel?.delegate = self
        viewModel?.onLoad()
        tableView?.dataSource = self
        tableView?.delegate = self
    }

}

extension BirthdaysListVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.birthdayVMs.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "BirthdaysListVC_Cell") as? BirthdaysListVC_Cell {
            cell.setVM(vm: viewModel?.birthdayVMs[safe: indexPath.row])
            return cell
        }
        return UITableViewCell.init()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel?.onClickIndex(index: indexPath.row)
    }
    
}

extension BirthdaysListVC: BirthdaysListPresentableDelegate {
    func navigateToBirthday(vm: BirthdayPresentable, index: Int) {
        if let vc = AppNavigation.birthdayDetailVC() as? BirthdayDetailVC {
            vc.viewModel = vm
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    func refreshUI() {
        tableView?.reloadData()
    }
    
}

class BirthdaysListVC_Cell: UITableViewCell {
    @IBOutlet private weak var lblInitials: UILabel?
    @IBOutlet private weak var lblName: UILabel?
    @IBOutlet private weak var lblBirthData: UILabel?

    func setVM(vm: BirthdayPresentable?) {
        lblName?.text = vm?.name
        lblInitials?.text = vm?.initials
        lblBirthData?.text = vm?.birthday
    }
    
    override func awakeFromNib() {
        setupUI()
    }
    
    private func setupUI() {
        lblInitials?.superview?.layer.cornerRadius = 30
    }
}
