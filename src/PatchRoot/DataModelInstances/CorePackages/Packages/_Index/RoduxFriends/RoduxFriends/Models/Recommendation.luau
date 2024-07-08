local l_script_FirstAncestor_0 = script:FindFirstAncestor("RoduxFriends");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(script.Parent.mockId);
local _ = require(script.Parent.Parent.roduxFriendsTypes);
local v4 = require(l_Parent_0.llama);
local v5 = require(l_script_FirstAncestor_0.Enums.RecommendationContextType);
local v6 = {};
v6.new = function(v7)
    assert(v6.isValid(v7));
    v6.__index = v6;
    local v8 = {
        id = v7.id, 
        entityId = v7.entityId, 
        rank = v7.rank, 
        contextType = v7.contextType, 
        mutualFriendsList = v7.mutualFriendsList, 
        mutualFriendsCount = v7.mutualFriendsCount, 
        thumbnailEntities = v7.thumbnailEntities, 
        entityDisplayName = v7.entityDisplayName
    };
    setmetatable(v8, v6);
    return v8;
end;
v6.mock = function(v9)
    local v10 = v4.Dictionary.join({
        id = v2(), 
        contextType = v5.MutualFriends
    }, v9);
    return (v6.new({
        id = v10.id, 
        mutualFriendsList = v10.mutualFriendsList, 
        rank = v10.rank or tonumber(v10.id), 
        contextType = v10.contextType, 
        mutualFriendsCount = if not v10.mutualFriendsCount then v10.mutualFriendsList and #v10.mutualFriendsList or 0 else v10.mutualFriendsCount
    }));
end;
v6.isValid = function(v11)
    if v11 then
        if v11.id then
            if v11.rank then
                if v11.contextType and v5.isEnumValue(v11.contextType) then
                    if v11.mutualFriendsList and type(v11.mutualFriendsList) ~= "table" then
                        return false, "mutualFriendList must be a table of strings";
                    elseif v11.mutualFriendsCount and type(v11.mutualFriendsCount) ~= "number" then
                        return false, "mutualFriendsCount must be a number";
                    elseif not (v11.contextType == v5.Contacts) or v11.entityId then
                        return true, "Valid Recommendation";
                    else
                        return false, "entity Id must be given for Contacts recommendation type";
                    end;
                else
                    return false, "Expected contextType to be given";
                end;
            else
                return false, "Expected user's rank to be given";
            end;
        else
            return false, "Expected user's id to be given";
        end;
    else
        return false, "Expected recommendation information to be given";
    end;
end;
v6.isEqual = function(v12, v13)
    local v14 = false;
    if v12.id == v13.id then
        v14 = v4.List.equals(v12.mutualFriendsList, v13.mutualFriendsList);
        if v14 then
            v14 = false;
            if v12.rank == v13.rank then
                v14 = false;
                if v12.contextType == v13.contextType then
                    v14 = v12.mutualFriendsCount == v13.mutualFriendsCount;
                end;
            end;
        end;
    end;
    return v14;
end;
v6.format = function(v15)
    local v16 = if not v15.contextType then v5.None else v5.fromRawValue(v15.contextType) or v5.None;
    return v6.new(v4.Dictionary.join(v15, {
        id = v15.id, 
        entityId = if v15.contactId ~= "" then v15.contactId else nil, 
        contextType = v16, 
        mutualFriendsCount = if not v15.mutualFriendsCount then if v15.mutualFriendsList then #v15.mutualFriendsList else 0 else v15.mutualFriendsCount, 
        contactId = contactId, 
        thumbnailEntities = v15.thumbnailEntities, 
        entityDisplayName = if v16 == v5.Contacts then v15.displayName else nil
    }));
end;
return v6;
