//
//  ViewController.swift
//  criminal
//
//  Created by MacBook Pro on 6.06.2019.
//  Copyright © 2019 MacBook Pro. All rights reserved.
//

import UIKit
class ViewController: UIViewController ,UIWebViewDelegate{

    @IBOutlet weak var yuklemeScroll: UIActivityIndicatorView!
    
    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        webView.delegate = self

        let queue = DispatchQueue.global(qos:.utility)
        queue.async {
            if let url = URL(string: "https://criminal.az/"){
                let baglantiQurulduqda = URLRequest(url: url)
                    self.webView.loadRequest(baglantiQurulduqda)

                self.yuklemeScroll.hidesWhenStopped = true

            }
        }
      
    }
    //MARK: - UIActivityIndicatorView activ etmek
    func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebView.NavigationType) -> Bool {
        yuklemeScroll.startAnimating()
        return true
    }

    //MARK: - UIActivityIndicatorView dayandirmaq
    func webViewDidFinishLoad(_ webView: UIWebView) {
        yuklemeScroll.stopAnimating()
    }

    //MARK: - UIActivityIndicatorView dayanarken her hansi seflik olduqda melumat verilsin
    func webView(_ webView: UIWebView, didFailLoadWithError error: Error) {
        yuklemeScroll.stopAnimating()
        print("someThing went wrog")
    }
    
}

