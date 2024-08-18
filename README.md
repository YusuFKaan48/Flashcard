# Flashcard

Flashcard is a word learning app that utilizes word cards to help users learn new words. It features a collection view that enables users to scroll horizontally and access different words. The login screen allows users to enter their username and password to access the app. The onboarding screen introduces first-time users to the app's basic features. The daily message section displays messages tailored to the current time of day. The Today's Words section showcases a selection of daily chosen words. Overall, Flashcard provides an engaging platform for users to expand their vocabulary.

In app screenshots:

<img src="https://github.com/YusuFKaan48/Flashcard/assets/111217286/871ab142-f64f-4970-b37d-13a41825fa5b" alt="GIF Caption" width="187.5" height="406">
<img src="https://github.com/YusuFKaan48/Flashcard/assets/111217286/8a1f1a07-abe4-4d0d-8c3f-ad7e74e183a5" alt="GIF Caption" width="187.5" height="406">
<img src="https://github.com/YusuFKaan48/Flashcard/assets/111217286/70c0512c-3cec-485c-bb6b-3eb556a62ab1" alt="GIF Caption" width="187.5" height="406">
<img src="https://github.com/YusuFKaan48/Flashcard/assets/111217286/00b472f5-5491-4990-9323-7402516b8712" alt="GIF Caption" width="187.5" height="406">
<img src="https://github.com/YusuFKaan48/Flashcard/assets/111217286/919d6fb7-280a-4f70-b902-98919b252884" alt="GIF Caption" width="187.5" height="406">


# Login Part

The LoginView is a login screen that utilizes the protocol-delegate pattern to handle the login event. If a login attempt fails, it displays error messages specific to the situation.

Successful login example:

<img src="https://github.com/YusuFKaan48/Flashcard/assets/111217286/832ee95f-61cf-4bb5-8959-ab693e0bb13f" alt="GIF Caption" width="187.0" height="406">

Unsuccessful login example:

<img src="https://github.com/YusuFKaan48/Flashcard/assets/111217286/26f82856-917e-41cf-a85d-9ac683743371" alt="GIF Caption" width="187.5" height="406">

# Onboarding Part

This part is designed to display an onboarding screen to the user on the first launch of the application and then ensure that the screen is not shown again by using UserDefaults. 

First-time onboarding example:

<img src="https://github.com/YusuFKaan48/Flashcard/assets/111217286/07fe531d-47d8-414c-86b3-902efa414b60" alt="GIF Caption" width="187.5" height="406">

Second-time onboarding example:

<img src="https://github.com/YusuFKaan48/Flashcard/assets/111217286/b22cb70a-b00e-4407-89c6-0f6d22703138" alt="GIF Caption" width="187.5" height="406">

# Daily message part

The purpose of the DailyMessageView is to display different messages and icons to the user based on the time of day.

<img src="https://github.com/YusuFKaan48/Flashcard/assets/111217286/40a0fc4c-120c-4294-8e6f-086bb16257a9" alt="GIF Caption" width="135" height="30">

<img src="https://github.com/YusuFKaan48/Flashcard/assets/111217286/04bc819a-16b8-4ff1-9df4-394f45e8e019" alt="GIF Caption" width="157.5" height="30">

<img src="https://github.com/YusuFKaan48/Flashcard/assets/111217286/e1c759aa-b95e-41ce-822a-6e78acbca381" alt="GIF Caption" width="135" height="30">

# Today's Words part

TodayWordView is a section where 5 randomly selected words and their meanings are displayed, with an update scheduled every 24 hours.

<img src="https://github.com/YusuFKaan48/Flashcard/assets/111217286/d984bce3-1b0a-4dea-81b1-a2d6377f1c15" width="165" height="255">


# Flashcards part

I have created flashcards using UICollectionView. The collection view consists of horizontally scrollable cells. Each cell contains a word and its translation. When a cell is tapped, it flips to reveal the meaning on the backside of the card.

Scroll and cell tapped  example:

<img src="https://github.com/YusuFKaan48/Flashcard/assets/111217286/090ba2d3-be7d-4b6b-9a63-4b78d64fd856" alt="GIF Caption" width="187.5" height="406">
