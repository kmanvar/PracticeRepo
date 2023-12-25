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
        VStack(){
            let url = URL(string: "https://picsum.photos/200/160?random=\(index)")

            Image(systemName: "car.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 80, height: 80)
                .padding(5)
                .foregroundColor(.white)
            
            Text("Dominoss")
                .foregroundColor(.black)
                .frame(alignment: .leading)

            HStack{
                if #available(iOS 15.0, *) {
                    HStack {
                        Image(systemName: "star.fill")
                            .foregroundColor(.white)
                            .frame(width: 20, height: 20)
                        Text("5.0")
                            .foregroundColor(.white)
                    }
                    .padding(EdgeInsets(top: 4, leading: 5, bottom: 4, trailing: 5))
                    .background(Capsule().fill(Color.cyan))
                } else {
                    // Fallback on earlier versions
                }


                Text("| 30-45 mins |")
                    .foregroundColor(.black)

            }
        }
        
        .frame(width: 200, height: 200)
        .background(Color.red)
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
