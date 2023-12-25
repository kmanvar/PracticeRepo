//
//  CustomOfferView.swift
//  Chapter3
//
//  Created by Kishan Mac Pro on 25/12/23.
//  Copyright © 2023 Packt. All rights reserved.
//

import Foundation
import SwiftUI

struct CustomOfferView: View {
//    let index: Int
//
//    var body: some View {
//        RoundedRectangle(cornerRadius: 10)
//            .fill(Color.green)
//            .overlay(
//                Text("Offer \(index + 1)")
//                    .foregroundColor(.white)
//            )
//            .frame(width: 150, height: 200)
//    }
    
    
        let obj: ModelDelivery
        let index : String
        var body: some View {
            VStack {
                
                let url = URL(string: "https://picsum.photos/200/160?random=\(index)")
                if #available(iOS 15.0, *) {
                    AsyncImage(url: url) { phase in
                        if let image = phase.image {
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 200, height: 160)
                                .padding(5)
                                .foregroundColor(.white)
                            
                            
                        }
                        else {
                            Image(systemName: "car.fill")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 80, height: 80)
                                .padding(5)
                                .foregroundColor(.white)
                        }
                    }
                } else {
                    Image(systemName: "car.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 80, height: 80)
                        .padding(5)
                        .foregroundColor(.white)
                }
                
                
                
            }
            .frame(width: 200, height: 160)
            .background(Color.white)
            .cornerRadius(10)
            .shadow(radius: 5)
        }
        
    
}
