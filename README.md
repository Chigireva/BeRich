# BeRich
Проектное приложение научно-практического интенсива по мобильной разработке Сириус, весна 2023.

### Links:
- [Figma design project](https://www.figma.com/file/jAMFkK1sgbOBDctYAH0z0W/BeRich?node-id=3%3A6&t=o5IFfNCJBnCBgrhj-1)

## Первый запуск
1. Установить [XCodeGen](https://github.com/yonaskolb/XcodeGen)
```
brew install xcodegen
```
2. Сгенерировать проект
```
xcodegen generate
```
3. Запустить проект

## Форматирование кода
1. Установить [SwiftFormat](https://github.com/nicklockwood/SwiftFormat)
```
brew install swiftformat
```
2. Для проверки соответсвия формату использовать:
```
swiftformat --lint --swiftversion 5.5 .
```
Для форматирования кода запустить:

```
swiftformat --swiftversion 5.5 .
```