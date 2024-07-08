local v0 = require(script.Parent.GetFFlagEnableCommonFriendsMenu);
game:DefineFastFlag("EnableFriendMenuMultiSelectDev", false);
return function()
    return game:GetFastFlag("EnableFriendMenuMultiSelectDev") and v0();
end;
