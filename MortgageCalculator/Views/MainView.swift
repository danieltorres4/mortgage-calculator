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
    
    @State private var resultEstimatedPerMonth: Double = 0.0
    @State private var resultLoanAmount: Double = 0.0
    @ObservedObject var calculate = Calculate()
    
    var body: some View {
        NavigationView {
            ScrollView {
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
                        .accentColor(.white)
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
                        .accentColor(.white)
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
                        .accentColor(.white)
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
                        .accentColor(.white)
                        .padding()
                    }
                    
                    VStack {
                        Button {
                            resultLoanAmount = calculate.calculateLoanAmount(purchasePrice: purchasePrice, downPayment: downPayment)
                            
                            resultEstimatedPerMonth = calculate.calculateEstimatedPerMonth(purchasePrice: purchasePrice, downPayment: downPayment, repaymentTime: repaymentTime, interestRate: interestRate)
                            
                        } label: {
                            Label("Calculate", systemImage: "plusminus")
                                .font(.headline)
                                .padding()
                        }
                        .padding()
                        .background(Color.secondary)
                        .foregroundColor(.white)
                        .clipShape(Capsule())
                    }
                    
                    HStack {
                        VStack {
                            Text("Loan amount")
                                .font(.title3)
                                .bold()
                            Text("$\(String(format: "%.0f", resultLoanAmount))")
                                .font(.title)
                                .bold()
                        }
                        .padding()
                        
                        VStack {
                            Text("Estimated per month")
                                .font(.title3)
                                .bold()
                            
                            Text("$\(String(format: "%.0f", resultEstimatedPerMonth > 0 ? resultEstimatedPerMonth : 0))")
                                .font(.title)
                                .bold()
                        }
                        .padding()
                    }
                }
                .navigationTitle("Mortgage Calculator")
                .padding()
            }
            .background(Color.purple)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
