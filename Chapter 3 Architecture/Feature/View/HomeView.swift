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
                                CustomDeliveryView(obj: objDeliveriesVM.arrDeliveries[i], index: "\(i)")
                                    .frame(width: 150, height: 120)
                            }
                        }
                        .padding(.horizontal)
                    }
                    
                    HeaderTitleView(title: "Offers")
                    ScrollView(.horizontal, showsIndicators: false) {
                        LazyHStack(spacing: 20) {
                            
                            ForEach(0..<objDeliveriesVM.arrDeliveries.count, id: \.self) { i in
                                CustomOfferView(obj: objDeliveriesVM.arrDeliveries[i], index: "\(i)")
                                    .frame(width: 200, height: 180)
                            }
                        }
                        .padding(.horizontal)
                    }
                    
                    HeaderTitleView(title: "Store")
                    ScrollView {
                        LazyVGrid(columns: Array(repeating: GridItem(), count: 2), spacing: 16) {
                            ForEach(0..<20) { index in
                                CustomStoreView(index: index)
                                    .frame(height: 170)
                                    .padding(.horizontal,5)
                            
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






@available(iOS 14.0, *)
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
