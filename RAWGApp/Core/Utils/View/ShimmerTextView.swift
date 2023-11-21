//
//  ShimmerTextView.swift
//  RAWGApp
//
//  Created by Naufal Abiyyu on 21/11/23.
//

import SwiftUI
import Shimmer

struct ShimmerTextView: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(.gray)
                .frame(maxWidth: .infinity)
                .frame(height: 20)
                .redacted(reason: .placeholder)
                .shimmering(gradient: Gradient(colors: [
                    .white.opacity(0.5),
                    .white.opacity(0.6),
                    .white.opacity(0.5)
                ]))
        }
    }
}

#Preview {
    ShimmerView()
}
