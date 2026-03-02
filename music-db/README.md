# 🎵 Music Database — PostgreSQL Solution

Решение домашнего задания по проектированию и работе с реляционной БД для музыкального сервиса.
    
## 🗂️ Структура

- `schema.sql` — DDL с ограничениями (`CHECK`, `CASCADE`, составные PK)
- `data.sql` — тестовые данные (4+ исполнителя, 3+ жанра, 3+ альбома, 6+ треков, 4+ сборника)
- `queries_task2.sql` — простые SELECT-запросы
- `queries_task3.sql` — агрегации и подзапросы
- `dump.sql` — готовый дамп для быстрого развёртывания

## 🚀 Быстрый старт

```bash
# Создать БД
createdb music_db

# Развернуть схему и данные
psql -d music_db -f schema.sql
psql -d music_db -f data.sql

# Или восстановить из дампа
psql -d music_db -f dump.sql

# Запустить запросы
psql -d music_db -f queries_task2.sql