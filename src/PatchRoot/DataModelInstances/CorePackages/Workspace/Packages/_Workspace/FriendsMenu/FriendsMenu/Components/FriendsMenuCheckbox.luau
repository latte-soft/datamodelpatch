local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsMenu");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_Context_0 = l_script_FirstAncestor_0.Context;
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.UIBlox);
local l_dependencyArray_0 = require(l_Parent_0.RoactUtils).Hooks.dependencyArray;
local _ = require(l_script_FirstAncestor_0.friendsMenuModalType);
local v7 = require(l_Context_0.SelectedUsersContext);
local l_Checkbox_0 = v4.App.InputButton.Checkbox;
return function(v9)
    local v10 = v3.useContext(v7);
    return v3.createElement("Frame", {
        Size = v9.size, 
        AnchorPoint = v9.anchorPoint, 
        Position = v9.position, 
        BackgroundTransparency = 1
    }, {
        CheckboxAlignment = v3.createElement("UIListLayout", {
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            VerticalAlignment = Enum.VerticalAlignment.Center
        }), 
        Button = v3.createElement(l_Checkbox_0, {
            onActivated = v3.useCallback(function()
                if not v10.isFriendSelected(v9.friend.id) then
                    v10.addFriend(v9.friend.id, v9.friend.displayName);
                    return ;
                else
                    v10.removeFriend(v9.friend.id);
                    return ;
                end;
            end, l_dependencyArray_0(v10.isFriendSelected(v9.friend.id), v10.removeFriend, v10.addFriend, v9.friend.id)), 
            isSelected = v10.isFriendSelected(v9.friend.id), 
            text = ""
        })
    });
end;
