local l_script_FirstAncestor_0 = script:FindFirstAncestor("GameInvite");
local l_Components_0 = l_script_FirstAncestor_0.Components;
local l_Context_0 = l_script_FirstAncestor_0.Context;
local v3 = require(l_script_FirstAncestor_0.Parent.React);
local v4 = require(l_Context_0.GameInviteContextProvider);
local v5 = require(l_Components_0.GameInviteContent);
local _ = require(l_script_FirstAncestor_0.gameInviteModalType);
return function(v7)
    return v3.createElement(v4, {
        options = v7.options, 
        serverType = v7.serverType, 
        gameDetails = v7.gameDetails, 
        isLoadingCustomParams = v7.isLoading, 
        isCoreScript = v7.isCoreScript
    }, {
        GameInviteContent = v3.createElement(v5, {
            isLoadingCustomParams = v7.isLoading
        })
    });
end;
