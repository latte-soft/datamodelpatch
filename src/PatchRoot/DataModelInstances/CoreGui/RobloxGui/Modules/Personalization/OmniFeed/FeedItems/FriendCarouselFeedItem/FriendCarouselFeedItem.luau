local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(l_CorePackages_0.RoactRodux);
local v4 = require(l_CorePackages_0.Packages.t);
local v5 = require(l_CorePackages_0.Cryo);
local l_RoactAppPolicy_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy;
local v7 = require(l_Modules_0.LuaApp.Promise);
local v8 = require(l_Modules_0.LuaApp.Constants);
local v9 = require(l_Modules_0.LuaApp.Thunks.SetNetworkingErrorToast);
local l_FormFactor_0 = require(l_CorePackages_0.Workspace.Packages.FormFactor).Enums.FormFactor;
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v12 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local l_FetchFriendsCarousel_0 = require(l_Modules_0.LuaApp.Components.FriendsCarousel.api).FetchFriendsCarousel;
local v14 = require(l_Modules_0.LuaApp.Thunks.LegacyUpdateUsers);
local v15 = require(l_Modules_0.LuaApp.Thunks.FetchAdditionalFriendsInfo);
local v16 = require(l_Modules_0.Personalization.OmniFeed.OmniFeedProps);
local l_useUiModeInfo_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppHooks).useUiModeInfo;
local l_UiMode_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).UiMode;
local v19 = require(script.Parent.FriendGridRow);
local v20 = require(script.Parent.HomeFriendCarousel);
local l_getFFlagUpdateFriendCarousel10ft_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).getFFlagUpdateFriendCarousel10ft;
local l_FFlagFriendsCarouselPassRefreshSignalDown_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagFriendsCarouselPassRefreshSignalDown;
local l_GAME_CAROUSEL_SIDE_COMPACT_PADDING_0 = v8.GAME_CAROUSEL_SIDE_COMPACT_PADDING;
local l_GAME_CAROUSEL_SIDE_WIDE_PADDING_0 = v8.GAME_CAROUSEL_SIDE_WIDE_PADDING;
local v25 = v2.PureComponent:extend("FriendCarouselFeedItem");
v25.validateProps = v4.strictInterface({
    [v16.key] = v16.interface, 
    formFactor = v4.string, 
    refresh = v4.callback, 
    useGridPageLayout = v4.optional(v4.boolean), 
    networking = v4.any, 
    uiModeInfo = if not l_getFFlagUpdateFriendCarousel10ft_0() then nil else v4.any
});
v25.init = function(v26)
    v26.isMounted = false;
    v26.refreshSignalConnection = v26.props[v16.key].refreshSignal:connect(function()
        if v26.isMounted then
            v26.props.refresh(v26.props.networking);
        end;
    end);
end;
v25.didMount = function(v27)
    v27.isMounted = true;
end;
v25.render = function(v28)
    if not l_getFFlagUpdateFriendCarousel10ft_0() then
        local l_formFactor_0 = v28.props.formFactor;
        local v30 = nil;
        v30 = if l_formFactor_0 == l_FormFactor_0.COMPACT then l_GAME_CAROUSEL_SIDE_COMPACT_PADDING_0 else l_GAME_CAROUSEL_SIDE_WIDE_PADDING_0;
        if not v28.props.useGridPageLayout then
            return v2.createElement(v20, {
                sideMargin = v30, 
                refreshSignal = if not l_FFlagFriendsCarouselPassRefreshSignalDown_0 then nil else v28.props[v16.key].refreshSignal
            });
        else
            return v2.createElement(v19, {
                sortIndex = v28.props[v16.key].feedItemPosition
            });
        end;
    elseif v28.props.uiModeInfo.uiMode ~= l_UiMode_0.TenFoot and v28.props.useGridPageLayout then
        return v2.createElement(v19, {
            sortIndex = v28.props[v16.key].feedItemPosition
        });
    else
        return v2.createElement(v20, {
            refreshSignal = if not l_FFlagFriendsCarouselPassRefreshSignalDown_0 then nil else v28.props[v16.key].refreshSignal
        });
    end;
end;
v25.willUnmount = function(v31)
    v31.isMounted = false;
    if v31.refreshSignalConnection then
        v31.refreshSignalConnection:disconnect();
        v31.refreshSignalConnection = nil;
    end;
end;
v25 = l_RoactServices_0.connect({
    networking = v12
})((l_RoactAppPolicy_0.connect(function(v32, _)
    return {
        useGridPageLayout = v32.useGridPageLayout()
    };
end)((v3.connect(function(v34, _)
    return {
        formFactor = v34.FormFactor
    };
end, function(v36)
    return {
        refresh = function(v37)
            local v38 = {};
            table.insert(v38, v36(l_FetchFriendsCarousel_0({
                refresh = true
            })):andThen(function(v39)
                v36(v14(v39));
                v36(v15(v37, v39));
            end));
            return v7.all(v38):andThen(function(v40)
                return v7.resolve(v40);
            end, function(v41)
                v36(v9(v41));
                return v7.reject(v41);
            end);
        end
    };
end)(v25)))));
if not l_getFFlagUpdateFriendCarousel10ft_0() then
    return v25;
else
    return function(v42)
        return v2.createElement(v25, (v5.Dictionary.join(v42, {
            uiModeInfo = l_useUiModeInfo_0()
        })));
    end;
end;
