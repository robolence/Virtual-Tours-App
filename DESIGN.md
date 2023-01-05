// Design Document //
Note: I suggest watching the youtube video first as it'll help foreground some essential information.

The project began in Unity where I was able to comprise all of my 3D geometry, materialize them correctly per the real-life exhibition and render, and control the view of such environment through a First Person controller, that with which is coded with a pre-fab script that connects the normal vector of the camera to the Game screen (what the user is seeing through their device). Movement and rotation is scripted to dictate the changing of the camera's x and y position in the space. Box collider components were added to disallow the camera (user) from moving through certain walls. 

Once built for iOS development (Build and Run by Unity), the project was embedded into a basic SwiftUI file. From thereon, the 'Unity' sheet was added to facilitate the onloading and initializing of the Unity scene (the VR environment for the art exhibition), and loading the framework that controls the scene (UnityFramework). Here, you can see multiple functions under the class Unity that describe the Unity window (connected to UIWindow or main), whether to initialize it, unload it with a call to unloadApplication(), etc. I followed a tutorial for this and linked it in the initial comments.

Consecutively down the line of saved SwiftUI files from the main navigation bar:

The ViewController is a pre-generated file view contains a class that controls all views for the app. Here, an addition was added to configure the .viewDidLoad() function to include the Unity view, and for the Unity view to control the content view when initialized (by the main footer button, or the circle at the center)

The ViewRouter establishes the object that defines the various pages / views (cases) that exist from the tab bar on ContentView()

AppDelegate is a pre-generated file view that was modified to include Unity logic that launches Unity and allows Unity to share the main UIWindow- in this case, ContentView().

Article defines the struct that contains the information for the Article Data Fetching with the SwiftSoup API. Here, you can see the different definitions for each fetched HTML element > text to fill for each Article object.

ArticleCell defines the view that comprises all of the fetched information and how they visually appear on the ArticleListView(). In essence, it's each "block" on the Home tab when the app is running.

ArticleListView includes mostly fetched info with some hard-coded text (such as the VR element text + button at the top of the home page), in addition to assembling all of the ArticleCell blocks, and sending the fetched data to the view through a ForEach function.

The ContentView is where most of the app from which is hosting its visual components. It includes the HeaderView, which composes the header, the four tab views (ArticleListView or Home, DonateView, ShopView, TicketView), and the footer (TabFooterView). I'd like to just include the TabFooterView for cleanliness on the sheet, but there's a bug that I need to further look into before doing so- read more on the sheet.

DataServide and SlideshowData both host the SwiftSoup DO CATCH function that fetches the HTML from the website link, and parses it by searching for certain elements and attributes. DataService does this for the articles, whereas SlideshowData does this for the homepage slide view (top slider images).

DonateView is the host for its associated tab.

HeaderView is the host of the header visuals, including the museum icon, the menu burger icon, and the search button.

LaunchScreen shows what the user first sees when opening the app, or in app transitions (such as opening the VR feature)

Main is the storyboard file that hosts the main function (located on AppDelegate)

ShopView is the host for its associated tab.

SceneDelegate is a pre-generated file that allows view movement. A lot of the present functions are vital to the app's functions.

Slideshow takes the fetched data from each struct and creates an ASync image, that gets comprised in the ArticleListView.

SlideshowData hosts the struct for the slideshow data fetching (struct slideshowImages)

TabFooterView is not currently being used, but will be reactivated once it can be included in the ContentView.

TicketView is the host for its associated tab.
