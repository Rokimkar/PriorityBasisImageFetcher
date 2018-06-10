# PriorityBasisImageFetcher
create a custom operation class that will actually do the Image downloading. Refer to points below for more details. 
• Create a singleton instance of image download manager.
Initialise the NSURLSession to create download tasks for images.
It should also have NSCache instance to cache the images that have been downloaded.
• Implement a function to get an image for a URL with a completion block that returns an image and the requested URL..
This function should be called from the willDisplayCell method of the collection view delegate from the view controller.
Use thumb image URL. • If the image exists in the cache, it should be returned immediately.
• If the image doesn’t exist in the cache, check if there is a download task that is currently downloading the same image. 
If yes, update the completion block to be called once the task completes and increate the priority of the task.
• If there is no such download task, create a new task to download the image.
When download is complete, update the image in the cache and call the completion block to pass the image to the collection view cell. 
• Implement a function to reduce the priority of the network operation in case the user scrolls and an image is no longer visible.
You need to figure out the correct logic to find out when an image is no longer visible.
