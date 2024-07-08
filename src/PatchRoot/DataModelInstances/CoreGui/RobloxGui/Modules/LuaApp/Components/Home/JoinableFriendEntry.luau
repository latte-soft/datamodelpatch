local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_Modules_0.Common.Roact);
local v3 = require(l_Modules_0.Common.RoactRodux);
local l_withStyle_0 = require(l_CorePackages_0.UIBlox).Style.withStyle;
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local l_RoactAnalyticsCommonGameEvents_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).RoactAnalyticsCommonGameEvents;
local v7 = require(l_Modules_0.LuaApp.Services.RoactLocalization);
local l_RoactAppPolicy_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy;
local v9 = require(l_Modules_0.LuaApp.Constants);
local v10 = require(l_Modules_0.LuaApp.withLocalization);
local v11 = require(l_Modules_0.LuaApp.Components.FitImageTextButton);
local v12 = require(l_Modules_0.LuaApp.Models.User);
local l_FriendIcon_0 = require(l_CorePackages_0.Workspace.Packages.GameTile).FriendIcon;
local v14 = require(l_Modules_0.LuaApp.Util.joinGame);
local v15 = require(l_Modules_0.LuaApp.Flags.GetFFlagLuaAppUseWithLocalization);
local l_SourceSans_0 = Enum.Font.SourceSans;
local l_AvatarSize_0 = v9.PlacesList.ContextualMenu.AvatarSize;
local l_HorizontalInnerPadding_0 = v9.PlacesList.ContextualMenu.HorizontalInnerPadding;
local l_HorizontalOuterPadding_0 = v9.PlacesList.ContextualMenu.HorizontalOuterPadding;
local v20 = (l_HorizontalOuterPadding_0 + l_AvatarSize_0) + l_HorizontalInnerPadding_0;
local v21 = v2.PureComponent:extend("JoinableFriendEntry");
v21.defaultProps = {
    layoutOrder = 0
};
v21.init = function(v22)
    v22.state = {
        joinButtonWidth = 60
    };
    v22.joinButtonRef = v2.createRef();
    v22.onJoinButtonActivated = function()
        local l_analytics_0 = v22.props.analytics;
        local l_upToDateUser_0 = v22.props.upToDateUser;
        local l_universePlaceInfo_0 = v22.props.universePlaceInfo;
        local l_placeId_0 = l_universePlaceInfo_0.placeId;
        local l_universeRootPlaceId_0 = l_universePlaceInfo_0.universeRootPlaceId;
        v14:ByUser(l_upToDateUser_0, v9.AnalyticsContext.GamePlayIntentInPlacesList, function(v28)
            l_analytics_0.reportJoinGameInPlacesList(l_upToDateUser_0.id, l_placeId_0, l_universeRootPlaceId_0, l_upToDateUser_0.gameInstanceId, v28);
        end);
    end;
    v22.updateJoinButtonWidth = function()
        local l_current_0 = v22.joinButtonRef.current;
        if l_current_0 then
            v22:setState({
                joinButtonWidth = l_current_0.AbsoluteSize.X
            });
        end;
    end;
end;
v21.didMount = function(v30)
    v30.updateJoinButtonWidth();
