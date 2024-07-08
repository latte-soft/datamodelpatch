local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_HttpRbxApiService_0 = game:GetService("HttpRbxApiService");
local l_Players_0 = game:GetService("Players");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local l_ShareGame_0 = l_Modules_0.Settings.Pages.ShareGame;
local v6 = require(l_CorePackages_0.Roact);
local v7 = require(l_CorePackages_0.RoactRodux);
local v8 = require(l_Modules_0.Common.httpRequest);
local v9 = require(l_ShareGame_0.Components.ShareGamePageFrame);
local v10 = require(l_ShareGame_0.Constants);
local v11 = require(l_ShareGame_0.Thunks.FetchUserFriends);
local v12 = require(l_ShareGame_0.Actions.ClosePage);
local v13 = v6.PureComponent:extend("ShareGameContainer");
v13.defaultProps = {
    skeletonComponent = v9
};
v13.init = function(v14)
    v14.props.reFetch();
end;
v13.render = function(v15)
    return v6.createElement(v15.props.skeletonComponent, v15.props);
end;
return (v7.UNSTABLE_connect2(function(v16, _)
    return {
        deviceLayout = v16.DeviceInfo.DeviceLayout, 
        searchAreaActive = v16.ConversationsSearch.SearchAreaActive, 
        searchText = v16.ConversationsSearch.SearchText
    };
end, function(v18)
    return {
        closePage = function()
            v18(v12(v10.PageRoute.SHARE_GAME));
        end, 
        reFetch = function()
            v18(v11(v8(l_HttpRbxApiService_0), (tostring(l_Players_0.LocalPlayer.UserId))));
        end
    };
end)(v13));
