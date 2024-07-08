local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.dependencies);
local l_Images_0 = v1.UIBlox.App.ImageSet.Images;
local l_Dash_0 = v1.Dash;
local v4 = require(l_Parent_0.Common.ProfileTypes);
local l_GetFFlagLuafiedReportEntryPoints_0 = v1.GetFFlagLuafiedReportEntryPoints;
local v6 = require(l_Parent_0.Common.ContextualMenuRowsEnums);
local function v10(v7)
    return not l_Dash_0.find(v7, function(_, v9)
        return not v6.isEnumValue(v9);
    end);
end;
local v13 = {
    {
        name = v6.CHAT, 
        props = {
            icon = l_Images_0["icons/menu/chat_off"]
        }, 
        showToast = false, 
        validator = function(v11)
            local v12 = false;
            if v11.friendStatus == Enum.FriendStatus.Friend then
                v12 = v11.isInExperience;
            end;
            return v12;
        end
    }
};
table.insert(v13, {
    name = v6.SET_ALIAS, 
    props = {
        icon = l_Images_0["icons/actions/edit/edit"]
    }, 
    showToast = false, 
    validator = function(v14)
        return v14.friendStatus == Enum.FriendStatus.Friend;
    end
});
table.insert(v13, {
    name = v6.IGNORE_FRIEND_REQUEST, 
    props = {
        icon = l_Images_0["icons/actions/reject"]
    }, 
    showToast = true, 
    validator = function(v15)
        local v16 = true;
        if v15.friendStatus ~= Enum.FriendStatus.FriendRequestReceived then
            v16 = v15.profileType == v4.OffNetworkFriendRequest;
        end;
        return v16;
    end
});
table.insert(v13, {
    name = v6.REPORT, 
    props = {
        icon = l_Images_0["icons/actions/feedback"]
    }, 
    showToast = false, 
    validator = function(v17)
        if not v17.disableWebViewSupport or l_GetFFlagLuafiedReportEntryPoints_0() then
            return true;
        else
            return false;
        end;
    end
});
table.insert(v13, {
    name = v6.BLOCK, 
    props = {
        icon = l_Images_0["icons/actions/block"]
    }, 
    showToast = true, 
    validator = function(v18)
        return not v18.isBlocked;
    end
});
table.insert(v13, {
    name = v6.UNFRIEND, 
    props = {
        icon = l_Images_0["icons/actions/friends/friendRemove"]
    }, 
    showToast = true, 
    validator = function(v19)
        return v19.friendStatus == Enum.FriendStatus.Friend;
    end
});
return {
    contextualMenuSettings = v13, 
    validateRowActions = v10
};