end;
v21.render = function(v31)
    local l_user_0 = v31.props.user;
    local l_upToDateUser_1 = v31.props.upToDateUser;
    local l_layoutOrder_0 = v31.props.layoutOrder;
    local l_entryHeight_0 = v31.props.entryHeight;
    local l_entryWidth_0 = v31.props.entryWidth;
    local l_universeId_0 = v31.props.universeId;
    local l_localization_0 = v31.props.localization;
    local l_universePlaceInfo_1 = v31.props.universePlaceInfo;
    local l_joinButtonWidth_0 = v31.state.joinButtonWidth;
    local v41 = nil;
    local v42 = not not l_universePlaceInfo_1 and (l_universePlaceInfo_1.isPlayable or false);
    v41 = not l_entryWidth_0 and 60 or math.max((l_entryWidth_0 - l_HorizontalInnerPadding_0) / 2 - l_HorizontalInnerPadding_0, 60);
    local v43 = ((l_HorizontalOuterPadding_0 * 2 + l_AvatarSize_0) + l_HorizontalInnerPadding_0 * 2) + l_joinButtonWidth_0;
    local function v59(v44, v45)
        local v46 = nil;
        local l_GREEN_PRIMARY_0 = v9.Color.GREEN_PRIMARY;
        local v48 = 0;
        local l_WHITE_0 = v9.Color.WHITE;
        local v50 = 0;
        local l_l_SourceSans_0_0 = l_SourceSans_0;
        local l_l_SourceSans_0_1 = l_SourceSans_0;
        local l_BLACK_0 = v9.Color.BLACK;
        local v54 = 0;
        local v55 = 22;
        local l_WHITE_1 = v9.Color.WHITE;
        local v57 = 0;
        local l_name_0 = l_user_0.name;
        if v31.props.enableDisplayNamePolicy then
            l_name_0 = l_user_0.displayName;
        end;
        if v44 then
            l_GREEN_PRIMARY_0 = v44.Theme.ContextualPrimaryDefault.Color;
            v48 = v44.Theme.ContextualPrimaryDefault.Transparency;
            l_WHITE_0 = v44.Theme.ContextualPrimaryContent.Color;
            v50 = v44.Theme.ContextualPrimaryContent.Transparency;
            l_l_SourceSans_0_0 = v44.Font.Header2.Font;
            l_l_SourceSans_0_1 = v44.Font.Body.Font;
            l_BLACK_0 = v44.Theme.TextDefault.Color;
            v54 = v44.Theme.TextDefault.Transparency;
            v55 = v44.Font.BaseSize * v44.Font.Body.RelativeSize;
            l_WHITE_1 = v44.Theme.BackgroundUIDefault.Color;
            v57 = v44.Theme.BackgroundUIDefault.Transparency;
        end;
        if not (l_upToDateUser_1.presence == v12.PresenceType.IN_GAME and tostring(l_upToDateUser_1.universeId) == tostring(l_universeId_0)) or not v42 then
            v46 = nil;
            if not v44 then
                l_GREEN_PRIMARY_0 = v9.Color.GREEN_DISABLED;
            else
                v48 = v48 * 0.5;
                v50 = v50 * 0.5;
            end;
        else
            v46 = v31.onJoinButtonActivated;
        end;
        return v2.createElement("Frame", {
            Size = UDim2.new(0, l_entryWidth_0, 0, l_entryHeight_0), 
            BackgroundColor3 = l_WHITE_1, 
            BackgroundTransparency = v57, 
            BorderSizePixel = 0, 
            LayoutOrder = l_layoutOrder_0
        }, {
            AvatarHolder = v2.createElement("Frame", {
                Size = UDim2.new(0, l_AvatarSize_0, 0, l_AvatarSize_0), 
                AnchorPoint = Vector2.new(0, 0.5), 
                Position = UDim2.new(0, l_HorizontalOuterPadding_0, 0.5, 0), 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0
            }, {
                Avatar = v2.createElement(l_FriendIcon_0, {
                    user = l_upToDateUser_1, 
                    itemSize = l_AvatarSize_0, 
                    layoutOrder = 1, 
                    maskColor = l_WHITE_1
                })
            }), 
            Username = v2.createElement("Frame", {
                Size = UDim2.new(1, -v43, 1, 0), 
                BorderSizePixel = 0, 
                BackgroundTransparency = 1, 
                AnchorPoint = Vector2.new(0, 0.5), 
                Position = UDim2.new(0, v20, 0.5, 0)
            }, {
                Text = v2.createElement("TextLabel", {
                    BackgroundTransparency = 1, 
                    BorderSizePixel = 0, 
                    Size = UDim2.new(1, 0, 1, 0), 
                    Text = l_name_0, 
                    TextSize = v55, 
                    Font = l_l_SourceSans_0_1, 
                    TextColor3 = l_BLACK_0, 
                    TextTransparency = v54, 
                    TextTruncate = Enum.TextTruncate.AtEnd, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    TextYAlignment = Enum.TextYAlignment.Center
                })
            }), 
            JoinButton = v2.createElement(v11, {
                backgroundColor = l_GREEN_PRIMARY_0, 
                backgroundTransparency = v48, 
                backgroundImage = "LuaApp/9-slice/input-default", 
                leftIconEnabled = false, 
                height = 32, 
                minWidth = 60, 
                maxWidth = v41, 
                text = v45.joinText, 
                textFont = l_l_SourceSans_0_0, 
                textColor = l_WHITE_0, 
                textTransparency = v50, 
                anchorPoint = Vector2.new(1, 0.5), 
                position = UDim2.new(1, -l_HorizontalOuterPadding_0, 0.5, 0), 
                onActivated = v46, 
                [v2.Ref] = v31.joinButtonRef, 
                [v2.Change.AbsoluteSize] = v31.updateJoinButtonWidth
            })
        });
    end;
    local function v62(v60)
        return l_withStyle_0(function(v61)
            return v59(v61, v60);
        end);
    end;
    if not v15() then
        return v62({
            joinText = l_localization_0:Format("Feature.Chat.Drawer.Join")
        });
    else
        return v10({
            joinText = "Feature.Chat.Drawer.Join"
        })(v62);
    end;
end;
return (l_RoactAppPolicy_0.connect(function(v63, _)
    return {
        enableDisplayNamePolicy = v63.getShowDisplayName()
    };
end)((l_RoactServices_0.connect({
    analytics = l_RoactAnalyticsCommonGameEvents_0, 
    localization = v7
})((v3.connect(function(v65, v66)
    return {
        upToDateUser = v65.Users[v66.user.id], 
        universePlaceInfo = v65.UniversePlaceInfos[v66.universeId]
    };
end)(v21))))));
