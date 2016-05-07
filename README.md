## README

### Ruby version 
2.1.5

### Configuration
Install rvm (ruby version manager)
Install ruby
`rvm install ruby-2.1.5`
Run `bundle install`  

### Endpoints

## Auth
`/auth` for [Devise Token Auth](https://github.com/lynndylanhurley/devise_token_auth). All other endpoints require users to be logged in with the appropriate headers.

## Events
`GET /event` Returns all events in the database. In the future, this will require location coordinates to return only the events near the logged in user.

`POST /event` Creates a new event. Expects a body of the following form:

```json
{
  "event": {
    "name": "...",
    "address": "...",
    "description": "...",
    "start_t": time,
    "end_t": time,
  },
}
```
All parameters are required with the exception of the end time. This will default to three hours after the start time.

`GET /event/:id` Returns the event specified by the `:id` parameter.

`POST/PATCH event/:id` Updates the event specified by the `id` parameter. `PATCH` can update individual attributes.

`DELETE event/:id` Deletes the specified event. Users can only delete their own events.

## Votes
`POST /vote` Creates a new upvote. This will be Hype if the event has not yet occured and an Upvote if it has already started. This requires a body of the following form:

 ```json
{
  "vote": {
    "id": id,
  },
}
```

This `id` parameter refers to the event ID that will be upvoted by the current user.

`DELETE /vote/:id` deletes the vote with the specified vote ID. This may be changed to require the ID of the event specified.
