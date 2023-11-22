//
//  SearchBar.swift
//  RAWGApp
//
//  Created by Naufal Abiyyu on 22/11/23.
//

import SwiftUI

struct SearchBar: View {
    @Binding var searchText: String
    
    var body: some View {
        TextField("", text: $searchText, prompt: Text("Search").foregroundStyle(Color.gray))
            .tint(.white)
            .autocorrectionDisabled(true)
            .overlay(
                ZStack {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundStyle(Color.white)
                        .opacity(searchText.isEmpty ? 0.0 : 1.0)
                        .onTapGesture {
                            searchText = ""
                            UIApplication.shared.endEditing()
                        }
                    
                    Image(systemName: "magnifyingglass.circle")
                        .opacity(searchText.isEmpty ? 1.0 : 0.0)
                }
                , alignment: .trailing)
            .foregroundStyle(Color.white)
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.gray800)
            )
    }
}

#Preview {
    SearchBar(searchText: .constant(""))
}

extension UIApplication {
    
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
    
}
