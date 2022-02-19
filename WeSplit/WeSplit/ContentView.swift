//
//  ContentView.swift
//  WeSplit
//
//  Created by Josue Arana on 2/8/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 18
    @FocusState private var amountIsFocused: Bool
    
    
    let tipPercentages = [10,15,18,20,0]
    
    var tipTotal: Double {
        let tipSelection = Double(tipPercentage)
        let tipValue = checkAmount / 100 * tipSelection
        return tipValue
    }
    
    var totalCheckAmount: Double {
        let grandTotal = checkAmount + tipTotal
        return grandTotal
    }
    
    var totalPerPerson: Double {
        //calculate total per person
        let peopleCount = Double(numberOfPeople + 2)
        let amountPerPerson = totalCheckAmount / peopleCount
        return amountPerPerson
    }
    var currencyFormatter: FloatingPointFormatStyle<Double>.Currency {
        return .currency(code: Locale.current.currencyCode ?? "USD")
    }
    
    var body: some View {
        
        NavigationView {
            Form {
                Section {
                    TextField("Amount", value: $checkAmount, format: currencyFormatter)
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused)
                    
                    Picker("Number of people", selection: $numberOfPeople){
                        ForEach(2..<30){
                            Text("\($0) people")
                        }
                    }
                } header: {
                    Text("Enter check amount ")
                }
                Section {
                    Picker("Tip Percentage", selection: $tipPercentage){
                        ForEach(tipPercentages, id: \.self){
                            Text($0, format: .percent)
                        }
                    }
                    .pickerStyle(.segmented)
                    .padding()
                    
                    Text("Tip Amount: \(tipTotal, format: currencyFormatter) ")
                        .padding(.leading)
                }
                header: {
                    Text("Tip %")
                }
                //Total Check Amount
                Section {
                    Text(totalCheckAmount, format: currencyFormatter)
                        .foregroundColor( tipPercentage > 0 ? .green : .red )
                } header: {
                    Text("Total Check Amount")
                }
                //Total Per Person
                Section {
                    Text(totalPerPerson, format: currencyFormatter)
                } header: {
                    Text("Total per person")
                }
            }
            .navigationTitle("WeSplit")
            .navigationBarTitleDisplayMode(.automatic)
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    Button("Done"){
                        amountIsFocused = false
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
