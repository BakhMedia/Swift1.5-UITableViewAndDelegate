# UITableView
### Урок 5.

Частый инструмент в мобильных приложениях это списки или таблицы. Новости в **Vkontakte**, публикации в **YouTube** или в **Instagram**, беседы в **Telegram** — всё это списки, а в **iOS** чаще всего для этих задач используется компонент **UITableView**. Именно он у нас будет на первом экране нашего приложения — «**Лента**». Скачать нашу заготовку можно [здесь](https://github.com/BakhMedia/Swift1.4-UIViewControllerPrint) и погнали 😎.


1. Запускаем **Xcode** и откроем наш экран «**Лента**» в **Main.storyboard**. Удалим нашу надпись по середине экрана, она нам больше не нужна. В списке компонентов найдем **Table View** и перетащим его на наш экран. В этом компоненте у нас будут располагаться элементы будущего списка. Сейчас не будем заморачиваться на «шапку» нашего списка, пока просто сделаем чтоб список был и его можно было пролистать.

![Image1](https://raw.githubusercontent.com/BakhMedia/Swift1.5-UITableViewAndDelegate/master/images/1.gif "Image1")

2. Выберем наш **UITableView** и в **Connections Inspector** определим пункты **dataSource**, **delegate** зажимая плюсик перетащим по одному на жёлтый элемент в заголовке нашего экрана. Так же нам понадобится **New referencing outlet** — его перетащим в код файла **FeedViewController**, и назовем его к примеру **feedList**, как это делать мы рассматривали в прошлых уроках. Не много разберемся:
- **data source** — можно перевести как источник данных, то есть теперь наш файл будет еще и описывать откуда брать данные для списка;
- **delegate** — означает что разные события этого компонента мы будем делегировать в наш класс, к примеру такие как нажатие на элемент.

![Image2](https://raw.githubusercontent.com/BakhMedia/Swift1.5-UITableViewAndDelegate/master/images/2.gif "Image2")

3. Перейдём к правкам кода. Так как мы назначили что наш экран является еще и экземплярами и **DataSource** и **Delegate**. То теперь наш **FeedViewController** будет создавать не только от **UIViewController**, но и от **UITableViewDelegate** и **UITableViewDataSource**. Просто после **UIViewController** через запятую добавим оба этих класса. Получится такая строка:

```swift
class FeedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
```

![Image3](https://raw.githubusercontent.com/BakhMedia/Swift1.5-UITableViewAndDelegate/master/images/3.gif "Image3")

Однако теперь Xcode нам сообщает что у нас есть ошибка: появился красный значок на этой строке.

![Image4](https://raw.githubusercontent.com/BakhMedia/Swift1.5-UITableViewAndDelegate/master/images/4.gif "Image4")

4. Давайте разберем текст ошибки: **Type 'FeedViewController' does not conform to protocol ‘UITableViewDataSource’**. Означает что наш **FeedViewController** пока не соответствует протоколу **UITableViewDataSource**. Обратим внимание, что значок ошибки круглый, а это означает что у **Xcode** для подобных ситуаций есть типовое решение этой проблемы. Довольно удобно пользоваться такими подсказками.

5. Нажмем на саму иконку и увидим сообщение **Do you want to add protocol stubs?** и кнопку **Fix** справа. **Xcode** спрашивает «Хотим ли мы добавить заглушки для этого протокола». Почему бы и нет — нажмем на кнопку **Fix**. В код автоматом добавятся две функции: одна отвечает за то сколько элементов должно быть в нашем списке, другая за то как выглядит каждый его элемент.

```swift
func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
```

6. Обо всем по порядку.

![Image5](https://raw.githubusercontent.com/BakhMedia/Swift1.5-UITableViewAndDelegate/master/images/5.gif "Image5")

7. В нашем списке будут располагаться, к примеру наши названия наших видео на текущий момент. Создадим массив строк:

```swift
private var items: [String] = ["Разговор о beta Xcode 10", "Шарим в логах и создаем классы вьюхам!", "TabBar - это то что нужно", "Switch, If Else и Ночной режим", "Вывод и Позиционирование"]
```

Разберем эту строку по частям:
- **private** — означает что этот массив будет;
- **var** — сокращение от variable, то есть переменная;
- **items** — имя переменной, можно выбрать произвольно;
- **[String]** — тип переменной. Сам тип переменной строка, называется String, а квадратные скобки означают, что это будет не одна строка, а массив строк, к элементам которого можно обращаться так: **items[0]** - первый элемент, **items[1]** - второй и так далее.
- далее приравниваем его к определенному массив. После равно в квадратных скобках через запятую перечисляем нужные нам строки, каждая строка в двойных кавычках. Эти строки будут отображаться в нашем списке.

8. Теперь мы знаем какие элементы будут в списке. Можем сообщить это одной из автоматически добавленных функций. Выглядит она так:

```swift
return items.count
```

Напишем в её теле это: 

![Image6](https://raw.githubusercontent.com/BakhMedia/Swift1.5-UITableViewAndDelegate/master/images/6.gif "Image6")

Думаю здесь всё просто. Функция возвращает кол-во элементов в нашем массиве.

9. Теперь нам надо описать как выглядит каждый элемент нашего списка. Создадим новый файл типа **View**. Назовём его скажем **FeedItem** и сохраним в нашем проекте. 

![Image7](https://raw.githubusercontent.com/BakhMedia/Swift1.5-UITableViewAndDelegate/master/images/7.gif "Image7")

10. Создадим новый swift-файл, который будет описывать работу нашей ячейки. Назовем его FeedItem. В него вставим следующий код:

```swift
import UIKit

class FeedItem: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
    }

}
```
Код по структуре напоминает то что мы с Вами уже делали с UIViewController. И правда структура похожа, да и по смыслу близко. Импортируем UIKit, создаем (или как говорят программисты «объявляем») новый класс FeedItem, но на этот раз наследоваться он будет от класса UITableViewCell. 

![Image11](https://raw.githubusercontent.com/BakhMedia/Swift1.5-UITableViewAndDelegate/master/images/11.gif "Image11")


11. Мы увидим что создался файл **FeedItem.xib**. **Xib**-файл, как и **Storyboard**-файл является файлом, в котором мы будем создавать внешний облик наших экранов и вьюх. Разница лишь в том, что **storyboard** файлы могут описывать несколько экранов или элементов и даже взаимоотношения между этими элементами. Тогда как **xib**-файл описывает только один конкретный экран или элемент. В нашем случае этот файл будет описывать то, как выглядит одна строка в нашем списке. Область экрана в созданном файле — **UIView**, то есть целый экран. Нам же требуется создать элемент списка для **UITableView**, для этого вместо **UIView** мы должны использовать **UITableViewCell**. 

![Image9](https://raw.githubusercontent.com/BakhMedia/Swift1.5-UITableViewAndDelegate/master/images/9.gif "Image9")

Удалим эту область, найдем нужный нам элемент поискав по слову «cell» в списке компонентов и перетащим его в пустой файл. Видим, что теперь созданная область гораздо меньше по высоте чем была до этого, что логично, ведь строка меньше самого экрана.

12.  В самом элементе списка у нас будет просто строка: для этого разместим уже знакомый нам **UILabel** в полученном вью и отцентруем его по вертикали, по горизонтали же прилепим его к левому краю. 

![Image10](https://raw.githubusercontent.com/BakhMedia/Swift1.5-UITableViewAndDelegate/master/images/10.gif "Image10")

13. Помните как мы связывали **swift**-файлы с экранами в сториборде? Проделаем здесь такую же операцию. Выберем наш вью в **xib** файле. Найдем у него свойство **Class**. И впишем туда **FeedItem**. Отлично! Хватит создавать файлы на сегодня и давайте свяжем наш **UILabel** в **FeedItem**`e с переменной в коде. Перетащим **New referencing outlet** в код и назовем к примеру **titleLabel**.

![Image12](https://raw.githubusercontent.com/BakhMedia/Swift1.5-UITableViewAndDelegate/master/images/12.gif "Image12")

Получилось так:

![Image13](https://raw.githubusercontent.com/BakhMedia/Swift1.5-UITableViewAndDelegate/master/images/13.png "Image13")

14.  Если сейчас запустим то увидим, что в списке одинаковые элементы с надписью **Label**. Создадим следующую функцию в **FeedItem**:

```swift
public func setTitle(title: String) {
    titleLabel.text = title
}
```

Разберем: 
- **public** — означает что функция будет доступна не только из самого класса но и из других.
- **func** — function
- **setTitle** — название функции, можно выбрать произвольно
- **title: String** — входящий параметр title типа String, строка
- **titleLabel.text = title** — назначаем нашему Label то что передали в функцию при её вызове
Ничего не понятно, дальше станет проясняться зачем нам это надо. Мы описали строку в нашей таблице.


15. Вернемся в файл **FeedViewController**. Мы определили первую функцию из двух, которые автоматом создали в пункте 4. Пора определить и вторую. Код получится такой:

```swift
func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let nibs : Array = Bundle.main.loadNibNamed("FeedItem", owner: self, options: nil)!
    let cell:FeedItem = nibs[0] as! FeedItem
    cell.setTitle(title: items[indexPath.row])
    return cell
}
```

Разберем:
- Первая строка: автоматически созданная, пока не трогаем
- 2 строка: сообщаем из какого файла загрузить вьюху
- 3: объявляем переменную типа **FeedItem** чтоб можно было обратится к её функциями и свойствам.
- 4: нас интересует написанная нами в 10м пункте функция **setTitle**. Обращаемся к массиву **items**. **indexPath.row** строка для которой мы формируем вид.
- 5: возвращаем полученный вид.

Ну и как обычно — если не понятно, не переживайте, всё придёт с опытом и повторив несколько раз, будете понимать то что вы сами делаете.

16. Запустим приложение увидим наш список.

![Image14](https://raw.githubusercontent.com/BakhMedia/Swift1.5-UITableViewAndDelegate/master/images/14.gif "Image14")

Выглядит пока не очень, но в одном из следующих уроков мы наведем здесь красоту😎.




**Сейчас попробуйте по памяти все повторить, желательно 2-3 раза.**






