## Eastflower.ru

The source code.

### Install

1. Setup a databases

`touch config/database.yml`

```
development:
  adapter: postgresql
  encoding: unicode
  host: localhost
  database: eastflower_ru_dev
  password:
  pool: 5
```

2. Migrate

`rake db:create && rake db:migrate`
