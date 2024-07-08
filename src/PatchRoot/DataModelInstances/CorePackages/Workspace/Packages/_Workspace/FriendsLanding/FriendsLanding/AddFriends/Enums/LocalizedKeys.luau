return require(script:FindFirstAncestor("AddFriends").dependencies).enumerate(script.Name, {
    AddFriend = "Feature.Friends.Action.Add", 
    RequestPending = "Feature.Friends.Label.Pending"
});
