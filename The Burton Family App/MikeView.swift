//
//  Mike.swift
//  The Burton Family App
//
//  Created by Grant Burton on 8/12/25.
//

import SwiftUI

struct MikeView: View {
    @State private var flightHours: Double = 0
    var taxPayerDollars: Double {
        flightHours * 42000
    }
    
    
    
    var body: some View {
        NavigationStack {
            Form {
                Section("F-35 Flight Time") {
                    TextField("Total Time", value: $flightHours, format: .number)
                }
                Section("Tax payer dollars spent") {
                    Text(taxPayerDollars, format: .currency(code: "USD"))
                }
                Image("Mike 1")
            }
            .navigationTitle("Mike")
        }
    }
}





#Preview {
    MikeView()
}
