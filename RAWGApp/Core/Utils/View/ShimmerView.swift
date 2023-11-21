//
//  ShimmerView.swift
//  RAWGApp
//
//  Created by Naufal Abiyyu on 17/11/23.
//

import SwiftUI
import Shimmer

struct ShimmerView: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(.gray)
                .frame(maxWidth: .infinity)
                .frame(height: 120)
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
