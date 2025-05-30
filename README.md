
# Как пользоваться
Просто скопируйте репозиторий и установите платформу как обычно. Гарантировано работает в окружении php 7.2-7.4 и MySql 5.7
Имейте ввиду, что кодировка для БД изменена на utf8mb4 с COLLATE utf8mb4_unicode_ci. В основном для поддержки эмодзи.

```bash
git clone https://github.com/ex-url/exopencart
```

# Расширенный OpenCart
Платформа основана на решении для электронной коммерции с открытым исходным кодом ocStore, которое, в свою очередь, основано на оригинальном проекте OpenCart 3. Несмотря на первоначальную направленность на разработку интернет-магазинов, платформа подходит для решения любых задач по разработке сайтов для бизнеса, предоставляя набор готовых функциональных блоков с четкой и логичной реализацией, одинаковой для любого сайта независимо от цели его создания и задач, которые он должен решить.

## Основные отличия от стандартного ocStore
- Шаблон по умолчанию был полностью переписан. Bulma используется в качестве UI фреймворка по-умолчанию.

- В качестве расширения имеется готовый компилятор Bulma SCSS. Просто переопределите нужные вам переменные bulma, нажмите кнопку, и ваша тема готова!

- Функционал блога очищен от грязи и теперь работает нормально.

- Модули, имеющие заголовки ( Избранные, Новинки, Акции и др.), позволяют указывать их на нескольких языках и отображать указанное значение на стороне каталога (вместо значения, взятого из файла локализации в базовом ocStore/OpenCart 3);

- В настройках системы есть возможность добавлять произвольные контакты, а также ссылки на мессенджеры и социальные сети;

- Полностью переработан стандартный механизм заказа (очень громоздкий и неудобный в ocStore/OpenCart 3);

- Обновлен стиль панели управления;

- Изменен состав и порядок пунктов главного навигационного меню панели управления;

## Обновления в версии 1.0

- в настройках системы теперь можно указать произвольные SEO фразы для каждого магазина, которые можно использовать для автоматической генерации SEO заголовков страниц и отдельных модулей;

- модуль Магазин был сильно доработан и теперь если он включен то рядом с логотипом (в стандартном шаблоне) будет отобажаться текущий магазин (текущий город, если делать для каждого города поддомен), при клике на который будет всплывать модальное окно с выбором из всех имеющихся магазинов;

- изменана страница в режиме обслуживания;

- по-умолчанию доступен модуль с SASS компилятором для Bulma UI, дающий полный контроль над темой оформления;

- по-умолчанию есть модуль для предупреждения о согласии со сбором персональных данных, который позволяет указать произольный текст на несколькоих языках, отображающийся при первом посещении сайта, текст на кнопке согласия, а также ссылку на статью в которой изложены правила и условия использования сайта;

- реализован живой поиск по каталогу;

- в админ. панели в разлеле файлы для скачивания добавлена возможность поиска по файлам;

- для блога теперь есть возможность указать произвольные SEO заголовки на нескольких языках;

- реализован функционал для управления ответами на отзывы и комментарии

- реализован функционал управления размерами изображения логотипа;

- реализован функционал опционального сжатия CSS и JS файлов

- реализован функционал опционального создания миниатюр изображений в формете .webp

- в папке storage инициализирован composer, теперь можно быстро и легко работать с зависимостями

- добавлен отдельный шаблон страницы успешного оформления заказа

- добавлены режимы crop и scale при создании миниатюр кэшированных изображений

- встроен Telegram-бот с вебхуками в один клик

- добавлен программный редирект 301 для категорий и товаров

- добавлена возможность копировать экземпляры модулей со всем настройками

- для меню добавлена возможность указания произвольного названия каталога

- для меню добавлена возможность включения/включения кэширования с учётом языка и магазина


Если вы увидели баг, добро пожаловать в Issues!

## Почему bulma?
Просто нравится! На мой взгляд, он (фреймоворк) предлагает лучший баланс между готовыми стилями (как в bootstrap) и модификаторами (как в tailwingcss), а также мне нравится именование классов, оно кажется более понятным и удобным. Кроме того, Bulma — это CSS-фреймворк, без всякого JS, который позволяет очень гибко управлять поведением UI-компонентов на страницах сайта.

