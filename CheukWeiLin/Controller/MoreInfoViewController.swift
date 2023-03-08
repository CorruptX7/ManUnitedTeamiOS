//
//  MoreInfoViewController.swift
//  CheukWeiLin
//
//  Created by Cheuk Wei Lin on 08/03/2023.
//

import UIKit
import WebKit

class MoreInfoViewController: UIViewController, WKNavigationDelegate {

    var playerData : Player!
    
    var webView: WKWebView!
    
    override func loadView() {
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        let url = URL(string: playerData.url)!
        webView.load(URLRequest(url: url))
        webView.allowsBackForwardNavigationGestures = true
    }

}
