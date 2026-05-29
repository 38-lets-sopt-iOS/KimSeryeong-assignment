//
//  WatchaBottomTabBar.swift
//  KimSereong-assignment
//
//  Created by 김세령 on 5/29/26.
//

import SwiftUI

struct WatchaBottomTabBar: View {
    @Binding var selectedTab: Int

    var body: some View {
        HStack(spacing: 0) {
            Button {
                selectedTab = 0
            } label: {
                VStack(spacing: 6) {
                    Text("W")
                        .font(.custom(PretendardWeight.black.rawValue, size: 24))
                        .frame(width: 24, height: 24)

                    Text("구독")
                        .font(.custom(PretendardWeight.regular.rawValue, size: 12))
                }
                .foregroundStyle(selectedTab == 0 ? Color.white : Color(uiColor: .gray300))
                .frame(maxWidth: .infinity)
            }

            Button {
                selectedTab = 1
            } label: {
                VStack(spacing: 6) {
                    Image(systemName: "square.grid.2x2")
                        .font(.system(size: 24))
                        .frame(width: 24, height: 24)

                    Text("개별 구매")
                        .font(.custom(PretendardWeight.regular.rawValue, size: 12))
                }
                .foregroundStyle(selectedTab == 1 ? Color.white : Color(uiColor: .gray300))
                .frame(maxWidth: .infinity)
            }

            Button {
                selectedTab = 2
            } label: {
                VStack(spacing: 6) {
                    Image(systemName: "wallet.pass")
                        .font(.system(size: 24))
                        .frame(width: 24, height: 24)

                    Text("웹툰")
                        .font(.custom(PretendardWeight.regular.rawValue, size: 12))
                }
                .foregroundStyle(selectedTab == 2 ? Color.white : Color(uiColor: .gray300))
                .frame(maxWidth: .infinity)
            }

            Button {
                selectedTab = 3
            } label: {
                VStack(spacing: 6) {
                    Image(systemName: "magnifyingglass")
                        .font(.system(size: 24))
                        .frame(width: 24, height: 24)

                    Text("찾기")
                        .font(.custom(PretendardWeight.regular.rawValue, size: 12))
                }
                .foregroundStyle(selectedTab == 3 ? Color.white : Color(uiColor: .gray300))
                .frame(maxWidth: .infinity)
            }

            Button {
                selectedTab = 4
            } label: {
                VStack(spacing: 6) {
                    Image(systemName: "folder")
                        .font(.system(size: 24))
                        .frame(width: 24, height: 24)

                    Text("보관함")
                        .font(.custom(PretendardWeight.regular.rawValue, size: 12))
                }
                .foregroundStyle(selectedTab == 4 ? Color.white : Color(uiColor: .gray300))
                .frame(maxWidth: .infinity)
            }
        }
        .buttonStyle(.plain)
        .padding(.top, 15)
        .padding(.horizontal, 16)
        .padding(.bottom, 34)
        .frame(height: 112)
        .background(Color.black)
    }
}

#Preview {
    WatchaBottomTabBarPreview()
}

private struct WatchaBottomTabBarPreview: View {
    @State private var selectedTab = 0

    var body: some View {
        VStack {
            Spacer()
            WatchaBottomTabBar(selectedTab: $selectedTab)
        }
        .background(Color.black)
        .ignoresSafeArea(edges: .bottom)
    }
}
