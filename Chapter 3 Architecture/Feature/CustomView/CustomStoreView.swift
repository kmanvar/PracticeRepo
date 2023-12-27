//
//  CustomStoreView.swift
//  Chapter3
//
//  Created by Kishan Mac Pro on 25/12/23.
//  Copyright © 2023 Packt. All rights reserved.
//

import Foundation
import SwiftUI

struct CustomStoreView: View {
    let index: Int
    
    var body: some View {
        VStack{
            let url = URL(string: "https://picsum.photos/200/160?random=\(index)")

            if #available(iOS 15.0, *) {
                AsyncImage(url: url) { phase in
                    if let image = phase.image {
                        image
                            .resizable()
                            .frame(height: 100)
                            .aspectRatio(contentMode: .fill)
                
                            .foregroundColor(.white)
                        
                        
                    }
                    else {
                        Image(systemName: "car.fill")
                            .resizable()
                            .frame(height: 100)
                            .aspectRatio(contentMode: .fill)
                          
                            .foregroundColor(.white)
                    }
                }
            } else {
                Image(systemName: "car.fill")
                                    .resizable()
                                    .frame(height: 100)
                                    .aspectRatio(contentMode: .fill)
                                  
                                    .foregroundColor(.white)
            }

            
        VStack (alignment: .leading){
            
            Text("Dominoss")
                    .foregroundColor(.black)
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity,maxHeight: 20,alignment: .leading)
            Text("200 ₹")
                    .foregroundColor(.black)
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity,maxHeight: 20,alignment: .leading)
                
                HStack(){
                    if #available(iOS 15.0, *) {
                        HStack {
                            Image(systemName: "star.fill")
                                .resizable()
                                .foregroundColor(.white)
                                .frame(width: 15, height: 15)
                            Text("5.0")
                                .foregroundColor(.white)
                                .font(.caption)
                        }
                        .padding(.horizontal,7)
                        .padding(.vertical,2)
                        .background(Capsule().fill(Color.cyan))
                    } else {
                        // Fallback on earlier versions
                    }
                    
                    
                    Text("| 30-45 mins |")
                        .font(.caption)
                        .foregroundColor(.black)
                    
                }
            }
        .padding(.horizontal,7)
            Spacer()
        }
        .frame(height: 170)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 5)

    }
}

@available(iOS 14.0, *)
struct CustomStoreView_Previews: PreviewProvider {
    static var previews: some View {
        CustomStoreView(index: 0)
    }
}
