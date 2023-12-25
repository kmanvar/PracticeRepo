//
//  HomeVIewModel.swift
//  Chapter3
//
//  Created by Kishan Mac Pro on 22/12/23.
//  Copyright © 2023 Packt. All rights reserved.
//

import UIKit
import Combine

class HomeViewModel: ObservableObject {
    
    init() {
        getPosts()
    }
    
    @Published var arrDeliveries : [ModelDelivery] = []

    private func getPosts() {
        guard let url = URL(string: "https://picsum.photos/v2/list") else {
            return
        }
        NetworkManager.loadDelivery(url: url) { articles in
            
            if let articles = articles {
                self.arrDeliveries = articles
            }
        }
    }
    
    
}
