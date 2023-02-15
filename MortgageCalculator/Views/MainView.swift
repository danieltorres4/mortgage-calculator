//
//  ContentView.swift
//  MortgageCalculator
//
//  Created by Iván Sánchez Torres on 15/02/23.
//

import SwiftUI

struct MainView: View {
    @State private var purchasePrice: Double = 0.0
    @State private var downPayment: Double = 0.0
    @State private var repaymentTime: Double = 0.0
    @State private var interestRate: Double = 0.0
    @State private var isEditing: Bool = false
    
    /// M = P[r(1+r)^n/((1+r)^n)-1)]
    /// M = the total monthly mortgage payment
    /// P = the principal loan amount(Purchase Price - Down Payment)
    /// r = your monthly interest rate
    /// n = number of payments over the loan’s lifetime.
    var loanAmount: Double {
        /// M
        return purchasePrice - downPayment
    }
    
    var estimatedPerMonth: Double {
        let n = repaymentTime * 12.0
        let r = (interestRate / 100) / 12.0
        let rPlusOne = 1 + r /// this is (1 + r) in the given formula
        let rToPower = pow(rPlusOne, n) /// this is (1 + r)^n
        let numerator = r * rToPower
        let denominator = rToPower - 1
        return loanAmount * (numerator/denominator)
    }
    
    var body: some View {
        NavigationView {
            VStack {
                VStack {
                    Text("Purchase price: $\(String(format: "%.0f", purchasePrice))")
                        .font(.title3)
                        .bold()
                    Slider(value: $purchasePrice, in: 0...1000000, step: 50000, onEditingChanged: { editing in
                        isEditing = editing
                    }, minimumValueLabel: Text("min"), maximumValueLabel: Text("max")) {
                        Text("Hello!!").font(.title)
                    }
                    .accentColor(.purple)
                    .padding()
                    
                }
                VStack {
                    Text("Down payment: $\(String(format: "%.0f", downPayment))")
                        .font(.title3)
                        .bold()
                    Slider(value: $downPayment, in: 0...1000000, step: 5000, onEditingChanged: { editing in
                        isEditing = editing
                    }, minimumValueLabel: Text("min"), maximumValueLabel: Text("max")) {
                        Text("Hello!!")
                    }
                    .accentColor(.purple)
                    .padding()
                }
                
                VStack {
                    Text("Repayment time: \(String(format: "%.0f", repaymentTime)) years")
                        .font(.title3)
                        .bold()
                    Slider(value: $repaymentTime, in: 0...100, step: 1, onEditingChanged: { editing in
                        isEditing = editing
                    }, minimumValueLabel: Text("min"), maximumValueLabel: Text("max")) {
                        Text("Hello!!")
                    }
                    .accentColor(.purple)
                    .padding()
                }
                
                VStack {
                    Text("Interest rate: \(String(format: "%.1f", interestRate)) %")
                        .font(.title3)
                        .bold()
                    Slider(value: $interestRate, in: 0...100, step: 0.5, onEditingChanged: { editing in
                        isEditing = editing
                    }, minimumValueLabel: Text("min"), maximumValueLabel: Text("max")) {
                        Text("Hello!!")
                    }
                    .accentColor(.purple)
                    .padding()
                }
                
                VStack {
                    Text("Loan amount")
                        .font(.title3)
                        .bold()
                    Text("$\(String(format: "%.0f", loanAmount))")
                        .font(.title)
                        .bold()
                }
                .padding()
                
                VStack {
                    Text("Estimated per month")
                        .font(.title3)
                        .bold()
                    
                    Text("$\(String(format: "%.0f", estimatedPerMonth > 0 ? estimatedPerMonth : 0))")
                        .font(.title)
                        .bold()
                }
                .padding()
            }
            .navigationTitle("Mortgage Calculator")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
