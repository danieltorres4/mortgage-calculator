//
//  Calculate.swift
//  MortgageCalculator
//
//  Created by Iván Sánchez Torres on 03/03/23.
//

import Foundation

class Calculate: ObservableObject {
    /// M = P[r(1+r)^n/((1+r)^n)-1)]
    /// M = the total monthly mortgage payment
    /// P = the principal loan amount(Purchase Price - Down Payment)
    /// r = your monthly interest rate
    /// n = number of payments over the loan’s lifetime.
    
    func calculateLoanAmount(purchasePrice: Double, downPayment: Double) -> Double {
        /// M
        purchasePrice - downPayment
    }
    
    func calculateEstimatedPerMonth(purchasePrice: Double, downPayment: Double, repaymentTime: Double, interestRate: Double) -> Double {
        let loanAmount = purchasePrice - downPayment
        let n = repaymentTime * 12.0
        let r = (interestRate / 100) / 12.0
        let rPlusOne = 1 + r /// this is (1 + r) in the given formula
        let rToPower = pow(rPlusOne, n) /// this is (1 + r)^n
        let numerator = r * rToPower
        let denominator = rToPower - 1
        
        return loanAmount * (numerator/denominator)
    }
}
