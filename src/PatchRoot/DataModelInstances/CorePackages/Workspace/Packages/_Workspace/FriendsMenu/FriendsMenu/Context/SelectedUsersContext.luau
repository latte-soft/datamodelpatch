return (require(script.Parent.Parent.Parent.React).createContext({
    selectedFriendsSize = 0, 
    selectedFriends = {}, 
    addFriend = function()
    end, 
    removeFriend = function()
    end, 
    isFriendSelected = function()
        return false;
    end
}));
