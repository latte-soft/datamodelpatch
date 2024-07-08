local l_script_FirstAncestor_0 = script:FindFirstAncestor("GraphQLServer");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_GraphQLError_0 = require(l_script_FirstAncestor_0.Parent.GraphQL).GraphQLError;
local _ = require(l_script_FirstAncestor_0.graphql.generatedTypes);
local _ = require(l_Parent_0.LuauPolyfill);
local v5 = require(l_script_FirstAncestor_0.graphql.connectors.FriendsConnector);
local l_getAllFriendsByUserId_0 = v5.getAllFriendsByUserId;
local l_getOnlineFriendsByUserId_0 = v5.getOnlineFriendsByUserId;
local function _(v8)
    if not v8 then
        return "";
    else
        return (tostring(v8));
    end;
end;
return {
    UserPresence = {
        id = function(v10)
            return v10.id;
        end, 
        userPresenceType = function(v11)
            return v11.userPresence.UserPresenceType;
        end, 
        gameId = function(v12)
            local l_gameInstanceId_0 = v12.userPresence.gameInstanceId;
            if not l_gameInstanceId_0 then
                return "";
            else
                return (tostring(l_gameInstanceId_0));
            end;
        end, 
        placeId = function(v14)
            local l_placeId_0 = v14.userPresence.placeId;
            if not l_placeId_0 then
                return "";
            else
                return (tostring(l_placeId_0));
            end;
        end, 
        rootPlaceId = function(v16)
            local l_rootPlaceId_0 = v16.userPresence.rootPlaceId;
            if not l_rootPlaceId_0 then
                return "";
            else
                return (tostring(l_rootPlaceId_0));
            end;
        end, 
        universeId = function(v18)
            local l_universeId_0 = v18.userPresence.universeId;
            if not l_universeId_0 then
                return "";
            else
                return (tostring(l_universeId_0));
            end;
        end, 
        lastLocation = function(v20)
            return v20.userPresence.lastLocation;
        end, 
        lastOnline = function(v21)
            return v21.userPresence.lastOnline;
        end
    }, 
    Friend = {
        targetUserId = function(_, _, _, v25)
            return v25.variableValues.userId;
        end, 
        displayName = function()
            return l_GraphQLError_0.new("The displayName field is being deprecated, please use UserProfile to retrieve names");
        end, 
        presence = function(v26)
            return v26;
        end
    }, 
    AllFriendsPage = {
        targetUserId = function(_, _, _, v30)
            return v30.variableValues.userId;
        end, 
        curCursor = function(_, _, _, v34)
            return v34.variableValues.pageCursor or "";
        end, 
        nextCursor = function(v35)
            return v35.NextCursor or "";
        end, 
        prevCursor = function(v36)
            return v36.PreviousCursor or "";
        end, 
        friends = function(v37)
            return v37.PageItems or {};
        end
    }, 
    Query = {
        allFriendsByUserId = function(_, v39, v40)
            return l_getAllFriendsByUserId_0(v39, v40.fetchImpl);
        end, 
        onlineFriendsByUserId = function(_, v42, v43)
            return l_getOnlineFriendsByUserId_0(v42, v43.fetchImpl);
        end
    }
};
