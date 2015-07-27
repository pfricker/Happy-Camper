### Happy Camper Gear Exchange

## About:

The app helps user plan and gear up for their outdoor adventures by matching them with other users who have gear appropriate for their trip based on user location and the historical climate data for their destination.

The app has two main sections.
- The first allows users to search for gear from other users by specifying a location and a radius in which they want to search.  The type of gear they are looking for is selected from the radio buttons over the search field.  Additionally users can perform a more specific search by using the advanced search tab.  Each gear type has it's own advanced search parameters allowing users to search by size, capacity, temperature range, etc.  The results page shows a list of matching gear as well as a map with their relative locations. When users find the appropriate gear they can send an email to that user, requesting it for whatever dates they specify.  At that point the two users are free to communicate with one another through email.
- The other main feature of the app is the trip planner.  One of the most difficult aspects of planning a backpacking trip is often knowing what the weather will be like and consequently what gear you will need.  It is often difficult to find the historical weather for any particular location.  The trip planner function allows users to specify a location by address, city and state, zip code, or even notable landmarks, and find the historical weather data for their specific dates in a simple easy to read format.  The trip planner also makes gear recommendations based on the temperature data, length of trip, and number of participants.  

## Under the Hood:

- The search is handled by the Search Class defined in the search.rb model.  The search params are passed in as the new search object is instantiated and the filter method applies searches based on whatever params are passed in.  
- The location search is handled by the GeoCoder gem and the `.near` method it provides.  Since the gear items do not have a location themselves but rather belong to users who possess the location property, a simple join statement lets us search for gear by location.
- The advanced search params are dealt with by chaining `.where` with basic SQL statements onto the location search.  
- The maps are done using the `gmaps4rails` gem and later releases of the app will hopefully include pictures in the info windows as well as direct links to the show page for each marker.  
- The API used to provide the climate data is the Weather Underground API.  The planner feature allows users to specify a date range between 1 and 30 days.  (A trip duration larger than 30 days will simply return data for a 30 day window after the start date.)
- The user can specify the destination in nearly any format they like, because the trips controller first makes a call to the Google Geocoder API and passes the result latitude and longitude coordinates into the API request to Weather Underground.  While this does add to the response time slightly, it allows the user much more freedom in specifying their destination and make the site more user friendly overall.
