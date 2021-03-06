
#Область ПрограммныйИнтерфейс

// Возвращает Истина, или переданный текст - корректное имя переменной.
//
// Параметры:
//  Имя	 - Строка	 - имя пременной.
// 
// Возвращаемое значение:
//  Булево - Истина: корректное имя переменной. Ложь: имя переменной не может быть использовано в конфигураторе.
//
Функция ЭтоКорректноеИмяПеременной(Знач Имя) Экспорт
	
	ЗапрещенныеСимволы = "<>&'`""";
	Для Индекс = 1 По СтрДлина(ЗапрещенныеСимволы) Цикл
		Если СтрЧислоВхождений(Имя, Сред(ЗапрещенныеСимволы, Индекс, 1)) > 0 Тогда
			Возврат Ложь;
		КонецЕсли;
	КонецЦикла;
	
	СтрокаXML = "<Structure xmlns=""http://v8.1c.ru/8.1/data/core"" xmlns:xs=""http://www.w3.org/2001/XMLSchema""xmlns:xsi=""http://www.w3.org/2001/XMLSchema-instance"" xsi:type=""Structure""><Property name=""" + Имя + """><Value xsi:type=""xs:string"">123465sdfg-sdfg3215-sdfg45768-kjk90</Value></Property></Structure>";
	
	Читашка = Новый ЧтениеXML;
	Читашка.УстановитьСтроку(СтрокаXML);
	
	Возврат СериализаторXDTO.ПрочитатьXML(Читашка).Количество() > 0;
	
КонецФункции

#КонецОбласти
