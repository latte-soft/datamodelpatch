local l_Parent_0 = script:FindFirstAncestor("SocialCommon").Parent;
local v1 = require(l_Parent_0.SharedFlags);
local l_getFFlagEnableNewChatTabExperiment_0 = v1.getFFlagEnableNewChatTabExperiment;
local l_getFStringNewChatTabExperimentLayerValue_0 = v1.getFStringNewChatTabExperimentLayerValue;
local l_getFStringNewChatTabExperimentationLayer_0 = v1.getFStringNewChatTabExperimentationLayer;
local l_getFStringNewChatTabExperimentAddFriendsLayerValue_0 = v1.getFStringNewChatTabExperimentAddFriendsLayerValue;
local l_getFStringNewChatTabExperimentAddFriendsNilStateLayerValue_0 = v1.getFStringNewChatTabExperimentAddFriendsNilStateLayerValue;
local l_IXPServiceWrapper_0 = require(l_Parent_0.IxpServiceWrapper).IXPServiceWrapper;
local v8 = require(l_Parent_0.Loggers).Logger:new(script.Name);
local v9 = {};
v9.__index = v9;
v9.new = function()
    local v10 = {
        _isInitialized = false, 
        _showNewChatTab = false, 
        _showAddFriendsOnHomePageUtilityTray = false, 
        _showAddFriendsOnChatTabNilState = false
    };
    setmetatable(v10, v9);
    return v10;
end;
v9.initialize = function(v11, v12)
    local v13 = v12.default:getLayerVariables(l_getFStringNewChatTabExperimentationLayer_0());
    if v13 ~= nil then
        v8:debug("NewChatTabExperimentation.initialize cache ready");
        local v14 = v13[l_getFStringNewChatTabExperimentLayerValue_0()];
        local v15 = v13[l_getFStringNewChatTabExperimentAddFriendsLayerValue_0()];
        local v16 = v13[l_getFStringNewChatTabExperimentAddFriendsNilStateLayerValue_0()];
        if v14 then
            v11._showNewChatTab = v14;
        end;
        if v15 then
            v11._showAddFriendsOnHomePageUtilityTray = v15;
        end;
        if v16 then
            v11._showAddFriendsOnChatTabNilState = v16;
        end;
        v8:debug((("NewChatTabExperimentation.initialize showNewChatTab %* showAddFriendsOnHomePageUtilityTray %*"):format(v14, v15)));
        l_IXPServiceWrapper_0:LogUserLayerExposure(l_getFStringNewChatTabExperimentationLayer_0());
    else
        v8:debug("NewChatTabExperimentation.initialize cache not ready");
    end;
    v11._isInitialized = true;
end;
v9.isEnabled = function()
    return l_getFFlagEnableNewChatTabExperiment_0();
end;
v9.getConnectTabLeadsToChatTab = function(v17)
    return v17._showNewChatTab;
end;
v9.getShowAddFriendsOnHomePageUtilityTray = function(v18)
    return v18._showAddFriendsOnHomePageUtilityTray;
end;
v9.getShowAddFriendsOnChatTabNilState = function(v19)
    return v19._showAddFriendsOnChatTabNilState;
end;
v9.default = v9.new();
return v9;
