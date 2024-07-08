local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.LuaSocialLibrariesDeps);
local v2 = require(l_Parent_0.HttpRequest);
return {
    networkImpl = v2.config({
        requestFunction = v2.requestFunctions.HttpRbxApi
    }), 
    sortFriendsByCorrectedPresenceAndRank = v1.SocialLibraries.config({}).User.sortFriendsByCorrectedPresenceAndRank
};
