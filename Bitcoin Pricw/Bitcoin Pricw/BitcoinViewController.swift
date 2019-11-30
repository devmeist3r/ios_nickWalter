//
//  ViewController.swift
//  Bitcoin Pricw
//
//  Created by Lucas Inocencio on 30/11/19.
//  Copyright © 2019 Lucas Inocencio. All rights reserved.
//

import UIKit

class BitcoinViewController: UIViewController {
    
    @IBOutlet weak var dolarLabel: UILabel!
    @IBOutlet weak var jpyLabel: UILabel!
    @IBOutlet weak var eurLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        if let usd = UserDefaults.standard.string(forKey: "USD") {
            dolarLabel.text = usd
        }
        if let eur = UserDefaults.standard.string(forKey: "EUR") {
            eurLabel.text = eur
        }
        if let jpy = UserDefaults.standard.string(forKey: "JPY") {
            jpyLabel.text = jpy
        }
        
        
        
        getPrice()
    }
    
    func getStringFor(price:Double, currencyCode:String) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencyCode = currencyCode
        if let priceString = formatter.string(from: NSNumber(value: price)) {
            return priceString
        }
        return "Error"
    }
    
    
    func getPrice() {
        if let url = URL(string: "https://min-api.cryptocompare.com/data/price?fsym=BTC&tsyms=USD,JPY,EUR") {
            URLSession.shared.dataTask(with: url) { (data:Data?, response:URLResponse?, error:Error?) in
                if error == nil {
                    if data != nil {
                        if let json = try? JSONSerialization.jsonObject(with: data!, options: []) as? [String:Double] {
                            DispatchQueue.main.async {
                                
                                if let usdPrice = json["USD"] {
                                    self.dolarLabel.text = self.getStringFor(price: usdPrice, currencyCode: "USD")
                                    UserDefaults.standard.set(self.getStringFor(price: usdPrice, currencyCode: "USD") + "~", forKey: "USD")
                                }
                                if let eurPrice = json["EUR"] {
                                    self.eurLabel.text = self.getStringFor(price: eurPrice, currencyCode: "EUR")
                                    UserDefaults.standard.set(self.getStringFor(price: eurPrice, currencyCode: "EUR") + "~", forKey: "EUR")
                                }
                                if let jpyPrice = json["JPY"] {
                                    self.jpyLabel.text = self.getStringFor(price: jpyPrice, currencyCode: "JPY")
                                    UserDefaults.standard.set(self.getStringFor(price: jpyPrice, currencyCode: "JPY") + "~", forKey: "JPY")
                                }
                                
                            }
                        }
                    }
                    
                    
                } else {
                    print("We have an error")
                }
            }.resume()
        }
    }
    
    
    @IBAction func refreshTapped(_ sender: Any) {
        getPrice()
    }
    
    
}

