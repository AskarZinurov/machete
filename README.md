# Machete

Мачете не смсит, он сокращает ссылки.

#### POST `/urls { url: "https://example.com" }`

Создание ссылки, пример ответа: 
`{"id":2,"url":"https://ya.ru","short_url":"74704cb525c8f310fdc5c822782d20d60eaadade"}`

#### GET `/urls/:short_url`

Использование - на выходе редирект на полный URL или 400

#### GET `/urls/:short_url/stats`

Статистика по использованию ссылки. Пример ответа: 
`{"visits_count":99}`

* [Вариант с локами](https://github.com/AskarZinurov/machete/commit/e0fe74f50f83132a71caeb1d9e58eb2c99a5f44e) 
* [Вариант с таблицей логов и ее очисткой](https://github.com/AskarZinurov/machete/compare/main...stats-cleaner)
