# flutter_weather

This project is a demonstration of my ability to design and write a flutter application in a short period of time. As expected, I did not finish, but I learned a lot, and have a lot to reflect on. I will share some of that here.

![app 1](https://i.imgur.com/VAcWHUw.png) ![app 2](https://i.imgur.com/JExQekG.png)

## The Criteria

 - [x] Display a splash screen when the app is launched
 - [ ] Allow the user to specify their location using ZIP codes (for both home and work) and/or geographic coordinates.
 - [x] Connect to a public API (such as https://openweathermap.org/forecast16#zip) to obtain weather data.
 - [ ] Display the current week’s forecast in a weekly calendar format. The calendar should display the range of hours where a severe weather event is likely (greater than 30%) as well as the type of event.
 - [x] Once the user selects the particular day’s forecast, more detail should be shown about the current day’s forecast broken down into smaller time segments.
 - [ ] The user must be able to share the forecast using their mobile OS’ default share sheet.
 - [ ] The user must also be able to save various app settings. For example if a user used a certain zip code to search for weather info, they should be able to save their location preference so that the next time they launch the app they will be able to see that displayed on their home view and just tap on that previously saved item for viewing.

#### Other Considerations


- Bonus (Optional): Mock up a way to alert the user of severe weather in proximity to the user when the app is closed. You can trigger this event manually when demonstrating the app.
- Things to consider:
  - Support for both IOS and Android
  - A thoughtful User Interface (UI)
  - The best User Experience (UX)
  - App Icon, theming and color palettes
  - Error handling

## What went right

I did a really extensive set of designs to think through UI simplicity. I wanted the application to contain a lot of information without being overwhelming.

![design 1](https://i.imgur.com/3pdDCz0.png)

![design 2](https://i.imgur.com/G9kyVSu.png)

[The Full Design](../blob/master/assets/design/Flutter Weather.fig) can be opened in Figma.

I was able to successfully utilize the weather API from openweathermap.org, but it seems as though the only APIs that are available are Current weather and 5 Day/3 Hour forecasts. All other available APIs require paid, developer, enterprise, etc. type of accounts. So these were the two APIs I utilized.

The application overall feels pretty clean, but there are obviously tons of things to tidy up.


## What went wrong

Unfortunately, there's a lot wrong.
- App Functionality
  - Favorites and local storage aren't working properly. I started to look at it, but I'm not happy with the original solution I came up with, since I actually need to store location names, and then either coordinates or a zip code. I would like to rethink how I go about storage if I'm going to use SharedPreferences.
  - Selecting a different location isn't possible. This isn't actually that hard to implement. I already have the views available, and the API calls customizable. Just not enough time to write it all.
  - Weekly forecast is limited. The hours aren't completely correct for each day, and I'm not highlighting potential dangerous weather scenarios. The API did not give all the information that I expected (Nor in the format I need), so this would be challenging even with infinite time. I would prefer to apply for a dev account and get better data
  - Share functionality is not done. Triggering the native share functionality is pretty easy, the way I send data is not. I would like to send a link to something that shows the weather, and I thought that sharing the weather in plain text isn't very useful.
  - There are no user settings because... there's nothing to alter. I would love to put a wrapper on the application so that I could allow custom theming or at least theme swaps, but it wasn't a priority.
- Best Practices
  - Since I had to do things quickly, I did not manage application state very well. As a result, you will see things load as you open each page. It's not super clean, but it works. Occasionally, the images won't show at all.
  - My API key is public, and that is obviously terrible practice. Shortcuts had to be made.
  - The code is pretty messy. I would need to do a lot of refactoring and general cleanup for this to truly be presentable. Given the time constraint, I suppose that's expected.
  - No physical iOS Testing was done. I do not currently possess a valid application bundle ID for this application, so I'm not really allowed to do physical iOS testing. There was iOS simulator testing, though.

## In Reflection

At the end of it, I wish I would have prioritized slightly differently. There was probably ample time to get a little bit more functionality working at the cost of some design. I tried to utilize as much as I could from existing sources, especially [Feather](https://github.com/jhomlala/feather) which has absolutely killer user design, functionalities, animations... It's amazing. I wish I could have submitted that under my own name.

Unfortunately, the current health crisis made my time rather short, and the original ask was about five and a half days. If I had a bit more free time, I think I could button this up pretty nicely.


