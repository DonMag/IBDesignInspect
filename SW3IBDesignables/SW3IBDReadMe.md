# SW3IBDesignables

Basic example of subclassing UIView to create a custom "Image View" class that can be seen and interacted with in Interface Builder.

![My image](http://donmag.com/gh/IBDesignInspect/DemoImage.png)

This example contains two Storyboards:

Main - which shows the full IBDesignable and IBInspectable "RoundedBottomImageView" subclass

Alternate - which shows how the clipping path is added as a layer mask to a single view.

While the resulting appearance is the same, you can see the difference (and advantages) in using an IBDesignable subclass by opening each storyboard in Xcode.

To see the difference when running the app, simply change the Main Interface under Deployment Info for the target.

![My image](http://donmag.com/gh/IBDesignInspect/Interface.png)


