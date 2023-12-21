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
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    // Delivery Horizontal CollectionView
                    Text("Delivery")
                        .font(.headline)
                        .padding()
                    ScrollView(.horizontal, showsIndicators: false) {
                        LazyHStack(spacing: 16) {
                            ForEach(0..<10) { index in
                                DeliveryItemView(index: index)
                                    .frame(width: 150, height: 200)
                            }
                        }
                        .padding(.horizontal)
                    }
//                    List(data, id: \.id) { item in
//                        DeliveryItemView(index: 1)
//                                .frame(width: 150, height: 200)
//
//                    }
                    
                    
                    
                    
                    // Offer Horizontal CollectionView
                    Text("Offer")
                        .font(.headline)
                        .padding()
                    ScrollView(.horizontal, showsIndicators: false) {
                        LazyHStack(spacing: 16) {
                            ForEach(0..<10) { index in
                                OfferItemView(index: index)
                                    .frame(width: 150, height: 200)
                            }
                        }
                        .padding(.horizontal)
                    }
                    
                    // Store Vertical CollectionView
                    Text("Store")
                        .font(.headline)
                        .padding()
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
                .navigationBarTitle("Home", displayMode: .automatic)
            }
        }
    }
}

struct DeliveryItemView: View {
    let index: Int
    
    var body: some View {
        VStack {
            Image(systemName: "car.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 80, height: 80)
                .padding(20)
                .foregroundColor(.white)
                .background(Color.blue)
                .clipShape(Circle())
            
            Text("Delivery \(index + 1)")
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
