# Virtual-Tours-App
iOS Virtual Tours app with SwiftUI and native Unity

<img
  src="/img/readmeImage.jpg"
  title="Home feed image, VR image, iPad compatible home feed image"
  style="display: inline-block; margin: 0 auto; max-width: 100%">

// Description //

Project includes iOS app built with SwiftUI and integrated with native Unity scene(s), compatible with light / dark mode. Some features are not yet available, i.e. the hamburger menu and search options- hoping to get these out within the next few months. 

// Associated Video //

Youtube video: https://www.youtube.com/watch?v=UETfWizbgHU 

// Contents //

Embedded in the package are two folders: SIMuseum FP and UnityBuild. Be sure not to rename these as they are linked. The Swift workspace file (SIMuseum FP WS.xcworkspace) hosts both folders and will be the entry file to interact with the project. All other files are images used by the Swift project. By request, the original Rhino file with 3D scan geometry can be available (per the video)- it is too large to be transferred. 

The UnityBuild folder includes all Unity-based information including the scene (rendered geometry and VR environment). It also includes the iOS build that simulates the scene with the embedded Unity framework. To open the scene, open the folder from Unity and it should be available to be initialized from the UnityBuild folder.

SIMuseum FP includes the Swift project file and all associated files, including test files, individual view files, and file assets.

// Instructions //

Initiate Xcode and use the file/folder option to open the WORKSPACE file. If you open either of the project folders, you won't be able to compile properly. Once open, you should see two projects on the left navigation bar: 'Unity-iPhone' and 'SIMuseum'. If their fonts are red, check their 'Identity and Type' by clicking on the title, clicking 'General', and checking the right side column that the 'Location' is 'Relative to Workspace'. 

Double check that 'SwiftSoup' is included at the bottom of the main navigation bar under 'Package Dependencies'. This package is essential for the HTML API. If not, reconnect it through Github at link: https://github.com/scinfu/SwiftSoup under File > Add Package. 

Each view includes basic descriptions of what the view or file is / does at the top of the respective file. The files can be configured from their respective files once opened. The assets include LaunchScreen content and icons used in navbars or other locations. Info is an auto-generated file upon creation. 

To run the file, you must connect an iPhone or iPad WITH THE MOST RECENT UPDATE (16.1). If desired, you can change the iOS Deployment Target in the SIMuseum > Info tab for a lower update version, but the app may not compile properly due to some features being too new or deprecated. When connected, your device should be displayed under 'SIMuseum FP > (Ex: Rob's iPhone)'. 

Because of the Unity framework essential to run the scene on devices, the app will not be functional if not compiled and run on an actual device. 

To run the program on your device * , click the 'Play' button at the top of the program. If the program gives compiler issues (most notably, memory), click the stop button and run the app on the device normally. 

Feel free to email me if you have any additional questions at rnilsen@gsd.harvard.edu.

* You need an Apple developer account to test programs on your Apple device. You just need to register with your Apple ID and enter the informatiomn under SIMuseum FP > Targets (SIMuseum FP) > Team (Make a personal team with your apple ID). Check 'Automatically manage signing' and the requirements should be satisfied. If the bundle identifier gives an issue, change it to a UNIQUE value like scrambled numbers or letters.
