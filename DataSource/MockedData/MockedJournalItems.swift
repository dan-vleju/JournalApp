//
//  MockedJournalItems.swift
//  JournalApp
//
//  Created by Dan Vleju on 18.11.2023.
//

import Foundation

struct MockedJournalItems {
    
    static let items: [JournalItem] = [
        .init(
            id: UUID().uuidString,
            date: Date(),
            note: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam ac sapien eu odio mollis convallis quis gravida libero. Nam gravida sit amet neque sit amet cursus.",
            mainPhotoURL: URL(string: "https://img.freepik.com/free-photo/wide-angle-shot-single-tree-growing-clouded-sky-during-sunset-surrounded-by-grass_181624-22807.jpg?w=2000&t=st=1700385415~exp=1700386015~hmac=5f02de5a762e64a89951c4095476f8451c20f297511e28114bd316d928c561c1"),
            photosURLs: [
                URL(string: "https://img.freepik.com/free-photo/aerial-shot-road-forest-covered-yellowing-trees-surrounded-by-lake_181624-58374.jpg?w=2000&t=st=1700394390~exp=1700394990~hmac=333048a6b366144527884ec8ca1e34fc8e21ba93a60fb565f5dc55b4365e20b8")!,
                URL(string: "https://img.freepik.com/free-photo/breathtaking-sunrise-beach-with-green-pants-growing-shore_181624-8426.jpg?w=2000&t=st=1700394391~exp=1700394991~hmac=2523127e8afc21ee1d7ac045e4533d77401daa7ea75f0ea0e9f82c03f889d10d")!,
                URL(string: "https://img.freepik.com/free-photo/minimalist-hallways-background_23-2149745362.jpg?w=2000&t=st=1700394435~exp=1700395035~hmac=f000080751059de9b18543ecc49d605e63faa06c1c8602ccaa0ca1e3a09dde89")!,
                URL(string: "https://img.freepik.com/free-photo/beautiful-view-green-fields-sunrise-captured-canggu-bali_181624-14146.jpg?w=2000&t=st=1700394435~exp=1700395035~hmac=82931b24b0b77800c639851647de011aa7464285855f9250bfc1f8a867e7133c")!,
                URL(string: "https://img.freepik.com/free-photo/fuji-mountain-with-milky-way-night_335224-104.jpg?w=2000&t=st=1700394442~exp=1700395042~hmac=a9714b56eb403708d83847eec8e1760361927c3dfb72ca310131cc8d3173ed2b")!,
                URL(string: "https://img.freepik.com/free-photo/vertical-shot-night-winter-landscape-with-northern-lights-reflection-river_181624-54203.jpg?w=2000&t=st=1700394443~exp=1700395043~hmac=c181dec9a21b8fab901a3c306082270440b4f83177fba1ee9e296d3a3dbeabb0")!
            ],
            tags: [
                "life",
                "motivation",
                "health",
                "swiftui",
                "combine",
                "mvvm"
            ]
        ),
        .init(
            id: UUID().uuidString,
            date: Date().dateWithOffset(component: .day, value: -450),
            note: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
            mainPhotoURL: nil,
            photosURLs: [],
            tags: []
        ),
        .init(
            id: UUID().uuidString,
            date: Date().dateWithOffset(component: .day, value: -1),
            note: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam ac sapien eu odio mollis convallis quis gravida libero.",
            mainPhotoURL: nil,
            photosURLs: [],
            tags: []
        ),
        .init(
            id: UUID().uuidString,
            date: Date().dateWithOffset(component: .day, value: -35),
            note: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
            mainPhotoURL: nil,
            photosURLs: [],
            tags: []
        ),
        .init(
            id: UUID().uuidString,
            date: Date().dateWithOffset(component: .day, value: -30),
            note: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
            mainPhotoURL: nil,
            photosURLs: [],
            tags: [
                "life",
                "motivation",
                "health"
            ]
        ),
        .init(
            id: UUID().uuidString,
            date: Date().dateWithOffset(component: .day, value: -90),
            note: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam ac sapien eu odio mollis convallis quis gravida libero. Nam gravida sit amet neque sit amet cursus.",
            mainPhotoURL: nil,
            photosURLs: [],
            tags: []
        )
    ]
}

fileprivate extension Date {
    func dateWithOffset(component: Calendar.Component, value: Int) -> Date {
        let calendar = Calendar.current
        let date = calendar.date(byAdding: component, value: value, to: self)!
        
        return date
    }
}
