//
//  AppNavigation.swift
//  BirthdaysApp
//
//  Created by Amit Tandel on 18/01/21.
//

import UIKit

class AppNavigation {
    static func birthdaysListVC() -> UIViewController? {
        if let vc = UIStoryboard.mainStoryboard().instantiateViewController(identifier: "BirthdaysListVC") as? BirthdaysListVC {
            vc.viewModel = BirthdaysListVM()
            return vc
        }
        return nil
    }
    static func birthdayDetailVC() -> UIViewController? {
        if let vc = UIStoryboard.mainStoryboard().instantiateViewController(identifier: "BirthdayDetailVC") as? BirthdayDetailVC {
            return vc
        }
        return nil
    }
}
