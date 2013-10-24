# Koda UI
This lib helps you access koda data from your front end sinatra app
Instead of using the rest api it goes directly to mongo (and will support caching)

## Usage

Simply include the helpers in your sinatra app

```ruby
class MyApp < Sinatra::Base
  include Koda::UI::Helpers
end
```

Then in your routes you can access data from the model:

```ruby
  get '/cars/?' do
    @cars = koda.query('/cars')

    erb :cars
  end
```

Which will return an array of hashes with document summary info.
If you were to get this using the rest api it would be equivalent to calling `/cars`.

You can also get a particular document

```ruby
  get '/cars/:alias/?' do |car_alias|
    @car = koda.single("/cars/#{car_alias}")

    erb :car
  end
```

Which will return a single hash containing the document.
Again if you were using the rest api it would be equivalent to calling `/cars/:alias.json`.
