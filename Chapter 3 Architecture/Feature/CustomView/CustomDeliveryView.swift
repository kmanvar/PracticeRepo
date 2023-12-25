//
//  CustomDeliveryView.swift
//  Chapter3
//
//  Created by Kishan Mac Pro on 25/12/23.
//  Copyright © 2023 Packt. All rights reserved.
//

import Foundation
import SwiftUI

struct CustomDeliveryView: View {
    let obj: ModelDelivery
    let index : String
    var body: some View {
        VStack {
            
            let url = URL(string: "https://picsum.photos/200/200?random=\(index)")
            if #available(iOS 15.0, *) {
                AsyncImage(url: url) { phase in
                    if let image = phase.image {
                        image
                            .resizable()
                            .frame(maxHeight: 80)
                            .aspectRatio(contentMode: .fill)
                            .foregroundColor(.white)
                        
                        
                    }
                    else {
                        Image(systemName: "car.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 80, height: 80)
                            .padding(5)
                            .foregroundColor(.white)
                    }
                }
            } else {
                Image(systemName: "car.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 80, height: 80)
                    .padding(5)
                    .foregroundColor(.white)
            }
            
        
            Text("Delivery ")
                .foregroundColor(.black)
        }
        .frame(width: 150, height: 110)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 5)
    }

}
