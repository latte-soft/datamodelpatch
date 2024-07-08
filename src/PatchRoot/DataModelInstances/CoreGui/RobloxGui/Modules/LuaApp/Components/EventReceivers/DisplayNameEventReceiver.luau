local l_CorePackages_0 = game:GetService("CorePackages");
local l_AppStorageService_0 = game:GetService("AppStorageService");
local v2 = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Enum.LocalStorageKey);
local v3 = require(script.Parent.EventNetworking);
local v4 = require(l_CorePackages_0.LuaSocialLibrariesDeps);
local v5 = v4.SocialLibraries.config({});
local v6 = require(l_CorePackages_0.Roact);
local v7 = require(l_CorePackages_0.RoactRodux);
local l_llama_0 = v4.llama;
local l_ReceivedDisplayName_0 = require(l_CorePackages_0.Workspace.Packages.UserLib).Actions.ReceivedDisplayName;
local v10 = v6.Component:extend("DisplayNameEventReceiver");
local v11 = {};
v10.defaultProps = {
    appStorageService = l_AppStorageService_0
};
v10.init = function(v12)
    v12.tokens = {
        v12.props.RobloxEventReceiver:observeEvent("DisplayNameNotifications", function(v13)
            local l_UserId_0 = v13.UserId;
            local l_NewDisplayName_0 = v13.NewDisplayName;
            v12.props.appStorageService:SetItem(v2.DisplayName, l_NewDisplayName_0);
            v12.props.appStorageService:Flush();
            v12.props.receivedDisplayName(l_UserId_0, l_NewDisplayName_0);
            local v16 = v12.props.users[tostring(l_UserId_0)];
            if v16 then
                v12.props.userUpdated(l_llama_0.Dictionary.join(v16, {
                    displayName = l_NewDisplayName_0
                }));
            end;
        end)
    };
end;
v10.render = function(_)
    return nil;
end;
v10.willUnmount = function(v18)
    for _, v20 in pairs(v18.tokens) do
        v20:disconnect();
    end;
end;
return v7.connect(function(v21)
    return {
        localUserId = v21.LocalUserId, 
        users = v5.Dictionary.getDeepValue(v21, "FriendsCarousel.Users.byUserId") or v11
    };
end, function(v22)
    return {
        receivedDisplayName = function(v23, v24)
            v22(l_ReceivedDisplayName_0(v23, v24));
        end, 
        userUpdated = function(v25)
            return v22(v3.RoduxUsers.Actions.UserUpdated(v25));
        end
    };
end)(v10);
