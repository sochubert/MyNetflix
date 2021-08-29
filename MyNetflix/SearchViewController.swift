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
        
        SearchAPI.search(searchTerm) { movies in
            // collectionView 표현
        }
        // Search start
        print("-->\(searchTerm)")
    }
}

class SearchAPI {
    static func search(_ term: String, completion: @escaping ([Movie]) -> Void) {
        let session = URLSession(configuration: .default)
        
        var urlComponents = URLComponents(string: "http://itunes.apple.com/search?")!
        let mediaQuery = URLQueryItem(name: "media", value: "movie")
        let entityQuery = URLQueryItem(name: "entity", value: "movie")
        let termQuery = URLQueryItem(name: "term", value: term)
        
        urlComponents.queryItems?.append(mediaQuery)
        urlComponents.queryItems?.append(entityQuery)
        urlComponents.queryItems?.append(termQuery)
        
        let requestURL = urlComponents.url!
        
        let dataTask = session.dataTask(with: requestURL, completionHandler: { data, response, error in
            let successRange = 200..<300
            guard error == nil,
                  let statusCode = (response as? HTTPURLResponse)?.statusCode,
                  successRange.contains(statusCode) else {
                return
                completion([])
            }
            guard let resultData = data else {
                completion([])
                return
            }
            let string = String(data: resultData, encoding: .utf8)
            print("==> result : \(string)")
            
            
        })
        dataTask.resume()
    }
}

struct Response {

}

struct Movie {
    
}
