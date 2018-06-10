//
//  ViewController.swift
//  PriorityBasisImageFetcher
//
//  Created by S@nchit on 08/06/18.
//  Copyright © 2018 self. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController : UISearchBarDelegate{
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        // launch results view controller
        let searchResultVC = SearchResultViewController.init(nibName: "SearchResultViewController", bundle: nil)
        searchResultVC.query = searchBar.text
        self.navigationController?.pushViewController(searchResultVC, animated: true)
    }
}

