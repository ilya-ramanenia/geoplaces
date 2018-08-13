//
//  Place.swift
//  GeoPlaces
//
//  Created by Ilya Ramanenia on 6/29/18.
//  Copyright © 2018 ilyaramanenia. All rights reserved.
//

import Foundation
import CoreLocation

struct Place {
    var id: String
    var name: String
    var score: Float
    var description: String
    var latitude: Double
    var longitude: Double
    var imageURL: String?
}

extension Place {
    var coordinate: CLLocationCoordinate2D {
        return CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}

extension Place {
    static var fakePlaces: [Place] {
        return [
            Place(id: "1", name: "Раковский бровар", score: 4.7, description: "Первый пивной ресторан в Беларуси интересен по трем причинам. Первая — это ресторан-пивоварня, где делают 6 сортов живого пива. Вторая — «Раковский Бровар» разместился в историческом центре Минска, в Раковском предместье. И третья — здесь подают традиционные блюда национальной кухни, а также классику европейской. Так что белорусам здесь вкусно, а туристам еще и интересно.", latitude: 53.904266, longitude: 27.548514, imageURL: "https://lh5.googleusercontent.com/p/AF1QipPn9UYqK7dUN_sPKnPC7xFUquJIwrXJDY6UEI0=w284-h160-k-no"),
            
            Place(id: "2", name: "Друзья", score: 4.1, description: "Ресторан-пивоварня «Друзья» – самый крупный ресторан в Минске и один из крупнейших ресторанов в СНГ на 1 100 посадочных мест с летней террасой и живой музыкой. Каждый день здесь отдыхает до 1000 гостей, выпивается более чем 500 литров пива, съедается около 300 кг. мяса.", latitude: 53.928043, longitude: 27.567799, imageURL: "https://lh5.googleusercontent.com/p/AF1QipMqLpmqndsrQJQlNIph1HNhroWjp40atpZtCadP=w213-h160-k-no"),
            
            Place(id: "3", name: "Лидо", score: 4.33, description: "Ресторан «ЛИДО» ­– это место, где всех гостей встречают теплой улыбкой и угощают по-домашнему вкусными блюдами. Побывав в нашем ресторане однажды, вам непременно захочется вернуться сюда снова.", latitude: 53.917008, longitude: 27.585356, imageURL: "https://lh3.ggpht.com/p/AF1QipPP4_yqExWm5R3E8DVZwZAPuziqKT1XvNbG38Jx=s1024"),
            
            Place(id: "4", name: "Макдональдс", score: 3.8, description: "День рождения в МакДональдс – это настоящее приключение с веселыми играми, подарками и лакомствами! Подарите своему ребенку День рождения, о котором он мечтает!", latitude: 53.954711, longitude: 27.619518, imageURL: "https://lh5.googleusercontent.com/p/AF1QipOvaOjbNXe37IxiUn2ntLlpK2XYIMWiak1-C6hF=w408-h306-k-no"),
            
            Place(id: "5", name: "KFC", score: 3.4, description: "KFC — это легендарные блюда по рецептам Полковника Сандерса, качество по мировым стандартам и свыше 300 ресторанов в России и СНГ! Следите за новостями о промо-акциях, купонах, скидках, меню KFC и новых продуктах, а также открытии ресторанов. Участвуйте в конкурсах и выигрывайте подарки!", latitude: 53.918294, longitude: 27.576928, imageURL: "https://lh5.googleusercontent.com/p/AF1QipMYv9Il5L7tFKzTlexiL0eUPcdJ2_x2udQ8o7pK=w408-h229-k-no"),
            
            Place(id: "6", name: "Burger King", score: 3.64, description: "Для любителей настоящей королевской еды! \nBURGER KING — сеть быстрого питания, насчитывающая 12 500 ресторанов в 79 странах и ежедневно обслуживающая более 11 миллионов посетителей по всему миру. Почему BURGER KING занимает лидирующее место? Наш секрет в прожарке говядины по особой методике! Оригинальный бургер «ВОППЕР» тому доказательство. Ингредиенты высшего качества, фирменные рецепты и приятная атмосфера — вот что ждёт вас в наших ресторанах!", latitude: 53.890229, longitude: 27.550496, imageURL: "https://lh5.googleusercontent.com/p/AF1QipOXH174819xiD3bMf4F5bq46-ZM2CFzfuhrFSBt=w408-h229-k-no"),
            
            Place(id: "7", name: "Сталоука тракторного", score: 1.1, description: "Минский тракторный завод (МТЗ) был основан 29 мая 1946 года. За более чем семидесятилетнюю историю своего существования завод превратился в одного из крупнейших производителей сельскохозяйственной техники в мире, на котором работает более 17 000 человек.", latitude: 53.889226, longitude: 27.615105, imageURL: "https://lh5.googleusercontent.com/p/AF1QipNvSjPOXjPgbqbXMOIAXRMMqoZn2Dg-VWKuszdw=w408-h237-k-no"),
            
            Place(id: "8", name: "Шаурма на Монетке", score: 5.0, description: "Искра. Буря. Безумие", latitude: 53.921227, longitude: 27.579801, imageURL: "https://lh4.googleusercontent.com/proxy/HW4H9SGtjpEr250So063uPf1K-sZVtEOnxe_L6RAyExGUZDKCWGPgXJJCADP-Ck2VzC2Px1H_mZBqL6LC2naV7rTHD-3KswukeAhaozEr1FyTc8wP1CsJmvKSIkQvsZxM1YBN12K_LMzzVKKEseRfF1q8DIFhYo=w408-h305-k-no"),
            
            Place(id: "9", name: "Казачны Замак", score: 3.75, description: "Пицца — такое блюдо, которое уместно в любой ситуации. Будь то встреча с друзьями, день рождения, досуг всей семьей. Она никогда не надоедает, и хочется только пробовать все новые и новые вкусы. В пиццериях сети «Сказочный замок», так удачно рассредоточенных по разным частям столицы, пиццу готовят уже 20 лет. За это время к умелым рукам поваров прибавились опыт и хорошее знание вкусовых предпочтений покупателей.", latitude: 53.922873, longitude: 27.603512, imageURL: "https://lh5.googleusercontent.com/p/AF1QipMBCQnYRLGhC1E1UeVZgeU1qBoITNIf_ns2Txi7=w408-h306-k-no"),
            
            Place(id: "10", name: "Surf Coffee", score: 4.4, description: "SURF — это символ определённого образа жизни: свободного и тесно связанного с природой. Для нас важно место, оно, как необходимый островок свободы; уникальная атмосфера, общение и, конечно же, продукт — это всё, что мы предлагаем нашим гостям. Каждый наш гость – это новый или старый друг, с которым мы искренне и с достоинством поддерживаем дружбу. Как гостеприимные хозяева, мы всегда советуем им лучшее, что можем дать.", latitude: 53.897197, longitude: 27.559268, imageURL: "https://lh5.googleusercontent.com/p/AF1QipPN9pKBAIXkirfbQLfZEunU5wWib6KXdHmFqDeB=w240-h160-k-no"),
            
            Place(id: "11", name: "Столичный", score: 2.6, description: "Торговый комплекс \"Столичный\" предлагает услугу собственного производства! Мы приготовим для Вас торты для любого торжества - свадьбы, юбилея, Дня рождения, корпоратива! Любой сложности, формы и размера! А так же, у нас вы найдете множество блюд, праздничных и повседневных. Мы приготовим для Вас красиво и вкусно! Вам не придется стоять за плитой, мы сделаем это за вас!", latitude: 53.915836, longitude: 27.584586, imageURL: "https://lh5.googleusercontent.com/p/AF1QipPkbPV41q1ooN0XgF2oFFvH-OwOLcEh2404AWbu=w329-h160-k-no"),
        ]
    }
}
