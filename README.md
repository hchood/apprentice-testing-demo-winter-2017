# README

## Instructions

Let's make an app that returns data about music.

Specifically, we'll create the following:

- An endpoint, `GET /artists`, to return a list of artists

```json
{
  "artists": [
    {
      "id": "123",
      "created_at": "...",
      "updated_at": "...",
      "name": "Prince"
    },
    {
      "id": "456",
      "created_at": "...",
      "updated_at": "...",
      "name": "David Bowie"
    },
  ]
}
```

- An endpoint, `GET /artists/:id`, to return additional information about an artist, including a list of their albums.

```json
{
  "artist": {
    "id": "123",
    "created_at": "...",
    "updated_at": "...",
    "name": "Prince",
    "description": "...",
    "dob": "...",
    "album_ids": ["abc", "def"]
  },
  "albums": [
    {
      "id": "abc",
      "created_at": "...",
      "updated_at": "...",
      "artist_id": "123",
      "title": "Purple Rain",
      "year": "1984"
    },
    {
      "id": "abc",
      "created_at": "...",
      "updated_at": "...",
      "artist_id": "123",
      "title": "Parade",
      "year": "1985"
    },
  ]
}
```

We'll do all this using TDD :tada:
