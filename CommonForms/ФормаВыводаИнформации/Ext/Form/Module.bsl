﻿
#Область ОбработчикиСобытийФормы

&НаСервере
Процедура ПриСозданииНаСервере(Отказ, СтандартнаяОбработка)
	
	Если Не Параметры.Свойство("ДанныеПользователя") Тогда
		Закрыть();
	КонецЕсли;
	
	АвтоЗаголовок 		= Ложь;	
	ЭтаФорма.Заголовок 	= "Данные из сервиса по Id №" + Параметры.IDПользователя;
	
	ГруппаДанныеПользователя 				= Элементы.Добавить("ГруппаДанныеПользователя",Тип("ГруппаФормы"));
	ГруппаДанныеПользователя.Вид 			= ВидГруппыФормы.ОбычнаяГруппа;
	ГруппаДанныеПользователя.Заголовок 		= "Данные пользователя из сервиса";
	ГруппаДанныеПользователя.Отображение   	= ОтображениеОбычнойГруппы.Нет;
	ГруппаДанныеПользователя.Группировка	= ГруппировкаПодчиненныхЭлементовФормы.ГоризонтальнаяВсегда;

	ГруппаАватар 							= Элементы.Добавить("ГруппаАватар",Тип("ГруппаФормы"),ГруппаДанныеПользователя);
	ГруппаАватар.Вид 						= ВидГруппыФормы.ОбычнаяГруппа;
	ГруппаАватар.ОтображатьЗаголовок 		= Ложь;
	ГруппаАватар.Отображение   				= ОтображениеОбычнойГруппы.Нет;
	ГруппаАватар.Группировка				= ГруппировкаПодчиненныхЭлементовФормы.Вертикальная;
	
	ГруппаРеквизиты 						= Элементы.Добавить("ГруппаРеквизиты",Тип("ГруппаФормы"),ГруппаДанныеПользователя);
	ГруппаРеквизиты.Вид 					= ВидГруппыФормы.ОбычнаяГруппа;
	ГруппаРеквизиты.ОтображатьЗаголовок 	= Ложь;
	ГруппаРеквизиты.Отображение   			= ОтображениеОбычнойГруппы.Нет;
	ГруппаРеквизиты.Группировка				= ГруппировкаПодчиненныхЭлементовФормы.Вертикальная;

	Для Каждого Параметр Из Параметры.ДанныеПользователя.РеквизитыПользователя Цикл
				
		НовыйРевизит 					= Новый РеквизитФормы(Параметр.Ключ, Новый ОписаниеТипов("Строка"));
		ДобавляемыйРеквизит    			= Новый Массив;
		
		ДобавляемыйРеквизит.Добавить(НовыйРевизит);    
		ИзменитьРеквизиты(ДобавляемыйРеквизит);
		
		ЭтаФорма[НовыйРевизит.Имя] 		= Параметр.Значение;
		
		ПолеВвода 						= Элементы.Добавить(Параметр.Ключ, Тип("ПолеФормы"),ГруппаРеквизиты);
		ПолеВвода.Вид 					= ВидПоляФормы.ПолеВвода;
		ПолеВвода.ПутьКДанным 			= НовыйРевизит.Имя;
		ПолеВвода.ПоложениеЗаголовка 	= ПоложениеЗаголовкаЭлементаФормы.Верх;
		ПолеВвода.Заголовок 			= Параметр.Ключ;
		ПолеВвода.ТолькоПросмотр		= Истина;
		
	КонецЦикла;
	
	НовыйРевизит 					= Новый РеквизитФормы("Аватар", Новый ОписаниеТипов("Картинка"));
	ДобавляемыйРеквизит    			= Новый Массив;
	
	ДобавляемыйРеквизит.Добавить(НовыйРевизит);    
	ИзменитьРеквизиты(ДобавляемыйРеквизит);
	
	ЭтаФорма.Аватар 				= Параметры.ДанныеПользователя.КартинкаАватар;
	
	НовыйРевизит 					= Новый РеквизитФормы("ХранилищеАватар", Новый ОписаниеТипов("Строка"));
	ДобавляемыйРеквизит    			= Новый Массив;
	
	ДобавляемыйРеквизит.Добавить(НовыйРевизит);    
	ИзменитьРеквизиты(ДобавляемыйРеквизит);
	
	ЭтаФорма.ХранилищеАватар 				= "";

	ПолеКартинки 							= Элементы.Добавить("Аватар", Тип("ПолеФормы"), ГруппаАватар);
	ПолеКартинки.Вид 						= ВидПоляФормы.ПолеКартинки;
	ПолеКартинки.ПутьКДанным 				= "ХранилищеАватар";
	ПолеКартинки.ПоложениеЗаголовка 		= ПоложениеЗаголовкаЭлементаФормы.Верх;
	ПолеКартинки.Заголовок 					= "Аватар";
	ПолеКартинки.ТолькоПросмотр				= Истина;
	ПолеКартинки.РастягиватьПоВертикали 	= Ложь;
	ПолеКартинки.РастягиватьПоГоризонтали 	= Ложь;
	
	

КонецПроцедуры

&НаКлиенте
Процедура ПриОткрытии(Отказ)
	
	ЭтаФорма.ХранилищеАватар = ПоместитьВоВременноеХранилище(ЭтаФорма.Аватар);
	
КонецПроцедуры

#КонецОбласти

