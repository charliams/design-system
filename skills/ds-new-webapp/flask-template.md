# Flask Template

## File structure

```
project/
├── app.py                 # or __init__.py for larger apps
├── requirements.txt
├── .env                   # secrets — never commit
├── .gitignore             # must include .env
├── CLAUDE.md
├── templates/
│   ├── base.html          # root layout with CDN link
│   └── index.html         # extends base.html
└── static/
    └── style.css          # scoped overrides only
```

## `templates/base.html` pattern

```html
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>{% block title %}App Name{% endblock %}</title>
  <link rel="stylesheet" href="https://charliejmwilliams.com/ui.css">
  <link rel="stylesheet" href="{{ url_for('static', filename='style.css') }}">
</head>
<body>
  <div class="container" style="padding: var(--space-10) var(--space-6);">
    {% block content %}{% endblock %}
  </div>
</body>
</html>
```

## Key decisions

- Environment config via `.env` + `python-dotenv`. Never hardcode secrets in `app.py`.
- Persistence: SQLite first (`flask-sqlalchemy` + SQLite). Migrate to Postgres only when concurrency or scale demands it.
- Authentication: Flask-Login for session-based auth. Defer to an OAuth provider for anything externally facing.
- API routes return JSON; page routes return rendered templates. Do not mix in a single route.
- Keep `requirements.txt` minimal.
