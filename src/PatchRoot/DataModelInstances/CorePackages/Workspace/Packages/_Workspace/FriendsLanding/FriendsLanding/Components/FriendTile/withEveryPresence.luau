local v0 = require(script:FindFirstAncestor("FriendsLanding").dependencies);
local v1 = require(script.Parent);
local l_Roact_0 = v0.Roact;
local l_llama_0 = v0.llama;
local v4 = require(script.Parent.friendsWithPresence);
return function(v5)
    return l_Roact_0.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1
    }, {
        frame = l_Roact_0.createElement("Frame", {
            Size = UDim2.new(0, 150, 0, 0), 
            BackgroundTransparency = 1
        }, {
            layout = l_Roact_0.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                FillDirection = Enum.FillDirection.Horizontal, 
                Padding = UDim.new(0, 6)
            }), 
            OnlineFriend = l_Roact_0.createElement(v1, l_llama_0.Dictionary.join(v5, {
                user = v4.OnlineFriend
            })), 
            DeletedFriend = l_Roact_0.createElement(v1, l_llama_0.Dictionary.join(v5, {
                user = v4.DeletedFriend
            })), 
            OfflineFriend = l_Roact_0.createElement(v1, l_llama_0.Dictionary.join(v5, {
                user = v4.OfflineFriend
            })), 
            InGameFriend = l_Roact_0.createElement(v1, l_llama_0.Dictionary.join(v5, {
                user = v4.InGameFriend
            })), 
            InGameWithoutLastLocationFriend = l_Roact_0.createElement(v1, l_llama_0.Dictionary.join(v5, {
                user = v4.InGameWithoutLastLocationFriend
            })), 
            InStudioFriend = l_Roact_0.createElement(v1, l_llama_0.Dictionary.join(v5, {
                user = v4.InStudioFriend
            })), 
            InStudioWithoutLastLocationFriend = l_Roact_0.createElement(v1, l_llama_0.Dictionary.join(v5, {
                user = v4.InStudioWithoutLastLocationFriend
            }))
        })
    });
end;
