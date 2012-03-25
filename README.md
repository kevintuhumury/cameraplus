# Cameraplus

This gem provides a Ruby wrapper around the Camera+ API, using HTTParty. [Camera+](http://camerapl.us) is an iPhone photo app made by [tap tap tap](http://taptaptap.com) with effects made by professional photographer Lisa Bettany. Cameraplus is based on the [Web Sharing API](http://api.campl.us/web-api).

## Installation

Add this line to your application's Gemfile:

    gem 'cameraplus'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install cameraplus

## Cameraplus::API

`Cameraplus::API` is a very thin wrapper for the Camera+ API. It uses the bare minimum to get the diserable data from Camera+ and returns it as a Hash.

### Cameraplus::API::User

    Cameraplus::API::User.find("mostlylisa") # => Retrieves a hash with user data of Twitter user @mostlylisa (Twitter account of Lisa Bettany)

### Cameraplus::API::Page

    Cameraplus::API::Page.find("b72Z") # => Retrieves a hash with the metadata of the specified page

## Cameraplus layer

The Cameraplus gem also provides a 'convenience' layer. This layer lies on top of `Cameraplus::API`, which only returns hashes. The `Cameraplus` layer has an easier interface which returns objects like `Cameraplus::User`, `Cameraplus::Page` and `Cameraplus::Photo`.

### Retrieving a user with `Cameraplus::User`

A user can be retrieved with the following line of code:

    @user = Cameraplus::User.find("mostlylisa")

The `@user` variable provides access to the following properties:

    @user.id            # => 6978642
    @user.username      # => mostlylisa (this is a Twitter username)
    @user.name          # => Lisa Bettany
    @user.avatar        # => http://a0.twimg.com/profile_images/1767370289/284161_10150711631895637_674215636_19658534_6246798_n_normal.jpeg
    @user.page_count    # => 122
    @user.photo_count   # => 876

#### Retrieving pages from a user

A list with pages is also included in the response of the above call:

    @user.pages         # => [ #<Cameraplus::Page:0x007fb5c2f91080>, #<Cameraplus::Page:0x007fb5c2f9e5f0>, ... ]

Yeah, it's that easy. The above returns an Array with `Cameraplus::Page` objects. Provided that you've only selected the first page with `@page = @user.pages.first`. The `@page` variable will now have the following properties:

    @page.url           # => http://campl.us/iao4
    @page.created_at    # => 2012-03-14 22:53:49
    @page.location      # => 45.43383498680353 12.34226474539595
    @page.location_name # => Venice, Venice
    @page.tweet_text    # => Carnival in Venice, a travel photographer's dream shoot!
    @page.tweet_id      # => 180064216093437954 (the actual id on Twitter)
    @page.view_count    # => 2101
    @page.comment_count # => 1

Assuming that you'll want to create a list of the pages of the specified user, the following can be done in Haml:

    %ul
      - @user.pages.each do |page|
        %li
          = "#{page.tweet_text} at #{page.location_name} on #{page.created_at.strftime("%d %b %Y")}"

This will generate a list of pages with a maximum of 50 (in case each page has a single photo). The number of pages depends on the number of photos a page has. In case a page has 50 photos, it will only return a single page.

#### Retrieving the photos from the pages

Just like the `Cameraplus::User` instance has access to it's pages, a `Cameraplus::Page` in turn has access to it's photos:

    @page.photos        # => [ #<Cameraplus::Photo:0x007fb5c2f90a90>, #<Cameraplus::Photo:0x007fb5c2f9b300>, ... ]

The above returns an Array with `Cameraplus::Photo` objects. Again, assuming that you've selected the first photo on the page with: `@photo = @page.photos.first`, it will have access to the below properties:

    @photo.small        # => http://pics.campl.us/t/0/0b497f01791c851db1a17f81e0621a5c.jpg
    @photo.medium       # => http://pics.campl.us/iphone/0/0b497f01791c851db1a17f81e0621a5c.jpg
    @photo.large        # => http://pics.campl.us/f/0/0b497f01791c851db1a17f81e0621a5c.jpg
    @photo.width        # => 800
    @photo.height       # => 590
    @photo.location     # => 45.43383498680353 12.34226474539595

In case you want to list all the large versions of the photos retrieved by the above call, you could do the following and loop through them afterwards:

    @large_photos = @user.pages.map { |page| page.map(&:large) }.flatten

#### Retrieving the next set of pages

When a user has more pages than the results of `@user.pages`, the next set of pages can be retrieved with `@user.more_pages`. This doesn't only return the new set of pages though. It also retrieves the user data. The result is exactly the same as `@user` only with a new list of pages and calling `.more_pages` on the new object returns even more of them (if they exist).

### PageMetadata

The Camera+ Web Sharing API doesn't return all the details of a page through the earlier mentioned API call, which is made by the `Cameraplus::API::User` class. The `Cameraplus::API::Page` class however does retrieve all of the desired data. The `Cameraplus::PageMetadata` class basically is a layer on top of that API class.

Retrieving metadata from the page is as easy as:

    @metadata = Cameraplus::PageMetadata.find("b72Z")

The argument "b72Z" is the identifier of the page and is being used in the actual URL. The first page retrieved in 'Retrieving pages from a user' has the following url: 'http://campl.us/iao4', `iao4` in this url would be used as a parameter in the above call. The following properties can be accessed on a `Cameraplus::PageMetadata` instance:

    @metadata.url           # => http://campl.us/b72Z
    @metadata.created_at    # => 2011-07-01 21:50:40
    @metadata.location      # => nil
    @metadata.location_name # => nil
    @metadata.tweet_text    # => Tiny Town of Kotor, Montenegro #mybestphoto
    @metadata.tweet_id      # => 86914646237384704 (the actual id on Twitter)
    @metadata.view_count    # => 925
    @metadata.comment_count # => 6

As you can see, these properties are identical to the properties of a `Cameraplus::Page`, but it also adds a lot more.

#### Retrieving the user belonging to the page

The user who owns the page can be accessed with:

    @user = @metadata.user

You might expect the same properties as you'll get from the previous user call, this isn't the case though. The response of this requested call doesn't include `#page_count` and `#photo_count`. This leaves you with the properties:

    @user.id            # => 14199276
    @user.username      # => lucyk
    @user.name          # => Oleg Lutsenko
    @user.avatar        # => http://a0.twimg.com/profile_images/1318866321/avatar1_sqr_normal.jpg

#### Retrieving the photos belonging to the page

All of the photos which are included on the specified page are presented to you by calling:

    @photos = @metadata.photos

These photos have the same properties as mentioned previously with the addition of exif data and recipes. The basic `Cameraplus::Photo` object has these properties:

    @photo.small        # => http://pics.campl.us/t/f/f2cc65ab786741e7ab9fb994d06626a6.jpg
    @photo.medium       # => http://pics.campl.us/iphone/f/f2cc65ab786741e7ab9fb994d06626a6.jpg
    @photo.large        # => http://pics.campl.us/f/f/f2cc65ab786741e7ab9fb994d06626a6.jpg
    @photo.width        # => 800
    @photo.height       # => 597
    @photo.location     # => nil

The added functionality is described below.

##### Retrieving the exif data from a photo

As mentioned in the previous part, a `Cameraplus::Photo` object has more than just the default properties. It also includes exif data of the actual photo. The data can be accessed as follows:

    @exif_data = @photo.exif

The above will return an Array with `Cameraplus::PhotoExif` objects, selecting the first item of the Array (`@exif = @exif_data.first`) will return the following:

    @exif.title         # => Camera
    @exif.value         # => Apple iPhone
    @exif.style         # => main

Exif data can include options like: Camera (Apple iPhone 4s), Software (Camera+ 2.2.1), Exposure (1/580 sec), Aperture (f/2.4) and Focal length (3.9 mm).

##### Retrieving the recipe from a photo

An instance of `Cameraplus::Photo` also has an Array called recipes with any of the effects, in the form of a `Cameraplus::PhotoRecipe` object, which were applied to it in the Camera+ iPhone app. A recipe has two properties:

    @recipe.type        # => fx
    @recipe.value       # => Miniaturize (80%)

The recipes of a photo can be accessed through: `@photo.recipes`.

#### Retrieving the comments belonging to the page

People can comment on the photo or photos you've taken. Those comments are made available through the API. Accessing them is done by calling:

    @comments = @metadata.comments

The Array contains `Cameraplus::Comment` instances with these properties:

    @comment.author     # => Lisa Bettany
    @comment.avatar     # => https://fbcdn-profile-a.akamaihd.net/hprofile-ak-snc4/261022_674215636_4030749_q.jpg
    @comment.url        # => http://www.facebook.com/profile.php?id=674215636
    @comment.text       # => great shot!

Once again, the above comment was retrieved by accessing the first element of the Array.

### Search

It's also possible to search for a user, pages or photos. There is a single call for this, which is:

    @results = Cameraplus::Search.find username: "mostlylisa"

This will retrieve an Array with `Cameraplus::Search` objects. Each of these has three properties:

    @result.page        # => #<Cameraplus::Page:0x007fb5c2f91080>
    @result.user        # => #<Cameraplus::User:0x007fcfd54aec08>
    @result.photos      # => [ #<Cameraplus::Photo:0x007fb5c2f90a90>, #<Cameraplus::Photo:0x007fb5c2f9b300>, ... ]

Again, this is assuming that we've selected the first result with: `@result = @results.first`.

#### Possible arguments for a search

As seen in the previous call, a hash is required for a search. It needs at least one argument. The possible properties of the hash are: `username`, `tweettext`, `earliest`, `latest` and `locationname`. Below is list of these properties with it's types and descriptions:

    username      String            Twitter username
    tweettext     String            Tweet text partial search
    earliest      YYYY-MM-DD HH:MM  Return only tweets on or after this date/time (UTC)
    latest        YYYY-MM-DD HH:MM  Return only tweets on or before this date/time (UTC)
    locationname  String            Location name string partial match. Note: location names are missing for pages created before March, 2011.

## Contributing

You're very welcome to contribute to this gem. To do so, please follow these steps:

1. Fork this project
2. Clone your fork on your local machine
3. Install the development dependencies with `bundle install`
4. Create your feature branch with `git checkout -b my-new-feature`
5. Run the specs with `rspec` and make sure everything is covered with RSpec
6. Commit your changes `git commit -am 'Added new feature'`
7. Push to your branch `git push origin my-new-feature`
8. Create a new Pull Request

## Copyright

Copyright 2012 Kevin Tuhumury. Released under the MIT License.
