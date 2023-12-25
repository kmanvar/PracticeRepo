//
//  DataModel.swift
//  Chapter 3 Architecture
//
//  Created by Chris Barker on 12/11/2019.
//  Copyright © 2019 Packt. All rights reserved.
//

import UIKit

struct PostResponse: Codable {
    let userId: Int
    let id: Int?
    let title: String?
    let body: String?
}

struct ModelDelivery: Codable, Identifiable {
    let id: String
    let download_url: String
}

//"albumId": 1,
//"id": 1,
//"title": "accusamus beatae ad facilis cum similique qui sunt",
//"url": "https://via.placeholder.com/600/92c952",
//"thumbnailUrl": "https://via.placeholder.com/150/92c952"
//{"id":"0","author":"Alejandro Escamilla","width":5000,"height":3333,"url":"https://unsplash.com/photos/yC-Yzbqy7PY","download_url":"https://picsum.photos/id/0/5000/3333"},
