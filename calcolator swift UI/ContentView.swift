//
//  ContentView.swift
//  calcolator swift UI
//
//  Created by Doruk ERSOY on 11/23/24.
//

import SwiftUI

struct ContentView: View {
    @State private var number1: String = "" // Input for the first number
    @State private var number2: String = "" // Input for the second number
    @State private var result: String = ""  // Output for the result

    var body: some View {
        NavigationStack {
            VStack {
                // Buttons for operations
                HStack {
                    Button(action: {
                        calculateResult(operation: "+")
                    }) {
                        Text("+") // Addition Button
                            .padding(8)
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(5)
                    }
                    Button(action: {
                        calculateResult(operation: "-")
                    }) {
                        Text("-") // Subtraction Button
                            .padding(8)
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(5)
                    }
                    Button(action: {
                        calculateResult(operation: "*")
                    }) {
                        Text("x") // Multiplication Button
                            .padding(8)
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(5)
                    }
                    Button(action: {
                        calculateResult(operation: "/")
                    }) {
                        Text("/") // Division Button
                            .padding(8)
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(5)
                    }
                }
                .padding()

                // TextFields for inputs and output
                VStack {
                    TextField("Number 1", text: $number1)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .keyboardType(.decimalPad) // Enables numeric keyboard
                        .padding()
                    
                    TextField("Number 2", text: $number2)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .keyboardType(.decimalPad)
                        .padding()
                    
                    Text("Result: \(result)") // Displays the result
                        .font(.headline)
                        .padding()
                }
            }
            .navigationTitle("Hesap Makinesi") // Calculator title
        }
    }

    // Function to perform the calculation
    private func calculateResult(operation: String) {
        guard let num1 = Double(number1), let num2 = Double(number2) else {
            result = "Invalid input"
            return
        }
        
        switch operation {
        case "+":
            result = String(num1 + num2)
        case "-":
            result = String(num1 - num2)
        case "*":
            result = String(num1 * num2)
        case "/":
            result = num2 != 0 ? String(num1 / num2) : "Error: Division by zero"
        default:
            result = "Unknown operation"
        }
    }
}

#Preview {
    ContentView()
}
