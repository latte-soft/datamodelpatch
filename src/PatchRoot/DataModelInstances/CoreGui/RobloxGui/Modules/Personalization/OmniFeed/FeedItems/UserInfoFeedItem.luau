local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(l_CorePackages_0.RoactRodux);
local v4 = require(l_CorePackages_0.Packages.t);
local v5 = require(l_Modules_0.LuaApp.Promise);
local v6 = require(l_Modules_0.LuaApp.Constants);
local v7 = require(l_Modules_0.LuaApp.Thunks.SetNetworkingErrorToast);
local l_FormFactor_0 = require(l_CorePackages_0.Workspace.Packages.FormFactor).Enums.FormFactor;
local v9 = require(l_Modules_0.LuaApp.Components.Home.HomeUserInfoWidget);
local v10 = require(l_Modules_0.Common.memoize);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v12 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local v13 = require(l_Modules_0.Personalization.OmniFeed.OmniFeedProps);
local l_PreloadUsersThumbnail_0 = require(l_CorePackages_0.Workspace.Packages.UserLib).Thunks.PreloadUsersThumbnail;
local l_AvatarThumbnailRequests_0 = require(l_CorePackages_0.Workspace.Packages.UserLib).Utils.AvatarThumbnailRequests;
local l_GAME_CAROUSEL_SIDE_COMPACT_PADDING_0 = v6.GAME_CAROUSEL_SIDE_COMPACT_PADDING;
local l_GAME_CAROUSEL_SIDE_WIDE_PADDING_0 = v6.GAME_CAROUSEL_SIDE_WIDE_PADDING;
local v18 = v2.PureComponent:extend("UserInfoFeedItem");
v18.validateProps = v4.strictInterface({
    [v13.key] = v13.interface, 
    formFactor = v4.string, 
    localUserModel = v4.optional(v4.table), 
    refresh = v4.callback, 
    networking = v4.any
});
v18.init = function(v19)
    v19.isMounted = false;
    v19.refreshSignalConnection = v19.props[v13.key].refreshSignal:connect(function()
        if v19.isMounted then
            v19.props.refresh(v19.props.networking, v19.props.localUserModel);
        end;
    end);
end;
v18.didMount = function(v20)
    v20.isMounted = true;
end;
v18.render = function(v21)
    local l_formFactor_0 = v21.props.formFactor;
    local _ = nil;
    return v2.createElement(v9, {
        sideMargin = if l_formFactor_0 == l_FormFactor_0.COMPACT then l_GAME_CAROUSEL_SIDE_COMPACT_PADDING_0 else l_GAME_CAROUSEL_SIDE_WIDE_PADDING_0
    });
end;
v18.willUnmount = function(v24)
    v24.isMounted = false;
    if v24.refreshSignalConnection then
        v24.refreshSignalConnection:disconnect();
        v24.refreshSignalConnection = nil;
    end;
end;
local v27 = v10(function(v25, v26)
    return v25[v26];
end);
return (l_RoactServices_0.connect({
    networking = v12
})((v3.connect(function(v28, _)
    return {
        formFactor = v28.FormFactor, 
        localUserModel = v27(v28.Users, v28.LocalUserId)
    };
end, function(v30)
    return {
        refresh = function(_, v32)
            return v5.all({
                (v30(l_PreloadUsersThumbnail_0({
                    v32.id
                }, l_AvatarThumbnailRequests_0.HOME_HEADER_USER)))
            }):andThen(function(v33)
                return v5.resolve(v33);
            end, function(v34)
                v30(v7(v34));
                return v5.reject(v34);
            end);
        end
    };
end)(v18))));
