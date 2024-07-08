local l_script_FirstAncestor_0 = script:FindFirstAncestor("VerifiedBadges");
local v1 = require(l_script_FirstAncestor_0.Parent.Rodux);
local v2 = require(l_script_FirstAncestor_0.Parent.Cryo);
local v3 = require(l_script_FirstAncestor_0.dependencies);
local l_UsersNetworking_0 = v3.UsersNetworking;
local l_FriendsNetworking_0 = v3.FriendsNetworking;
local v6 = {};
local function v12(v7, v8)
    local v9 = {};
    for _, v11 in ipairs(v8) do
        v9[tostring(v11.id)] = not not v11.hasVerifiedBadge or v2.None;
    end;
    return v2.Dictionary.join(v7, v9);
end;
return v1.createReducer(v6, {
    [l_UsersNetworking_0.GetUserV2FromUserId.Succeeded.name] = function(v13, v14)
        return v12(v13, {
            v14.responseBody
        });
    end, 
    [l_FriendsNetworking_0.GetFriendsFromUserId.Succeeded.name] = function(v15, v16)
        return v12(v15, v16.responseBody.data);
    end, 
    AddGameDetails = function(v17, v18)
        local v19 = {};
        for _, v21 in pairs(v18.gameDetails) do
            local v22 = tostring(v21.creator.id);
            local l_type_0 = v21.creator.type;
            local l_hasVerifiedBadge_0 = v21.creator.hasVerifiedBadge;
            if l_type_0 == Enum.CreatorType.User.Name then
                v19[v22] = not not l_hasVerifiedBadge_0 or v2.None;
            end;
        end;
        return v2.Dictionary.join(v17, v19);
    end, 
    SetAssetInfoFromCatalogItemAction = function(v25, v26)
        if v26.assetData.creatorType ~= Enum.CreatorType.User.Name then
            return v25;
        else
            return v2.Dictionary.join(v25, {
                [tostring(v26.assetData.creatorTargetId)] = not not v26.assetData.creatorHasVerifiedBadge or v2.None
            });
        end;
    end
});