## Благодарность
Выражаю благодароность всем кто внёс вклад в OpenCart, ocStore, Bootstrap, Bulma, jQuery и любых других проектов с открытым исходным кодом. Спасибо за вашу работу ребята!

## Обратная связь
Это мой первый проект на GitHub и мой первый вклад в сообщество открытого исходного кода. Выгодные предложения, конструктивная критика и донаты приветствуются, остальное по ситуации.

# For english speakers

Just clone the repository and install the platform as usual. Guaranteed to work in environments with PHP 7.2–7.4 and MySQL 5.7.
Please note that the database encoding has been changed to utf8mb4 with COLLATE utf8mb4_unicode_ci, primarily to support emojis.

```bash
git clone https://github.com/ex-url/exopencart
```
Note that the database encoding has been changed to utf8mb4 with COLLATE utf8mb4_unicode_ci, primarily to support emojis.

# Extended OpenCart
The platform is based on the ocStore open-source e-commerce solution, which in turn is based on the original OpenCart 3 project. Despite the initial focus on the development of online stores, the platform is suitable for solving any tasks in developing websites for business, providing a set of ready-made functional blocks with a clear and logical implementation, which is the same for any site, regardless of the purpose of its creation and the tasks that it must solve.

## Main differences from the standard ocStore
- The default template has been completely rewritten. Bulma is used as a UI framework in the catalog instead of bootstrap.

- There is ready to go bulma SCSS compiler as an extension. Just override bulma variables you need, click the button and your theme is done!

- Blog functionality has been cleaned of dirt and now works fine.

- Modules that have headers (featured, latest, special, etc) allow you to specify them in several languages and display the specified value on the catalog side (instead of the value taken from the localization file in the base ocStore/OpenCart 3);

- In the system settings, it is possible to add arbitrary contacts, as well as links to instant messengers and social networks;

- The standard ordering mechanism has been completely redesigned (very cumbersome and inconvenient in ocStore/OpenCart 3);

- Updated control panel style;

- Changed the composition and order of items in the main navigation menu of the control panel;

## Updates in version 1.0

- in the system settings you can now specify arbitrary SEO phrases for each store, which can be used to automatically generate SEO page titles and individual modules;

- the Store module has been greatly improved and now if it is enabled, next to the logo (in the standard template) the current store will be displayed (the current city, if you make a subdomain for each city), when you click on it, a modal window will pop up with a choice from all available stores ;

- the page in maintenance mode has been changed;

- by default, a module with a SASS compiler for Bulma UI is available, giving full control over the design theme;

- by default, there is a module for warning about consent to the collection of personal data, which allows you to specify free text in several languages that is displayed when you first visit the site, text on the consent button, as well as a link to an article that sets out the rules and conditions for using the site;

- implemented live search in the catalog;

- to the admin. The ability to search by files has been added to the panel in the files for downloads section;

- for a blog it is now possible to specify custom SEO titles in several languages;

- implemented functionality for managing responses to reviews and comments

- functionality for managing logo image sizes has been implemented;

- implemented functionality for optional compression of CSS and JS files

- functionality for optionally creating thumbnail images in .webp format has been implemented

- composer is initialized in the storage folder, now you can quickly and easily work with dependencies

- added a separate template for the successful order completion page  

- added crop and scale modes for creating thumbnails of cached images  

- integrated a Telegram bot with webhooks

- added programmatic 301 redirects for categories and products

- added the ability to copy instances of modules with all settings

- added the ability to specify an arbitrary directory name for the menu

- added the ability to enable/enable caching for the menu, taking into account the language and store

If you saw a bug, welcome to Issues!

## Why bulma?
I just love it! In my opinion it offers the best balance between pre-made styles (like in bootstrap) and modifiers (like in tailwind), and I also like class naming, it feels more clear and convenient. In addition, Bulma is a CSS framework, without any JS, which allows you to very flexibly control the behavior of the UI components on the site pages.

## Gratitude
I am grateful to all contributors of OpenCart, ocStore, Bootstrap, Bulma, jQuery and any other open-source projects. Thank you for your work guys!

## Feeback
This is my first GitHub project and my first contribution to the open-source community. Profitable offers, constructive criticism and donations are welcome, the rest is up to the situation.
