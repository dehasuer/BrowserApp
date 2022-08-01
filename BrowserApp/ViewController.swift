//
//  ViewController.swift
//  BrowserApp
//
//  Created by Deha Süer on 1.08.2022.
//

import UIKit
import WebKit

class ViewController: UIViewController,WKNavigationDelegate, UITextFieldDelegate {
    @IBOutlet weak var btnGo: UIBarButtonItem!
    @IBOutlet weak var btnBack: UIBarButtonItem!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        btnGo.isEnabled = false //To hide buttons when first load.
        btnBack.isEnabled = false
        textField.delegate = self
        webView.navigationDelegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let urlString = "https://youtube.com"
        let url = URL(string: urlString)
        let request = URLRequest(url: url!)
        webView.load(request)
        textField.text = urlString
        
    }
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        btnBack.isEnabled = webView.canGoBack
        btnGo.isEnabled = webView.canGoForward
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let urlString = textField.text!
        let url = URL(string: urlString)
        let request = URLRequest(url: url!)
        webView.load(request)
        
        textField.resignFirstResponder()
        
        return true
    }

    @IBAction func btnGo(_ sender: Any) {
        if webView.canGoForward{
            webView.goForward()
            textField.text = webView.url?.absoluteString
        }
    }
    
    @IBAction func btnBack(_ sender: Any) {
        if webView.canGoBack{
            webView.goBack()
            textField.text = webView.url?.absoluteString
        }
    }
}

