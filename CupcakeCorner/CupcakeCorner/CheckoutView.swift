//
//  CheckoutView.swift
//  CupcakeCorner
//
//  Created by Josue Arana on 4/28/22.
//

import SwiftUI

struct CheckoutView: View {
    
    @ObservedObject var order: Order
    @State private var confirmationMessage = ""
    @State private var showConfirmation = false
    @State private var alertTitle = "Thank you!!"
    
    var body: some View {
        ScrollView {
            VStack {
                
                //Image
                AsyncImage(url: URL(string: "https://hws.dev/img/cupcakes@3x.jpg"),
                   scale: 3) { image in
                        image
                        .resizable()
                        .scaledToFit()
                } placeholder: {
                    ProgressView()
                }
                .frame(height: 233)
                
                //Text
                Text("Your total is \(order.cost, format: .currency(code: "USD"))")
                    .font(.title)
                Button("Place Order", action: {
                    Task {
                        await placeOrder()
                    }
                    
                })
                    .padding()
            }
        }
        .navigationTitle("Check out")
        .navigationBarTitleDisplayMode(.inline)
        .alert(alertTitle, isPresented: $showConfirmation) {
            Button("OK"){}
        } message: {
            Text(confirmationMessage)
        }
    }
    
    func placeOrder() async {
        //use json encoder to encode the data
        guard let encoded = try? JSONEncoder().encode(order) else {
            print("Failed to encode order")
            return
        }
        
        let url = URL(string: "https://reqres.in/api/cupcakes")!
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
//        request.httpMethod = "POST"
        
        do {
            
            let (data, _) = try await URLSession.shared.upload(for: request, from: encoded)
            //handle the result
            
            let decodedOrder = try JSONDecoder().decode(Order.self, from: data)
            confirmationMessage = "Your order for \(decodedOrder.quantity)x\(Order.types[decodedOrder.type].lowercased()) cupcakes is on its way!"
            showConfirmation = true
            
        } catch {
            print("Checkout failed")
            confirmationMessage = "Ops! Error placing your order. Make sure you have internet connection."
            showConfirmation = true
            alertTitle = "Error!"
        }
        
    }
    
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutView(order: Order())
    }
}
