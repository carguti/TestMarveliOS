# MarveliOS

MarveliOS is an App that uses Marel Official API to get marvel characters and show the detail of a specific character. 
For personal purposes only, not with comercial use.

Data provided by Marvel. © 2014 Marvel

## Architecture

I have used a MVP-Coordinator architecture, because I think that this kind of architecture is one of the best solutions for separate responsibilities between layers, for testing and for clear coding, I think is an architecture where if a new workmate comes to the project without any knowledge of it, he could not has problems to understand the code and the app structure and functionality.

In this architecture View layer only knows what to show, nothing else, that comes from MVP, and also, with Coordinator we minimise the responsibilities of the Presenter because Coordinator is the responsible of the app's navigation.

I have also used a Singleton pattern to keep an array of characters accesible. It´s used to go back from character detail view to characters list view, not to do the characters list request again.

## Observations

I have added a SplashScreen because the MarvelAPI doesn't accept real pagination requests, so you should do several request changing the parameter "offset", increasing it at a maximum of 100 in every request, so you only get 100 characters from request, and this is a time handicap for the App, so I used SplashScreen with a ProgressBar to show the loading progress to user.

In character detail screen, it's shown characters's name, description and a background image of itself.

## Extra work

I have added a character search functionality beacause there too many characters, and it is very difficult to find the one you want only doing scroll.

It's a dynamic search, it shows the results while the user writes in the SearchBar.

## Use of Frameworks

I added SDWebImage to download character images.


## Rights
Marvel. © 2014 Marvel
