# tfmd_v2

Краткое описание задачи

Необходимо разработать приложение для отображения актуальных данных о погоде.  
Приложение должно иметь 2 основных экрана: Splash и Home.
Основным экраном будет являтся Home Screen. На нем пользователь будет иметь  
возможность посмотреть погоду по своему городу в одном из 2-х режимов: почасовая погода и погода по дням.
Более подробно о функционале приложения и его отдельных частях можно прочесть в следующих секциях.

[Тестовое задание](https://docs.google.com/document/d/1MOKMiCarI4RO6DFtjBPRgbmontRfWKTuF_axK6CLuMs/mobilebasic#heading=h.7d7a5dxtwk6b), which offers tutorials,

Реализовано:
Splash-экран
первый экран при открытии приложения;
на экране должно отображаться любое изображение / логотип;
экран должен быть показан пользователю в течении 3-х секунд;
по истечении времени, происходит переход на главный экран;

Главный экран
на экране можно посмотреть погоду в 2-х режимах:
 по часам;
 по дням;
выбор режима (дни / часы) должен находится в тулбаре в виде выпадающего списка;
данные о погоде необходимо получать из любого Web API;
данные о погоде должны отображаться в виде списка виджетов;
при клике на один из элементов списка он должен разворачиваться показывая дополнительную информацию.

Основной функционал
При отсутствии Internet-соединения, приложение должно использовать последние  
загруженные данные (необходимо реализовать возможность кешировать данные в локальную базу);
Приложение должно определить город пользователя по средствам геолокации.  
Если это сделать не удалось, отображать погоду для города по-умолчанию (Киев);

Реализовано частично:
Необходимо реализовать мультиязычность (поддержку русского и английского языков).  
Приложение должно изменять язык интерфейса в зависимости от настроек телефона.  
 Если язык не поддерживается, необходимо использовать английский язык, в качестве языка по-умолчанию.