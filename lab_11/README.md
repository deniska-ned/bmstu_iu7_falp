### Ответ на главный вопрос от Строгонова

Что нужно подать на вход алгоритму унификации для получения пустой подставноки?

|                        | Константа | Несвязанная переменная | Связанная переменная | Составной терм                       |
| ---------------------- | --------- | ---------------------- | -------------------- | ------------------------------------ |
| Константа              | Да        | Нет                    | Да                   | Не унифицируются                     |
| Несвязанная переменная | -         | Нет                    | Нет                  | Нет                                  |
| Связанная переменная   | -         | -                      | Да                   | Да, если терм не содержит несв. пер. |
| Составной терм         | -         | -                      | -                    | Да, если терм не содержит несв. пер. |

Примечания:

- таблица симметрична
- несвязная переменная с дает непустую подстановку в случае успеха
