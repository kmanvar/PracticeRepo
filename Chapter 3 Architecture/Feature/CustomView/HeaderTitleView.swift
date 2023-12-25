//
//  HeaderTitleView.swift
//  Chapter3
//
//  Created by Kishan Mac Pro on 22/12/23.
//  Copyright © 2023 Packt. All rights reserved.
//

import Foundation
import SwiftUI

struct HeaderTitleView: View {
    let title: String
    var body: some View {
        HStack {
            Text(title)
                .font(.title)
                .fontWeight(.medium)
                .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
            Spacer()
        }
    }
}
