//
//  OnBoardingSlide.swift
//  RAWGApp
//
//  Created by Naufal Abiyyu on 21/11/23.
//

import SwiftUI

struct OnBoardingSlide: View {
    @EnvironmentObject var homePresenter: HomePresenter
    @AppStorage("currentView") var currentView = 1
    
    @State private var pageIndex = 0
    @State private var navIsActive = false
    @State private var isLoading = false
    private let pages: [Page] = Page.onBoardingPages
    private let dotAppearance = UIPageControl.appearance()
    
    var body: some View {
        
        if currentView == 4 {
            NavigationStack {
                HomeView(presenter: homePresenter)
            }
        } else {
            TabView(selection: $pageIndex) {
                ForEach(pages) { page in
                    VStack {
                        Spacer()
                        OnBoardingView(page: page)
                        Spacer()
                        
                        
                        if page == pages.last {
                            if isLoading {
                                ProgressView("")
                                    .progressViewStyle(CircularProgressViewStyle())
                                    .tint(.white)
                            } else {
                                Button(action: {
                                    isLoading = true
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.2) {
                                        currentView = 4
                                        isLoading = false
                                    }
                                }) {
                                    Text("Get Started")
                                        .padding()
                                        .foregroundStyle(.gray800)
                                        .background(.gray100)
                                        .cornerRadius(20)
                                }
                            }
                        } else {
                            HStack {
                                if isLoading {
                                    ProgressView("")
                                        .progressViewStyle(CircularProgressViewStyle())
                                        .tint(.white)
                                } else {
                                    Button(action: {
                                        isLoading = true
                                        DispatchQueue.main.asyncAfter(deadline: .now() + 1.2) {
                                            currentView = 4
                                            isLoading = false
                                        }
                                    }) {
                                        Text("Skip")
                                            .foregroundStyle(.gray)
                                    }
                                }
                                
                                Spacer()
                                
                                Button(action: {
                                    if page.tag == 0 {
                                        currentView = 1
                                        pageIndex += 1
                                    }
                                    if page.tag == 1 {
                                        currentView = 2
                                        pageIndex += 1
                                    }
                                    if page.tag == 2 {
                                        currentView = 3
                                        pageIndex += 1
                                    }
                                }) {
                                    Text("Next")
                                        .padding()
                                        .foregroundStyle(.gray800)
                                }
                                .foregroundStyle(.gray800)
                                .background(.gray100)
                                .cornerRadius(20)
                            }
                            .padding(.horizontal, 48)
                            
                        }
                        Spacer()
                    }
                    .tag(page.tag)
                    
                }
            }
            .animation(.easeInOut, value: pageIndex)
            .tabViewStyle(.page)
            .background(.bg)
            .indexViewStyle(.page(backgroundDisplayMode: .interactive))
            .onAppear {
                dotAppearance.currentPageIndicatorTintColor = .black
                dotAppearance.pageIndicatorTintColor = .gray
            }
        }
    }
}

#Preview {
    OnBoardingSlide()
}
