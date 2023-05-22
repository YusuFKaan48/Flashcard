# Flashcard

# Login Part

This code represents a login screen that is typically used in iOS applications. The login screen provides the user with a title, subtitle, username and password input fields, a login button, and a label to display error messages. You can notify the occurrence of this event using the LoginViewControllerDelegate protocol when the user logs in. If any errors occur during the login process, they are displayed to the user through the error message label. To help you understand the login screen better, relevant text labels and buttons are placed with the view components, and the view's layout is set using the layout() method.

Successful login example:

<img src="https://github.com/YusuFKaan48/Flashcard/assets/111217286/832ee95f-61cf-4bb5-8959-ab693e0bb13f" alt="GIF Caption" width="187.5" height="406">

Unsuccessful login example:

<img src="https://github.com/YusuFKaan48/Flashcard/assets/111217286/26f82856-917e-41cf-a85d-9ac683743371" alt="GIF Caption" width="187.5" height="406">

# Onboarding Part

This part is designed to display an onboarding screen to the user on the first launch of the application and then ensure that the screen is not shown again by using UserDefaults. This approach promotes user exploration of the application's features and provides a better user experience.

First-time onboarding example:

<img src="https://github.com/YusuFKaan48/Flashcard/assets/111217286/07fe531d-47d8-414c-86b3-902efa414b60" alt="GIF Caption" width="187.5" height="406">

Second-time onboarding example:

<img src="https://github.com/YusuFKaan48/Flashcard/assets/111217286/b22cb70a-b00e-4407-89c6-0f6d22703138" alt="GIF Caption" width="187.5" height="406">

# Daily message part

The DailyMessageView class is a subclass of UIView that displays a daily message. This class contains two sub-components, messageLabel and iconImageView. When the imageName property is modified, the image displayed by the iconImageView is updated, and the updateMessageAndIcon() function is called. This function determines a message text and icon name based on the current hour and updates them on the messageLabel and iconImageView respectively. Thus, the DailyMessageView class dynamically shows the user the daily message.


<img src="https://github.com/YusuFKaan48/Flashcard/assets/111217286/40a0fc4c-120c-4294-8e6f-086bb16257a9" alt="GIF Caption" width="135" height="30">

<img src="https://github.com/YusuFKaan48/Flashcard/assets/111217286/04bc819a-16b8-4ff1-9df4-394f45e8e019" alt="GIF Caption" width="157.5" height="30">

<img src="https://github.com/YusuFKaan48/Flashcard/assets/111217286/e1c759aa-b95e-41ce-822a-6e78acbca381" alt="GIF Caption" width="135" height="30">



