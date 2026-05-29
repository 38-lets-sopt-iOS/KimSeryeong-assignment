//
//  WatchaMainView.swift
//  KimSereong-assignment
//
//  Created by 김세령 on 5/29/26.
//

import SwiftUI

struct WatchaMainView: View {
    @State private var selectedTab = 0

    var body: some View {
        ZStack(alignment: .bottom) {
            Color.black
                .ignoresSafeArea()

            VStack(spacing: 0) {
                headerView

                if selectedTab == 0 {
                    subscribeView
                } else {
                    emptyView
                }
            }

            if selectedTab == 0 {
                VStack {
                    Spacer()
                    subscribeBanner
                        .padding(.bottom, 94)
                }
            }

            WatchaBottomTabBar(selectedTab: $selectedTab)
        }
    }

    private var headerView: some View {
        VStack(spacing: 0) {
            HStack {
                Text("구독")
                    .font(.custom(PretendardWeight.semiBold.rawValue, size: 28))
                    .foregroundStyle(Color.white)

                Spacer()

                Image(systemName: "video")
                Image(systemName: "bell")
                Image(systemName: "person")
            }
            .font(.system(size: 24))
            .foregroundStyle(Color.white)
            .padding(.horizontal, 24)
            .padding(.top, 60)
            .padding(.bottom, 28)

            Rectangle()
                .fill(Color(uiColor: .gray600))
                .frame(height: 1)
        }
        .background(Color.black)
    }

    private var subscribeView: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading, spacing: 30) {
                mainPosterScroll
                newContentSection
                algorithmSection
                openSoonSection
                partySection
            }
            .padding(.top, 24)
            .padding(.bottom, 140)
        }
    }

    private var emptyView: some View {
        VStack {
            Spacer()

            Text("준비중입니다")
                .font(.custom(PretendardWeight.regular.rawValue, size: 16))
                .foregroundStyle(Color(uiColor: .gray100))

            Spacer()
        }
    }

    private var mainPosterScroll: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 14) {
                ForEach(1...5, id: \.self) { number in
                    mainPoster(number: number)
                }
            }
            .padding(.horizontal, 24)
        }
    }

    private var subscribeBanner: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack(spacing: 14) {
                Image(systemName: "ticket")
                    .font(.system(size: 28))

                Text("매주 500편 이상 신작 업데이트!")
                    .font(.custom(PretendardWeight.semiBold.rawValue, size: 18))
            }

            Text("지금 구독을 시작하고 다양한 콘텐츠를 무제한 감상해보세요")
                .font(.custom(PretendardWeight.regular.rawValue, size: 13))

            Text("구독 시작하기")
                .font(.custom(PretendardWeight.regular.rawValue, size: 14))
                .padding(.top, 12)
        }
        .foregroundStyle(Color.white)
        .padding(20)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color(uiColor: .watchapink))
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .padding(.horizontal, 24)
    }

    private var newContentSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("방금 막 도착한 신상 콘텐츠")
                .font(.custom(PretendardWeight.semiBold.rawValue, size: 19))
                .foregroundStyle(Color.white)
                .padding(.horizontal, 24)

            Text("예능부터 드라마까지!")
                .font(.custom(PretendardWeight.regular.rawValue, size: 14))
                .foregroundStyle(Color(uiColor: .gray000))
                .padding(.horizontal, 24)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 12) {
                    ForEach(1...5, id: \.self) { number in
                        widePoster(number: number)
                    }
                }
                .padding(.horizontal, 24)
            }
        }
    }

    private var algorithmSection: some View {
        VStack(alignment: .leading, spacing: 14) {
            HStack {
                VStack(alignment: .leading, spacing: 6) {
                    Image("왓고리즘")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 86, height: 24, alignment: .leading)

                    Text("예능부터 드라마까지!")
                        .font(.custom(PretendardWeight.regular.rawValue, size: 14))
                        .foregroundStyle(Color(uiColor: .gray000))
                }

                Spacer()

                Text("더보기")
                    .font(.custom(PretendardWeight.regular.rawValue, size: 12))
                    .foregroundStyle(Color(uiColor: .gray100))
            }
            .padding(.horizontal, 24)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 12) {
                    ForEach(1...10, id: \.self) { number in
                        poster(number: number)
                    }
                }
                .padding(.horizontal, 24)
            }
        }
    }

    private var openSoonSection: some View {
        VStack(alignment: .leading, spacing: 14) {
            sectionTitle(title: "공개 예정 콘텐츠")

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 12) {
                    ForEach(1...10, id: \.self) { number in
                        poster(number: number)
                    }
                }
                .padding(.horizontal, 24)
            }
        }
    }

    private var partySection: some View {
        VStack(alignment: .leading, spacing: 14) {
            sectionTitle(title: "왓챠 파티")

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 12) {
                    ForEach(1...3, id: \.self) { number in
                        partyCard(number: number)
                    }
                }
                .padding(.horizontal, 24)
            }
        }
    }

    private func sectionTitle(title: String) -> some View {
        HStack {
            Text(title)
                .font(.custom(PretendardWeight.semiBold.rawValue, size: 19))
                .foregroundStyle(Color.white)

            Spacer()

            Text("더보기")
                .font(.custom(PretendardWeight.regular.rawValue, size: 12))
                .foregroundStyle(Color(uiColor: .gray100))
        }
        .padding(.horizontal, 24)
    }

    private func mainPoster(number: Int) -> some View {
        let imageName = number % 2 == 0 ? "main2" : "main1"

        return Image(imageName)
            .resizable()
            .scaledToFill()
        .frame(width: 260, height: 370)
        .clipShape(RoundedRectangle(cornerRadius: 12))
    }

    private func widePoster(number: Int) -> some View {
        let imageName = number % 2 == 0 ? "new2" : "new1"

        return Image(imageName)
            .resizable()
            .scaledToFill()
        .frame(width: 320, height: 150)
        .clipShape(RoundedRectangle(cornerRadius: 8))
    }

    private func poster(number: Int) -> some View {
        let imageName = number % 2 == 0 ? "sub2" : "sub1"

        return Image(imageName)
            .resizable()
            .scaledToFill()
        .frame(width: 108, height: 160)
        .clipShape(RoundedRectangle(cornerRadius: 6))
    }

    private func partyCard(number: Int) -> some View {
        let imageName = number % 2 == 0 ? "party2" : "party1"
        let partyTime = number == 2 ? "오늘 22:20에 시작" : "오늘 21:30에 시작"
        let partyTitle = number == 2 ? "# 파묘" : "# 왕과사는 남자"

        return VStack(alignment: .leading, spacing: 0) {
            ZStack(alignment: .topTrailing) {
                Image(imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(height: 112)
                    .clipped()

                if number == 1 {
                    Image(systemName: "bell.fill")
                        .font(.system(size: 18))
                        .foregroundStyle(Color.black)
                        .frame(width: 38, height: 38)
                        .background(Color.white)
                        .clipShape(Circle())
                        .padding(8)
                }
            }

            VStack(alignment: .leading, spacing: 8) {
                Text(partyTime)
                    .font(.custom(PretendardWeight.regular.rawValue, size: 14))
                    .foregroundStyle(Color(uiColor: .watchapink))

                Text(partyTitle)
                    .font(.custom(PretendardWeight.semiBold.rawValue, size: 14))
                    .foregroundStyle(Color.white)
            }
            .padding(.horizontal, 10)
            .padding(.vertical, 10)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(Color(uiColor: .gray600))
        }
        .frame(width: 170)
        .clipShape(RoundedRectangle(cornerRadius: 4))
    }
}

#Preview {
    WatchaMainView()
}
