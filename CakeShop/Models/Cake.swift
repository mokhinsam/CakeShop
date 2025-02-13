//
//  Cake.swift
//  CakeShop
//
//  Created by Дарина Самохина on 13.02.2025.
//

import Foundation

struct Cake: Codable {
    let title: String
    let weight: Int
    let cost: Int
    let image: String
    
    static func getCakes() -> [Cake] {
        [
            Cake(
                title: "Прага оригинальная",
                weight: 500,
                cost: 825,
                image: "pragueOriginal"
            ),
            Cake(
                title: "Любимый оригинальный",
                weight: 1400,
                cost: 1765,
                image: "favoriteOriginal"
            ),
            Cake(
                title: "Райский сад",
                weight: 1400,
                cost: 1745,
                image: "gardenOfEden"
            ),
            Cake(
                title: "Сказки Востока ассорти",
                weight: 1200,
                cost: 1830,
                image: "talesOfEastAssorted"
            ),
            Cake(
                title: "Ламбада Карибика",
                weight: 1000,
                cost: 1600,
                image: "lambadaCaribbean"
            ),
            Cake(
                title: "Киевский оригинальный",
                weight: 500,
                cost: 1085,
                image: "kyivOriginal"
            ),
            Cake(
                title: "Малиновый",
                weight: 900,
                cost: 1655,
                image: "raspberry"
            ),
            Cake(
                title: "Тайская маракуйя",
                weight: 500,
                cost: 595,
                image: "thaiPassion"
            ),
            Cake(
                title: "Ореховый по-королевски",
                weight: 850,
                cost: 1985,
                image: "royalNut"
            ),
            Cake(
                title: "Молочная девочка",
                weight: 750,
                cost: 1110,
                image: "milkGirl"
            ),
            Cake(
                title: "Ассорти",
                weight: 1100,
                cost: 1645,
                image: "assorted"
            ),
            Cake(
                title: "Блинный с фисташкой",
                weight: 900,
                cost: 1400,
                image: "pancakeWithPistachio"
            ),
            Cake(
                title: "Красный бархат",
                weight: 850,
                cost: 1490,
                image: "redVelvet"
            ),
            Cake(
                title: "Кофейный оригинальный",
                weight: 1400,
                cost: 1996,
                image: "coffeeOriginal"
            ),
            Cake(
                title: "Кокосово-миндальный",
                weight: 1000,
                cost: 1330,
                image: "coconutAlmond"
            )
        ]
    }
}
