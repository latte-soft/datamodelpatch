local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Rodux);
local v2 = require(l_CorePackages_0.Cryo);
local l_Actions_0 = script.Parent.Parent.Actions;
return (v1.createReducer({}, {
    [require(l_Actions_0.AddPlayer).name] = function(v4, v5)
        local l_join_0 = v2.Dictionary.join;
        local l_v4_0 = v4;
        local v8 = {};
        local l_userId_0 = v5.userId;
        local v10 = {};
        local v11 = false;
        if game.CreatorType == Enum.CreatorType.User then
            v11 = v5.userId == game.CreatorId;
        end;
        v10.isPlaceOwner = v11;
        v10.avatarIcon = nil;
        v10.specialGroupIcon = nil;
        v8[l_userId_0] = v10;
        return l_join_0(l_v4_0, v8);
    end, 
    [require(l_Actions_0.RemovePlayer).name] = function(v12, v13)
        return v2.Dictionary.join(v12, {
            [v13.userId] = v2.None
        });
    end, 
    [require(l_Actions_0.SetPlayerAvatarIcon).name] = function(v14, v15)
        return v2.Dictionary.join(v14, {
            [v15.userId] = {
                isPlaceOwner = v14[v15.userId].isPlaceOwner, 
                avatarIcon = v15.avatarIcon, 
                specialGroupIcon = v14[v15.userId].specialGroupIcon
            }
        });
    end, 
    [require(l_Actions_0.SetPlayerIsCreator).name] = function(v16, v17)
        return v2.Dictionary.join(v16, {
            [v17.userId] = {
                isPlaceOwner = v17.isCreator, 
                avatarIcon = v16[v17.userId].avatarIcon, 
                specialGroupIcon = v16[v17.userId].specialGroupIcon
            }
        });
    end, 
    [require(l_Actions_0.SetPlayerSpecialGroupIcon).name] = function(v18, v19)
        return v2.Dictionary.join(v18, {
            [v19.userId] = {
                isPlaceOwner = v18[v19.userId].isPlaceOwner, 
                avatarIcon = v18[v19.userId].avatarIcon, 
                specialGroupIcon = v19.specialGroupIcon
            }
        });
    end
}));
