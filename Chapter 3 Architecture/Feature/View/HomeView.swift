import SwiftUI

@available(iOS 14.0, *)
struct HomeView: View {

    
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
