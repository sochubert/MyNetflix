//
//  SearchViewController.swift
//  MyNetflix
//
//  Created by joonwon lee on 2020/04/02.
//  Copyright © 2020 com.joonwon. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var resultCollectionView: UICollectionView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}


extension SearchViewController: UISearchBarDelegate {
    
    // Keyboard hide
    private func dismissKeyboard() {
        searchBar.resignFirstResponder()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        dismissKeyboard()
        // 검색어가 있는지?
        guard let searchTerm = searchBar.text, searchTerm.isEmpty == false else { return }
        
        // Search by networking
        
        // Search start
        print("-->\(searchTerm)")
    }
}
