# CakeShop 

CakeShop — это простое приложение, разработанное с использованием SwiftUI, которое демонстрирует навыки разработки мобильных приложений. Приложение позволяет пользователям просматривать Каталог тортов, выбирать понравившиеся и сохранять их в Избранное, делать заказ через Корзину. Это приложение предназначено исключительно для портфолио и обучения, а не для продакшена.


## 📌 Основные особенности
- Архитектура: **MVVM**
- Используемые технологии: **SwiftUI, Combine, Grand Central Dispatch, UserDefaults, Path, GeometryReader, Animation**
- Тестирование: **Unit Testing XCTest**


## 📋 Краткое описание основных функций приложения
- Приложение представляет из себя три экрана (Каталог, Корзина, Избранное), объединенных TabView. 
- Основой всех трех экранов является вертикальная таблица LazyVStack, которая отображает кастомные ячейки.
- Кастомная ячейка имеет две динамичных кнопки: отметка избранного и переключение счетчика кол-ва. 
- Каталог отображает все ячейки, Корзина и Избранное - ячейки, которые отметит соответствующим образом пользователь. Синхронизация ячеек между экранами выполнена с помощью Combine. 
- UserDefaults отвечает за то, чтобы для удобства пользователя сохранять и восстанавливать состояние кнопок ячеек при открытии/закрытии приложения, а вместе с ними косвенно и экранов Избранное и Корзина. 


## 🎥 Записи экрана
![Screenrecord1](https://media2.giphy.com/media/v1.Y2lkPTc5MGI3NjExdzk2czNuamdmd3psbDlqN3RhNDc2ZmhyNGR4NG9obDEydDcycGE0aCZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/gdRQy3YiPLzLSf9O0Z/giphy.gif)
![ScreenrecordOrderСart](https://media0.giphy.com/media/v1.Y2lkPTc5MGI3NjExeGJ6NmRmdXJwZDQyd3ByZWszOGZkZGpxbzFvMXRsamZyZ2lhY3djcCZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/kuOIy81E32tb6TgvKn/giphy.gif)
![ScreenrecordFavorites](https://media4.giphy.com/media/v1.Y2lkPTc5MGI3NjExdGxlNDltZHZ5OG5heDhkd2pmZTRxMm8yeTBwODF6dWFoazV5NjhsbyZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/wXlOzKSxsqsVJsREWf/giphy.gif)


## 🦾 Тесты 
- Модульный Unit Testing XCTest выполнен в качестве примера к одной из ViewModel с учетом принципов FIRST для большей эффективности.
- В качестве нейминга тестовых методов используется одна конвенция: test[MethodName][ExpectedBehaviour][Scenario]. 


## 🌳 Структура проекта
```bash
CakeShop/
├── App/
│   ├── CakeShop.entitlements
│   └── CakeShopApp.swift
├── StarterView/
│   ├── StarterView.swift
│   └── StarterViewModel.swift
├── CatalogView/
│   ├── CakeRow/
│   │     ├── CakeRow.swift
│   │     ├── CakeRowViewModel.swift
│   │     └── ImageButton.swift
│   ├── CatalogView.swift
│   ├── CatalogViewModel.swift
│   ├── LayerCakeView.swift
│   └── ScreenPlaceholderView.swift
├── OrderCartView/
│   ├── OrderCartView.swift
│   └── OrderCartViewModel.swift
├── FavoritesView/
│   ├── FavoritesView.swift
│   └── FavoritesViewModel.swift
├── Models/
│   └── Cake.swift
├── Services/
│   └── StorageManeger.swift
├── Resources/
│   └── Assets.xcassets
└── Preview Content/
   └── Preview Assets.xcassets
CakeShopTests/
└── OrderCartViewModelTests.swift
```

## ⚙️ Установка
Для запуска приложения вам потребуется:
1. Установленный Xcode.
2. Клонировать репозиторий:

   ```bash
   git clone https://github.com/mokhinsam/CakeShop.git
    ```
3. Открыть проект в Xcode:
    ```bash
    cd CakeShop
    open CakeShop.xcodeproj
    ```
4. Запустить приложение на симуляторе или физическом устройстве.


## 📫 Контакты
Если у вас есть вопросы или предложения, вы можете связаться со мной по электронной почте: mokhinsam@gmail.com


