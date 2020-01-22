Функция СерверныйМодульМенеджера(Имя)
	ОбъектНайден = Ложь;

	ЧастиИмени = СтрРазделить(Имя, ".");
	Если ЧастиИмени.Количество() = 2 Тогда

		ИмяВида = ВРег(ЧастиИмени[0]);
		ИмяОбъекта = ЧастиИмени[1];

		Если ИмяВида = ВРег("Константы") Тогда
			Если Метаданные.Константы.Найти(ИмяОбъекта) <> Неопределено Тогда
				ОбъектНайден = Истина;
			КонецЕсли;
		ИначеЕсли ИмяВида = ВРег("РегистрыСведений") Тогда
			Если Метаданные.РегистрыСведений.Найти(ИмяОбъекта) <> Неопределено Тогда
				ОбъектНайден = Истина;
			КонецЕсли;
		ИначеЕсли ИмяВида = ВРег("РегистрыНакопления") Тогда
			Если Метаданные.РегистрыНакопления.Найти(ИмяОбъекта) <> Неопределено Тогда
				ОбъектНайден = Истина;
			КонецЕсли;
		ИначеЕсли ИмяВида = ВРег("РегистрыБухгалтерии") Тогда
			Если Метаданные.РегистрыБухгалтерии.Найти(ИмяОбъекта) <> Неопределено Тогда
				ОбъектНайден = Истина;
			КонецЕсли;
		ИначеЕсли ИмяВида = ВРег("РегистрыРасчета") Тогда
			Если Метаданные.РегистрыРасчета.Найти(ИмяОбъекта) <> Неопределено Тогда
				ОбъектНайден = Истина;
			КонецЕсли;
		ИначеЕсли ИмяВида = ВРег("Справочники") Тогда
			Если Метаданные.Справочники.Найти(ИмяОбъекта) <> Неопределено Тогда
				ОбъектНайден = Истина;
			КонецЕсли;
		ИначеЕсли ИмяВида = ВРег("Документы") Тогда
			Если Метаданные.Документы.Найти(ИмяОбъекта) <> Неопределено Тогда
				ОбъектНайден = Истина;
			КонецЕсли;
		ИначеЕсли ИмяВида = ВРег("Отчеты") Тогда
			Если Метаданные.Отчеты.Найти(ИмяОбъекта) <> Неопределено Тогда
				ОбъектНайден = Истина;
			КонецЕсли;
		ИначеЕсли ИмяВида = ВРег("Обработки") Тогда
			Если Метаданные.Обработки.Найти(ИмяОбъекта) <> Неопределено Тогда
				ОбъектНайден = Истина;
			КонецЕсли;
		ИначеЕсли ИмяВида = ВРег("БизнесПроцессы") Тогда
			Если Метаданные.БизнесПроцессы.Найти(ИмяОбъекта) <> Неопределено Тогда
				ОбъектНайден = Истина;
			КонецЕсли;
		ИначеЕсли ИмяВида = ВРег("ЖурналыДокументов") Тогда
			Если Метаданные.ЖурналыДокументов.Найти(ИмяОбъекта) <> Неопределено Тогда
				ОбъектНайден = Истина;
			КонецЕсли;
		ИначеЕсли ИмяВида = ВРег("Задачи") Тогда
			Если Метаданные.Задачи.Найти(ИмяОбъекта) <> Неопределено Тогда
				ОбъектНайден = Истина;
			КонецЕсли;
		ИначеЕсли ИмяВида = ВРег("ПланыСчетов") Тогда
			Если Метаданные.ПланыСчетов.Найти(ИмяОбъекта) <> Неопределено Тогда
				ОбъектНайден = Истина;
			КонецЕсли;
		ИначеЕсли ИмяВида = ВРег("ПланыОбмена") Тогда
			Если Метаданные.ПланыОбмена.Найти(ИмяОбъекта) <> Неопределено Тогда
				ОбъектНайден = Истина;
			КонецЕсли;
		ИначеЕсли ИмяВида = ВРег("ПланыВидовХарактеристик") Тогда
			Если Метаданные.ПланыВидовХарактеристик.Найти(ИмяОбъекта) <> Неопределено Тогда
				ОбъектНайден = Истина;
			КонецЕсли;
		ИначеЕсли ИмяВида = ВРег("ПланыВидовРасчета") Тогда
			Если Метаданные.ПланыВидовРасчета.Найти(ИмяОбъекта) <> Неопределено Тогда
				ОбъектНайден = Истина;
			КонецЕсли;
		КонецЕсли;

	КонецЕсли;

	Если Не ОбъектНайден Тогда
		ВызватьИсключение СтроковыеФункцииКлиентСервер.ПодставитьПараметрыВСтроку(
			НСтр("ru = 'Объект метаданных ""%1"" не найден,
			           |либо для него не поддерживается получение модуля менеджера.'"),
			Имя);
	КонецЕсли;

	// АПК:488-выкл ВычислитьВБезопасномРежиме не используется, чтобы избежать вызова ОбщийМодуль рекурсивно.
	УстановитьБезопасныйРежим(Истина);
	Модуль = Вычислить(Имя);
	// АПК:488-вкл

	Возврат Модуль;
КонецФункции

Процедура СНулевойСложностью()

КонецПроцедуры

Если Истина Тогда

КонецЕсли;