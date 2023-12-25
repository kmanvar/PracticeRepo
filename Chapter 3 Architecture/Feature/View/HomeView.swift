import SwiftUI


struct YourDataType: Identifiable {
    let id: UUID
    let name: String
    let description: String
}

extension YourDataType {
    static func dummyData() -> [YourDataType] {
        return [
            YourDataType(id: UUID(), name: "Item 1", description: "Description for Item 1"),
            YourDataType(id: UUID(), name: "Item 2", description: "Description for Item 2"),
            YourDataType(id: UUID(), name: "Item 3", description: "Description for Item 3"),
            YourDataType(id: UUID(), name: "Item 4", description: "Description for Item 4"),
            YourDataType(id: UUID(), name: "Item 5", description: "Description for Item 5"),
            YourDataType(id: UUID(), name: "Item 6", description: "Description for Item 6"),
            YourDataType(id: UUID(), name: "Item 7", description: "Description for Item 7"),
            YourDataType(id: UUID(), name: "Item 8", description: "Description for Item 8"),
            YourDataType(id: UUID(), name: "Item 9", description: "Description for Item 9"),
            YourDataType(id: UUID(), name: "Item 10", description: "Description for Item 10")
        ]
    }
}


@available(iOS 14.0, *)
struct HomeView: View {
    var data = YourDataType.dummyData()
    
    @StateObject private var objDeliveriesVM = HomeViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    HeaderTitleView(title: "Deliveries")
                    ScrollView(.horizontal, showsIndicators: false) {
                        LazyHStack(spacing: 20) {
                            
                            ForEach(0..<objDeliveriesVM.arrDeliveries.count, id: \.self) { i in

//                            ForEach(objDeliveriesVM.arrDeliveries) { data in
                                DeliveryItemView(obj: objDeliveriesVM.arrDeliveries[i], index: "\(i)")
                                    .frame(width: 150, height: 170)
                            }
                        }
                        .padding(.horizontal)
                    }
                    
                    HeaderTitleView(title: "Offers")
                    ScrollView(.horizontal, showsIndicators: false) {
                        LazyHStack(spacing: 16) {
                            ForEach(0..<10) { index in
                                OfferItemView(index: index)
                                    .frame(width: 150, height: 200)
                            }
                        }
                        .padding(.horizontal)
                    }
                    
                    HeaderTitleView(title: "Store Ads")
                    ScrollView {
                        LazyVGrid(columns: Array(repeating: GridItem(), count: 2), spacing: 16) {
                            ForEach(0..<20) { index in
                                StoreItemView(index: index)
                                    .frame(height: 150)
                            }
                        }
                        .padding()
                    }
                }
                .onAppear {
                    
                }
                .navigationBarTitle("", displayMode: .automatic)
            }
        }
    }
}

struct DeliveryItemView: View {
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
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 80, height: 80)
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
            
            
            
            Text("Delivery ")
                .foregroundColor(.black)
        }
        .frame(width: 150, height: 150)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 5)
    }
    
}

struct OfferItemView: View {
    let index: Int
    
    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .fill(Color.green)
            .overlay(
                Text("Offer \(index + 1)")
                    .foregroundColor(.white)
            )
            .frame(width: 150, height: 200)
    }
}

struct StoreItemView: View {
    let index: Int
    
    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .fill(Color.orange)
            .overlay(
                Text("Store \(index + 1)")
                    .foregroundColor(.white)
            )
            .frame(height: 150)
    }
}

@available(iOS 14.0, *)
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
