# Twitter clone via Phoenix

To start postgres: `brew services start postgresql@15`

To start your Phoenix server:

  * Run `mix setup` to install and setup dependencies
  * Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

# Tests

- custom tasks
`mix gen_dummy_posts`

- exe tasks
```zsh
iex -S mix
Twitter.Timeline.list_posts()
```
or
```zsh
psql -U postgres -d your_database_name
SELECT * FROM posts;
```

---
## Further tasks
- Change nickname
- Run in production [deployment guides](https://hexdocs.pm/phoenix/deployment.html)