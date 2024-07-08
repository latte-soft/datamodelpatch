local v0 = require(script.Parent.GeneratedStrings);
local v1 = {
    Keys = {
        BY = "BY", 
        RECOMMENDED_GAMES = "RECOMMENDED_GAMES", 
        PLAYING = "PLAYING", 
        VISITS = "VISITS", 
        CREATED = "CREATED", 
        UPDATED = "UPDATED", 
        MAX_PLAYERS = "MAX_PLAYERS", 
        GENRE = "GENRE", 
        ALLOWED_GEAR = "ALLOWED_GEAR", 
        REPORT_ABUSE = "REPORT_ABUSE", 
        COPYLOCKED = "COPYLOCKED", 
        DETAILS = "DETAILS", 
        VIP_SERVERS = "VIP_SERVERS", 
        GAME_BADGES = "GAME_BADGES", 
        PASSES_FOR_THIS_GAME = "PASSES_FOR_THIS_GAME", 
        GEAR_FOR_THIS_GAME = "GEAR_FOR_THIS_GAME", 
        PLAYERS = "PLAYERS", 
        CLANS = "CLANS", 
        SERVERS_MY_FRIENDS_ARE_IN = "SERVERS_MY_FRIENDS_ARE_IN", 
        OTHER_SERVERS = "OTHER_SERVERS", 
        ABOUT = "ABOUT", 
        STORE = "STORE", 
        LEADERBOARDS = "LEADERBOARDS", 
        SERVERS = "SERVERS", 
        SEARCH = "SEARCH", 
        TURN_ON_CHAT = "TURN_ON_CHAT", 
        PRIVACY_SETTINGS = "PRIVACY_SETTINGS", 
        CANCEL = "CANCEL", 
        CONFIRM = "CONFIRM", 
        SEARCH_GAMES = "SEARCH_GAMES", 
        SEARCH_FOR_FRIENDS = "SEARCH_FOR_FRIENDS", 
        SEARCH_FOR_FRIENDS_AND_CHAT = "SEARCH_FOR_FRIENDS_AND_CHAT", 
        NO_RESULTS_FOUND = "NO_RESULTS_FOUND", 
        SEE_MORE_FRIENDS = "SEE_MORE_FRIENDS", 
        SEE_LESS_FRIENDS = "SEE_LESS_FRIENDS", 
        NO_NETWORK_CONNECTION = "NO_NETWORK_CONNECTION", 
        SHARE_GAME_TO_CHAT = "SHARE_GAME_TO_CHAT", 
        MAKE_FRIENDS_TO_CHAT = "MAKE_FRIENDS_TO_CHAT", 
        THIS_MESSAGE_WAS_MODERATED = "THIS_MESSAGE_WAS_MODERATED", 
        FILTERED_FOR_RECEIVERS = "FILTERED_FOR_RECEIVERS", 
        CHAT_GROUP_NAME = "CHAT_GROUP_NAME", 
        NOTIFICATIONS = "NOTIFICATIONS", 
        ADD_FRIENDS = "ADD_FRIENDS", 
        LEAVE_GROUP = "LEAVE_GROUP", 
        LEAVE_GROUP_MESSAGE = "LEAVE_GROUP_MESSAGE", 
        STAY = "STAY", 
        LEAVE = "LEAVE", 
        REMOVE_USER = "REMOVE_USER", 
        REMOVE_USER_CONFIRMATION_MESSAGE = "REMOVE_USER_CONFIRMATION_MESSAGE", 
        REMOVE = "REMOVE", 
        NOT_SET = "NOT_SET", 
        CHAT = "CHAT", 
        CHAT_DETAILS = "CHAT_DETAILS", 
        NEW_CHAT_GROUP = "NEW_CHAT_GROUP", 
        CHAT_INPUT_PLACEHOLDER = "CHAT_INPUT_PLACEHOLDER", 
        OPTION = "OPTION", 
        VIEW_PROFILE = "VIEW_PROFILE", 
        REPORT_USER = "REPORT_USER", 
        REMOVE_FROM_GROUP = "REMOVE_FROM_GROUP", 
        GENERAL = "GENERAL", 
        MEMBERS = "MEMBERS", 
        FAILED_TO_RENAME_TITLE = "FAILED_TO_RENAME_TITLE", 
        FAILED_TO_RENAME_MESSAGE = "FAILED_TO_RENAME_MESSAGE", 
        GROUP_NAME_MODERATED = "GROUP_NAME_MODERATED", 
        FAILED_TO_LEAVE_GROUP = "FAILED_TO_LEAVE_GROUP", 
        FAILED_TO_LEAVE_GROUP_MESSAGE = "FAILED_TO_LEAVE_GROUP_MESSAGE", 
        FAILED_TO_REMOVE_USER = "FAILED_TO_REMOVE_USER", 
        FAILED_TO_REMOVE_USER_MESSAGE = "FAILED_TO_REMOVE_USER_MESSAGE", 
        TOO_MANY_PEOPLE = "TOO_MANY_PEOPLE", 
        REMOVED_FROM_CONVERSATION = "REMOVED_FROM_CONVERSATION", 
        NAME_THIS_CHAT_GROUP = "NAME_THIS_CHAT_GROUP", 
        SAVE = "SAVE", 
        SAVE_NEW_GROUP = "SAVE_NEW_GROUP", 
        SAVE_ADDED_FRIENDS = "SAVE_ADDED_FRIENDS", 
        SEND = "SEND", 
        SENT = "SENT", 
        OFFLINE = "OFFLINE", 
        ONLINE = "ONLINE", 
        BY_BUILDER = "BY_BUILDER", 
        VIEW_ASSET_DETAILS = "VIEW_ASSET_DETAILS", 
        PLAY_GAME = "PLAY_GAME", 
        MY_FEED = "MY_FEED", 
        FRIENDS_COUNT = "FRIENDS_COUNT", 
        SEE_ALL = "SEE_ALL", 
        GAMES = "GAMES", 
        HOME = "HOME", 
        CATALOG = "CATALOG", 
        AVATAR = "AVATAR", 
        FRIENDS = "FRIENDS", 
        MORE = "MORE", 
        CURRENT_PLAYERS = "CURRENT_PLAYERS"
    }, 
    Languages = {
        EN_US = "en-us", 
        AR = "ar", 
        ZH_CN = "zh-CN", 
        ZH_TW = "zh-TW", 
        CS = "cs", 
        DA = "da", 
        NL = "nl", 
        EN_GB = "en-GB", 
        FI = "fi", 
        FR_CA = "fr-CA", 
        ES = "es", 
        ES_XL = "es-XL", 
        SV = "sv", 
        TH = "th", 
        TR = "tr", 
        VI = "vi"
    }
};
v1.DefaultLanguage = v1.Languages.EN_US;
v1.Content = {
    {
        key = v1.Keys.BY, 
        values = {
            [v1.Languages.EN_US] = "By"
        }, 
        comment = "The preposition after the game title to introduce the game creator."
    }, 
    {
        key = v1.Keys.RECOMMENDED_GAMES, 
        values = {
            [v1.Languages.EN_US] = "Recommended Games"
        }, 
        comment = "Recommended Games section header for the About Tab on the game details page."
    }, 
    {
        key = v1.Keys.COPYLOCKED, 
        values = {
            [v1.Languages.EN_US] = "This place is copylocked"
        }, 
        comment = "Notification that a game is locked."
    }, 
    {
        key = v1.Keys.REPORT_ABUSE, 
        values = {
            [v1.Languages.EN_US] = "Report Abuse"
        }, 
        comment = "Clickable text to report a game details page for bad content."
    }, 
    {
        key = v1.Keys.PLAYING, 
        values = {
            [v1.Languages.EN_US] = "Playing"
        }, 
        comment = "Label for the number of players playing a game."
    }, 
    {
        key = v1.Keys.CURRENT_PLAYERS, 
        values = {
            [v1.Languages.EN_US] = "{NUMBER_OF_CURRENT_PLAYERS} Playing"
        }, 
        comment = "Label for the number of players that are currently playing a game."
    }, 
    {
        key = v1.Keys.VISITS, 
        values = {
            [v1.Languages.EN_US] = "Visits"
        }, 
        comment = "Label for the number of visits a game has."
    }, 
    {
        key = v1.Keys.CREATED, 
        values = {
            [v1.Languages.EN_US] = "Created"
        }, 
        comment = "Label for the creation date of a game."
    }, 
    {
        key = v1.Keys.UPDATED, 
        values = {
            [v1.Languages.EN_US] = "Updated"
        }, 
        comment = "Label for the date of the last update to a game."
    }, 
    {
        key = v1.Keys.MAX_PLAYERS, 
        values = {
            [v1.Languages.EN_US] = "Max Players"
        }, 
        comment = "Label for the maximum number of players in a game."
    }, 
    {
        key = v1.Keys.GENRE, 
        values = {
            [v1.Languages.EN_US] = "Genre"
        }, 
        comment = "Label for the game genre."
    }, 
    {
        key = v1.Keys.ALLOWED_GEAR, 
        values = {
            [v1.Languages.EN_US] = "Allowed Gear"
        }, 
        comment = "Label for the allowed gear for a game."
    }, 
    {
        key = v1.Keys.OTHER_SERVERS, 
        values = {
            [v1.Languages.EN_US] = "Other Servers"
        }, 
        comment = "The other servers section header in the servers tab on the game details page."
    }, 
    {
        key = v1.Keys.SERVERS_MY_FRIENDS_ARE_IN, 
        values = {
            [v1.Languages.EN_US] = "Servers my friends are in"
        }, 
        comment = "The servers my friends are in section in the servers tab on the game details page."
    }, 
    {
        key = v1.Keys.CLANS, 
        values = {
            [v1.Languages.EN_US] = "Clans"
        }, 
        comment = "The group leaderboard header in the leaderboards tab on the game details page."
    }, 
    {
        key = v1.Keys.PLAYERS, 
        values = {
            [v1.Languages.EN_US] = "Players"
        }, 
        comment = "The players section header in the leaderboards tab on the game details page."
    }, 
    {
        key = v1.Keys.GEAR_FOR_THIS_GAME, 
        values = {
            [v1.Languages.EN_US] = "Gear for this game"
        }, 
        comment = "The gear section header in the store tab on the game details page."
    }, 
    {
        key = v1.Keys.PASSES_FOR_THIS_GAME, 
        values = {
            [v1.Languages.EN_US] = "Passes for this game"
        }, 
        comment = "The passes section header in the store tab on the game details page."
    }, 
    {
        key = v1.Keys.GAME_BADGES, 
        values = {
            [v1.Languages.EN_US] = "Game Badges"
        }, 
        comment = "The game badges section header on the game details page."
    }, 
    {
        key = v1.Keys.VIP_SERVERS, 
        values = {
            [v1.Languages.EN_US] = "VIP Servers"
        }, 
        comment = "The VIP servers section header in the about and servers tabs on the game details page."
    }, 
    {
        key = v1.Keys.DETAILS, 
        values = {
            [v1.Languages.EN_US] = "Details"
        }, 
        comment = "The game details section header on the game details page."
    }, 
    {
        key = v1.Keys.ABOUT, 
        values = {
            [v1.Languages.EN_US] = "About"
        }, 
        comment = "The About tab's text on the game details page."
    }, 
    {
        key = v1.Keys.STORE, 
        values = {
            [v1.Languages.EN_US] = "Store"
        }, 
        comment = "The Store tab's text on the game details page."
    }, 
    {
        key = v1.Keys.LEADERBOARDS, 
        values = {
            [v1.Languages.EN_US] = "Leaderboards"
        }, 
        comment = "The Leaderboards tab's text on the game details page."
    }, 
    {
        key = v1.Keys.SERVERS, 
        values = {
            [v1.Languages.EN_US] = "Servers"
        }, 
        comment = "The Servers tab's text on the game details page."
    }, 
    {
        key = v1.Keys.SEARCH, 
        values = {
            [v1.Languages.EN_US] = "Search"
        }, 
        comment = "Placeholder text for most search input text boxes. Explains the functionality of the text box."
    }, 
    {
        key = v1.Keys.TURN_ON_CHAT, 
        values = {
            [v1.Languages.EN_US] = "To chat with friends, turn on chat in your Privacy Settings."
        }, 
        comment = "Explains how to enable chat."
    }, 
    {
        key = v1.Keys.PRIVACY_SETTINGS, 
        values = {
            [v1.Languages.EN_US] = "Privacy Settings"
        }, 
        comment = "Label for button that opens the user's privacy settings."
    }, 
    {
        key = v1.Keys.CANCEL, 
        values = {
            [v1.Languages.EN_US] = "Cancel"
        }, 
        comment = "Used for buttons that cancel an action."
    }, 
    {
        key = v1.Keys.CONFIRM, 
        values = {
            [v1.Languages.EN_US] = "Okay"
        }, 
        comment = "Used for buttons that confirm an action or dismiss an informational pop-up."
    }, 
    {
        key = v1.Keys.SEARCH_GAMES, 
        values = {
            [v1.Languages.EN_US] = "Search games"
        }, 
        comment = "Placeholder text when searching for games."
    }, 
    {
        key = v1.Keys.SEARCH_FOR_FRIENDS, 
        values = {
            [v1.Languages.EN_US] = "Search for Friends"
        }, 
        comment = "Placeholder text when searching for friends."
    }, 
    {
        key = v1.Keys.SEARCH_FOR_FRIENDS_AND_CHAT, 
        values = {
            [v1.Languages.EN_US] = "Search for friends and chat groups"
        }, 
        comment = "Placeholder text when searching for friends and chat groups."
    }, 
    {
        key = v1.Keys.NO_RESULTS_FOUND, 
        values = {
            [v1.Languages.EN_US] = "No results found"
        }, 
        comment = "When searching and not finding any results."
    }, 
    {
        key = v1.Keys.SEE_MORE_FRIENDS, 
        values = {
            [v1.Languages.EN_US] = "See More ({NUMBER_OF_FRIENDS})"
        }, 
        comment = "Labels a button that expands a list of friends. NUMBER_OF_FRIENDS" .. " is the number of additional friends that will be shown."
    }, 
    {
        key = v1.Keys.SEE_LESS_FRIENDS, 
        values = {
            [v1.Languages.EN_US] = "See Less"
        }, 
        comment = "Labels a button that expands a list of friends. " .. "NUMBER_OF_FRIENDS is the number of additional friends that will be shown."
    }, 
    {
        key = v1.Keys.NO_NETWORK_CONNECTION, 
        values = {
            [v1.Languages.EN_US] = "Connecting..."
        }, 
        comment = "Informs the user that there is no network connection and" .. " data (conversations, etc.) can not be sent or received."
    }, 
    {
        key = v1.Keys.SHARE_GAME_TO_CHAT, 
        values = {
            [v1.Languages.EN_US] = "Share game to chat"
        }, 
        comment = "Title for share game to chat feature."
    }, 
    {
        key = v1.Keys.MAKE_FRIENDS_TO_CHAT, 
        values = {
            [v1.Languages.EN_US] = "Make friends in games to start chatting and playing together."
        }, 
        comment = "Unless a user has friends, they won't be able to chat with anyone. This message informs players" .. " they need friends to chat and suggests playing games as a way to find friends."
    }, 
    {
        key = v1.Keys.THIS_MESSAGE_WAS_MODERATED, 
        values = {
            [v1.Languages.EN_US] = "This message was moderated and not sent."
        }, 
        comment = "Shown to the user if a message is fully moderated" .. " and not sent to the other users in a conversation."
    }, 
    {
        key = v1.Keys.FILTERED_FOR_RECEIVERS, 
        values = {
            [v1.Languages.EN_US] = "Not everyone in this chat can see your message."
        }, 
        comment = "Shown to the user if a message is not shown to the minor people in a group chat."
    }, 
    {
        key = v1.Keys.CHAT_GROUP_NAME, 
        values = {
            [v1.Languages.EN_US] = "Chat Group Name"
        }, 
        comment = "Label for the name of a conversation"
    }, 
    {
        key = v1.Keys.NOTIFICATIONS, 
        values = {
            [v1.Languages.EN_US] = "Notifications"
        }, 
        comment = "Label for button that allows you to change settings for which notifications you get."
    }, 
    {
        key = v1.Keys.ADD_FRIENDS, 
        values = {
            [v1.Languages.EN_US] = "Add Friends"
        }, 
        comment = "Labels a button that allows you to add friends to a conversation."
    }, 
    {
        key = v1.Keys.LEAVE_GROUP, 
        values = {
            [v1.Languages.EN_US] = "Leave Group"
        }, 
        comment = "Labels action that allows a user to remove themself from a conversation."
    }, 
    {
        key = v1.Keys.REMOVE_USER, 
        values = {
            [v1.Languages.EN_US] = "Remove User"
        }, 
        comment = "Labels an action which removes another user (not the local user) from a conversation."
    }, 
    {
        key = v1.Keys.REMOVE, 
        values = {
            [v1.Languages.EN_US] = "Remove"
        }, 
        comment = "Labels the confirmation button for removing a user from a conversation."
    }, 
    {
        key = v1.Keys.LEAVE_GROUP_MESSAGE, 
        values = {
            [v1.Languages.EN_US] = "You won't be able to keep chatting with this group."
        }, 
        comment = "Message explaining that if they leave a chat group they" .. " will no longer be able to participate in chat."
    }, 
    {
        key = v1.Keys.STAY, 
        values = {
            [v1.Languages.EN_US] = "Stay"
        }, 
        comment = "Cancels the leave group action."
    }, 
    {
        key = v1.Keys.LEAVE, 
        values = {
            [v1.Languages.EN_US] = "Leave"
        }, 
        comment = "Confirms the leave group action."
    }, 
    {
        key = v1.Keys.NOT_SET, 
        values = {
            [v1.Languages.EN_US] = "Not Set"
        }, 
        comment = "Informs the user the title of a group conversation has not been set."
    }, 
    {
        key = v1.Keys.CHAT, 
        values = {
            [v1.Languages.EN_US] = "Chat"
        }, 
        comment = "Title of screen that shows list of conversations, which" .. " is the first screen that appears when chat is open."
    }, 
    {
        key = v1.Keys.CHAT_DETAILS, 
        values = {
            [v1.Languages.EN_US] = "Chat Details"
        }, 
        comment = "Title of screen that informs the user of a conversation's" .. " participants and title and allows them to edit these."
    }, 
    {
        key = v1.Keys.NEW_CHAT_GROUP, 
        values = {
            [v1.Languages.EN_US] = "New Chat Group"
        }, 
        comment = "Title of screen where user can create a new chat group."
    }, 
    {
        key = v1.Keys.CHAT_INPUT_PLACEHOLDER, 
        values = {
            [v1.Languages.EN_US] = "Say something"
        }, 
        comment = "Text shown in chat input bar before user types anything."
    }, 
    {
        key = v1.Keys.OPTION, 
        values = {
            [v1.Languages.EN_US] = "Option"
        }, 
        comment = "Title of pop-up that shows list of user actions."
    }, 
    {
        key = v1.Keys.VIEW_PROFILE, 
        values = {
            [v1.Languages.EN_US] = "View Profile"
        }, 
        comment = "Label for button that allows user to view another user's profile."
    }, 
    {
        key = v1.Keys.REPORT_USER, 
        values = {
            [v1.Languages.EN_US] = "Report User"
        }, 
        comment = "Label for button that allows user to report another user for inappropriate behavior."
    }, 
    {
        key = v1.Keys.REMOVE_FROM_GROUP, 
        values = {
            [v1.Languages.EN_US] = "Remove from Group"
        }, 
        comment = "Label for button that allows a user to remove another user from a group conversation."
    }, 
    {
        key = v1.Keys.GENERAL, 
        values = {
            [v1.Languages.EN_US] = "General"
        }, 
        comment = "Labels section of group details screen with general information like group name."
    }, 
    {
        key = v1.Keys.MEMBERS, 
        values = {
            [v1.Languages.EN_US] = "Members"
        }, 
        comment = "Labels section of group details screen that lists participants."
    }, 
    {
        key = v1.Keys.FAILED_TO_RENAME_TITLE, 
        values = {
            [v1.Languages.EN_US] = "Failed to Rename Conversation"
        }, 
        comment = "Informs the user that a conversation could not be renamed."
    }, 
    {
        key = v1.Keys.FAILED_TO_RENAME_MESSAGE, 
        values = {
            [v1.Languages.EN_US] = "The conversation {EXISTING_NAME} could not be renamed to {NEW_NAME}."
        }, 
        comment = "Informs the user that a conversation could not be renamed."
    }, 
    {
        key = v1.Keys.GROUP_NAME_MODERATED, 
        values = {
            [v1.Languages.EN_US] = "The chat group name you entered was moderated"
        }, 
        comment = "Informs the user that the name they tried to give a group was deemed inappropriate and moderated."
    }, 
    {
        key = v1.Keys.FAILED_TO_LEAVE_GROUP, 
        values = {
            [v1.Languages.EN_US] = "Failed to Leave Group"
        }, 
        comment = "Title of message when a user tries to leave a group and the http request fails."
    }, 
    {
        key = v1.Keys.FAILED_TO_LEAVE_GROUP_MESSAGE, 
        values = {
            [v1.Languages.EN_US] = "You could not be removed from the conversation {CONVERSATION_TITLE}."
        }, 
        comment = "Message when a user tries to leave a group and the http request fails."
    }, 
    {
        key = v1.Keys.FAILED_TO_REMOVE_USER, 
        values = {
            [v1.Languages.EN_US] = "Failed to Remove User"
        }, 
        comment = "Title of message when a user tries to remove another user from a group and the http request fails."
    }, 
    {
        key = v1.Keys.FAILED_TO_REMOVE_USER_MESSAGE, 
        values = {
            [v1.Languages.EN_US] = "The user {USERNAME} could not be removed from the conversation {CONVERSATION_TITLE}."
        }, 
        comment = "Title of message when a user tries to remove another user from a group and the http request fails."
    }, 
    {
        key = v1.Keys.TOO_MANY_PEOPLE, 
        values = {
            [v1.Languages.EN_US] = "You can only have up to {MAX_GROUP_SIZE} players in a chat group."
        }, 
        comment = "Informs the user that they can't add any more friends to a conversation."
    }, 
    {
        key = v1.Keys.REMOVED_FROM_CONVERSATION, 
        values = {
            [v1.Languages.EN_US] = "You have been removed from the group."
        }, 
        comment = "Informs the user that they have been removed from a conversation."
    }, 
    {
        key = v1.Keys.NAME_THIS_CHAT_GROUP, 
        values = {
            [v1.Languages.EN_US] = "Name this chat group"
        }, 
        comment = "Placeholder text for input field that allows user to name a new chat group"
    }, 
    {
        key = v1.Keys.SAVE_NEW_GROUP, 
        values = {
            [v1.Languages.EN_US] = "Create"
        }, 
        comment = "Labels button that saves a new chat group."
    }, 
    {
        key = v1.Keys.SAVE_ADDED_FRIENDS, 
        values = {
            [v1.Languages.EN_US] = "Add"
        }, 
        comment = "Labels button that saves changes to chat group when adding new friends."
    }, 
    {
        key = v1.Keys.SEND, 
        values = {
            [v1.Languages.EN_US] = "Send"
        }, 
        comment = "A Send label that is used to send messages"
    }, 
    {
        key = v1.Keys.SENT, 
        values = {
            [v1.Languages.EN_US] = "Sent"
        }, 
        comment = "A Sent label that is used after a message is sent."
    }, 
    {
        key = v1.Keys.SAVE, 
        values = {
            [v1.Languages.EN_US] = "Save"
        }, 
        comment = "Labels button that confirms and saves a change"
    }, 
    {
        key = v1.Keys.REMOVE_USER_CONFIRMATION_MESSAGE, 
        values = {
            [v1.Languages.EN_US] = "Are you sure you want to remove {USERNAME} from this chat group?"
        }, 
        comment = "Message asking user for confirmation before removing another user from a group conversation"
    }, 
    {
        key = v1.Keys.OFFLINE, 
        values = {
            [v1.Languages.EN_US] = "Offline"
        }, 
        comment = "Informs the local user that another user is not signed onto the platform"
    }, 
    {
        key = v1.Keys.ONLINE, 
        values = {
            [v1.Languages.EN_US] = "Online"
        }, 
        comment = "Informs the local user that another user is signed onto the platform"
    }, 
    {
        key = v1.Keys.BY_BUILDER, 
        values = {
            [v1.Languages.EN_US] = "By {USERNAME}"
        }, 
        comment = "Informs that a game is made by a certain builder."
    }, 
    {
        key = v1.Keys.VIEW_ASSET_DETAILS, 
        values = {
            [v1.Languages.EN_US] = "View Details"
        }, 
        comment = "Labels a button that will show the user more information on an asset."
    }, 
    {
        key = v1.Keys.PLAY_GAME, 
        values = {
            [v1.Languages.EN_US] = "Play"
        }, 
        comment = "Labels a button that will send the player into a game."
    }, 
    {
        key = v1.Keys.MY_FEED, 
        values = {
            [v1.Languages.EN_US] = "View My Feed"
        }, 
        comment = "Header on the section of the home page that shows the user's feed"
    }, 
    {
        key = v1.Keys.FRIENDS_COUNT, 
        values = {
            [v1.Languages.EN_US] = "Friends ({COUNT})"
        }, 
        comment = "Header on the section of the home page that shows the user's friends"
    }, 
    {
        key = v1.Keys.SEE_ALL, 
        values = {
            [v1.Languages.EN_US] = "See All"
        }, 
        comment = "Button that goes on carousels of throughout the UI, which allows the user to go to a separate" .. " page which displays the entire list of things that would go in the carousel"
    }, 
    {
        key = v1.Keys.HOME, 
        values = {
            [v1.Languages.EN_US] = "Home"
        }, 
        comment = "Title text for application's home page"
    }, 
    {
        key = v1.Keys.GAMES, 
        values = {
            [v1.Languages.EN_US] = "Games"
        }, 
        comment = "Title text for page that contains a list of games"
    }, 
    {
        key = v1.Keys.CATALOG, 
        values = {
            [v1.Languages.EN_US] = "Catalog"
        }, 
        comment = "Title text for page that contains catalog"
    }, 
    {
        key = v1.Keys.AVATAR, 
        values = {
            [v1.Languages.EN_US] = "Avatar"
        }, 
        comment = "Title text for page that contains avatar editor"
    }, 
    {
        key = v1.Keys.FRIENDS, 
        values = {
            [v1.Languages.EN_US] = "Friends"
        }, 
        comment = "Title text for page that contains friends info"
    }, 
    {
        key = v1.Keys.MORE, 
        values = {
            [v1.Languages.EN_US] = "More"
        }, 
        comment = "Title text for page that contains a list of other pages"
    }
};
for _, v3 in pairs(v1.Content) do
    local v4 = v0[v3.key];
    if v4 then
        for v5, v6 in pairs(v4) do
            v3.values[v5] = v6;
        end;
    end;
end;
return v1;
