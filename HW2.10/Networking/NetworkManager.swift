//
//  NetworkManager.swift
//  HW2.10
//
//  Created by Maxon on 23.09.2020.
//  Copyright © 2020 Maxim Shvanov. All rights reserved.
//

import UIKit

extension ExchangeRatesTableViewController {
    func getCurrencyList() {
        
        guard let url = URL(string: UrlLinks.cbrExchange.rawValue) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            guard let data = data else { return }
            let jsonDecoder = JSONDecoder()
            
            do {
                let valutesList = try jsonDecoder.decode(CbrExchangeRates.self, from: data)
                
                DispatchQueue.main.async {
                    self.activityIndicator.stopAnimating()
                    self.valutesList = valutesList
                    self.tableView.reloadData()
                }
            } catch let error {
                print(error)
            }
        }.resume()
    }
}

extension DetailsExtrasViewController {
    func getIpAddress() {
        
        guard let url = URL(string: UrlLinks.showIP.rawValue) else { return }
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            guard let data = data else { return }
            
            let jsonDecoder = JSONDecoder()
            
            do {
                self.ipValue = try jsonDecoder.decode(ShowIP.self, from: data)
                DispatchQueue.main.async {
                    self.activityIndicator.stopAnimating()
                    self.ipLabel.text = "Ваш IP - " + self.ipValue.ip
                }
                print(self.ipValue.ip)
            } catch let error {
                print(error.localizedDescription)
            }
        }.resume()
        
    }
    
}

extension DetailsExtrasViewController {
    func getRandomDogPicture() {
        
        guard let url = URL(string: UrlLinks.randomDog.rawValue) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            guard let data = data else { return }
            
            let jsonDecoder = JSONDecoder()
            
            do {
                self.dogImage = try jsonDecoder.decode(RandomDog.self, from: data)
                print(self.dogImage.url)
                self.dogImageUrl = URL(string: self.dogImage.url)
                self.getImage()
            } catch let error {
                print(error.localizedDescription)
            }
            
        }.resume()
    }
}

extension DetailsExtrasViewController {
    func getImage() {
        let format = "g"
        
        guard let imageURL = URL(string: self.dogImage.url) else { return }
        
        if String(imageURL.lastPathComponent.last!) == format.lowercased() || String(imageURL.lastPathComponent.last!) == format.uppercased() {
            URLSession.shared.dataTask(with: imageURL) { (data, _, _) in
                if let data = data, let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self.activityIndicator.stopAnimating()
                        self.dogScreenImageView.image = image
                    }
                }
            }.resume()
        } else {
            DispatchQueue.main.async {
                self.activityIndicator.stopAnimating()
                self.dogScreenImageView.image = .remove
            }
        }
    }
}
