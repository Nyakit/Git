//
//  RepoViewController.swift
//  GitHubRepo
//
//  Created by Пользователь on 24.05.2018.
//  Copyright © 2018 Abramenko. All rights reserved.
//

import UIKit
import WebKit

class RepoViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    var myUrl: URL?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        webLoad(url: myUrl!)
    }
    
    
    func webLoad (url: URL) {
        let myRequest = URLRequest(url: myUrl!)
        webView.load(myRequest)
    }



}
