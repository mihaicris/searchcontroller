//
//  ViewController.swift
//  searchcontroller
//
//  Created by mihai.cristescu on 02/10/2017.
//  Copyright © 2017 Softvision. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    private var searchController: UISearchController?

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .magenta
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(activateSearch))

    }

    @objc private func activateSearch() {
        let resultsController = ResultsViewController()
        searchController = UISearchController(searchResultsController: resultsController)
        searchController?.hidesNavigationBarDuringPresentation = true
        searchController?.delegate = self
        searchController?.searchResultsUpdater = self
        navigationItem.searchController = searchController
        searchController?.isActive = true

    }

}

extension ViewController: UISearchControllerDelegate {

    // These methods are called when automatic presentation or dismissal occurs. They will not be called if you present or dismiss the search controller yourself.
    //    func willPresentSearchController(_ searchController: UISearchController) {}
    //    func didPresentSearchController(_ searchController: UISearchController) {}
    //    func willDismissSearchController(_ searchController: UISearchController) {}
    func didDismissSearchController(_ searchController: UISearchController) {
        navigationItem.searchController = nil
    }

    // Called after the search controller's search bar has agreed to begin editing or when 'active' is set to YES.
    // If you choose not to present the controller yourself or do not implement this method, a default presentation
    // is performed on your behalf.
    func presentSearchController(_ searchController: UISearchController) {
        print("Present search controller.")
    }
}

extension ViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        print("Interation with the search bar.")
    }

}
