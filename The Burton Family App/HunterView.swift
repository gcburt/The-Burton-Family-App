//
//  HunterView.swift
//  The Burton Family App
//
//  Created by Grant Burton on 8/14/25.
//

import SwiftUI
import SafariServices

struct SafariView: UIViewControllerRepresentable {
    let url: URL
    func makeUIViewController(context: Context) -> SFSafariViewController { .init(url: url) }
    func updateUIViewController(_ vc: SFSafariViewController, context: Context) {}
}

struct HunterView: View {
    @State private var show = false
    var body: some View {
        NavigationStack {
            Button("Link") { show = true }
                .sheet(isPresented: $show) {
                    SafariView(url: URL(string: "https://freecampsites.net")!)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .font(.title)
                .background(.green.gradient)
                .navigationTitle("Hobo-BnB")
        }
    }
}




#Preview {
    HunterView()
}

