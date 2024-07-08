local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.UIBlox);
local l_ExperienceTileV3_0 = v3.App.Tile.ExperienceTileV3;
local l_Images_0 = v3.App.ImageSet.Images;
local l_ImageSetLabel_0 = v3.Core.ImageSet.ImageSetLabel;
local v7 = require(l_Modules_0.LuaApp.Constants);
local v8 = require(l_Modules_0.LuaApp.getCurrentPage);
local l_AspectRatioModeEnum_0 = v3.App.Tile.AspectRatioModeEnum;
local l_StyledTextLabel_0 = v3.App.Text.StyledTextLabel;
local l_Button_0 = v3.App.Button.Button;
local l_ButtonType_0 = v3.App.Button.Enum.ButtonType;
local l_useStyle_0 = v3.Core.Style.useStyle;
local l_LoadableImage_0 = v3.App.Loading.LoadableImage;
local l_StandardButtonSize_0 = v3.App.Button.Enum.StandardButtonSize;
local v16 = require(l_Modules_0.LuaApp.Services.AppEventIngestService);
local l_AppSessionService_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppSessionService;
local l_SetGamePlaySession_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppSessionization).SetGamePlaySession;
local v19 = require(l_Modules_0.LuaApp.Hooks.useRoactService);
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local l_useImpressionsTagger_0 = require(l_CorePackages_0.Workspace.Packages.Impressions).useImpressionsTagger;
local l_useLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).Hooks.useLocalization;
local v24 = require(l_Modules_0.LuaApp.Thunks.OpenProfilePeekView);
local v25 = require(l_Modules_0.LuaApp.Util.joinGame);
local v26 = require(l_Modules_0.LuaApp.Analytics.Events.joinGameInPlacesList);
local l_SessionType_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppSessionization).SessionType;
local l_GameTileConstants_0 = require(l_CorePackages_0.Workspace.Packages.GameTile).GameTileConstants;
local v29 = require(l_Modules_0.Personalization.Flags.getFFlagLuaAppHomeJoinYourFriendsGridTile);
local v30 = require(l_Modules_0.Personalization.Flags.getFFlagLuaAppHomeJoinYourFriendsLogging);
local v31 = require(l_Modules_0.Personalization.Flags.getFFlagLuaAppHomeJoinYourFriendsSession);
local v32 = require(l_Modules_0.Personalization.Flags.getFFlagLuaAppHomeJoinYourFriendsDesktop);
local l_EnableOptionalPlaceIdForUserIdGameJoins_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).EnableOptionalPlaceIdForUserIdGameJoins;
local l_SocialContextToastIxpConfig_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).SocialContextToastIxpConfig;
local v35 = nil;
local v36 = nil;
if not v32() then
    v35 = v7.JoinYourFriendsTile.Width;
    v36 = v7.JoinYourFriendsTile.Height;
end;
local function _(v37, v38, v39)
    if v30() then
        v39:sendEventDeferred(v37, "joinYourFriendProfileViewOpen", {
            friendId = v38.friendUserId, 
            universeId = v38.universeId, 
            rootPlaceId = v38.rootPlaceId
        });
    end;
end;
local function v49(v41, v42, v43, v44, v45, v46, v47)
    local v48 = 0;
    if v32() then
        v48 = v47.X;
    end;
    return v2.createElement(l_Button_0, {
        buttonType = l_ButtonType_0.PrimaryContextual, 
        position = l_GameTileConstants_0.TileOverlay.BottomRightPosition, 
        anchorPoint = Vector2.new(1, 1), 
        text = v42, 
        fontStyle = v43.Font.CaptionHeader, 
        fitContent = true, 
        standardSize = l_StandardButtonSize_0.XSmall, 
        maxWidth = if not v32() then v35 * 0.92 else v48 * 0.92, 
        isDisabled = false, 
        isLoading = false, 
        onActivated = function()
            if v31() then
                l_SetGamePlaySession_0(v46, l_SessionType_0.StructuralIdentifier.GamePlayFromJoinYourFriends, true);
            end;
            if v30() then
                v26(v45, v41, v44, tonumber(v44), nil, nil, "JoinYourFriends");
            end;
            if not l_EnableOptionalPlaceIdForUserIdGameJoins_0() or not l_SocialContextToastIxpConfig_0.CheckIsFallbackPlaceIdParamEnabled() then
                v25:ByUser({
                    id = v41
                }, "JoinYourFriends");
                return ;
            else
                v25:ByUserAndPlaceId({
                    id = v41
                }, v44, "JoinYourFriends");
                return ;
            end;
        end
    });
end;
local function v53(v50, v51, v52)
    return v2.createElement(l_LoadableImage_0, {
        BackgroundTransparency = 1, 
        ImageTransparency = v51, 
        Image = v50, 
        Position = UDim2.fromScale(0, 0), 
        Size = UDim2.fromScale(1, 1), 
        ScaleType = Enum.ScaleType.Fit, 
        cornerRadius = if not v52 then nil else v52.CornerRadius
    });
end;
local function _(v54)
    if not v54 then
        return "";
    else
        return "rbxthumb://type=AvatarBust&id=" .. v54 .. "&w=150&h=150";
    end;
end;
local function _(v56)
    if not v56 then
        return "";
    else
        return "rbxthumb://type=Asset&id=" .. v56 .. "&w=420&h=420";
    end;
end;
local function v65(v58, v59, v60, v61, v62, v63)
    local _ = nil;
    return v2.createElement(l_StyledTextLabel_0, {
        text = v58, 
        size = UDim2.new(0, if not v32() then (v35 - v62.Leading) - v62.Trailing else (v63.X - v62.Leading) - v62.Trailing, 0, 20), 
        automaticSize = Enum.AutomaticSize.X, 
        fontStyle = v59, 
        colorStyle = v60, 
        textTruncate = Enum.TextTruncate.AtEnd, 
        lineHeight = 1, 
        fluidSizing = false, 
        layoutOrder = v61, 
        richText = false
    });
end;
local function v71(v66, v67, v68)
    if not v29() then
        return nil;
    else
        local l_Spacing_0 = v67.Tokens.Component.VerticalTile.Base.ContentBottom.Spacing;
        local v70 = nil;
        v70 = if not v32() then (v35 - l_Spacing_0.Leading) - l_Spacing_0.Trailing else (v68.X - l_Spacing_0.Leading) - l_Spacing_0.Trailing;
        return v2.createElement("Frame", {
            AutomaticSize = Enum.AutomaticSize.XY, 
            BackgroundTransparency = 1, 
            LayoutOrder = 1
        }, {
            Layout = v2.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                Padding = UDim.new(0, 4)
            }), 
            PresenceIcon = v2.createElement(l_ImageSetLabel_0, {
                LayoutOrder = 1, 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Image = l_Images_0["component_assets/circle_25"], 
                ImageColor3 = v67.Theme.OnlineStatus.Color, 
                ImageTransparency = v67.Theme.OnlineStatus.Transparency, 
                Position = UDim2.fromScale(0.5, 0.5), 
                Size = UDim2.new(0, 12, 0, 12), 
                BackgroundTransparency = 1, 
                ScaleType = Enum.ScaleType.Slice, 
                Visible = true
            }), 
            FriendName = v65(v66, v67.Font.Header2, v67.Theme.TextEmphasis, 2, l_Spacing_0, v68)
        });
    end;
end;
local function v75(v72)
    local l_Spacing_1 = v72.Tokens.Component.VerticalTile.Base.ContentTop.Spacing;
    local l_Spacing_2 = v72.Tokens.Component.VerticalTile.Base.ContentBottom.Spacing;
    return {
        backgroundColor = {
            Color = v72.Theme.BackgroundUIDefault.Color, 
            Transparency = 0
        }, 
        dropShadow = {}, 
        overlayColors = {}, 
        contentTitleFont = v72.Font.Header2, 
        border = {
            BorderColor = {
                Color = v72.Tokens.Component.VerticalTile.Base.Container.BorderColor.Color3, 
                Transparency = v72.Tokens.Component.VerticalTile.Base.Container.BorderColor.Transparency
            }, 
            CornerRadius = if not v29() then UDim.new(0, 5) else UDim.new(0, 12), 
            Width = v72.Tokens.Component.VerticalTile.Base.Container.BorderWidth
        }, 
        topContentPadding = {
            Left = l_Spacing_1.Leading, 
            Right = l_Spacing_1.Trailing, 
            Top = l_Spacing_1.Top, 
            Bottom = l_Spacing_1.Bottom
        }, 
        bottomContentPadding = {
            Left = if not v29() then l_Spacing_2.Leading else 0, 
            Right = l_Spacing_2.Trailing, 
            Top = 3, 
            Bottom = l_Spacing_2.Bottom
        }, 
        selectionCursorPadding = {
            Left = 0, 
            Right = 0, 
            Top = 0, 
            Bottom = 0
        }, 
        contentTitlePadding = 8
    };
end;
return function(v76)
    local l_friendUserId_0 = v76.friendUserId;
    local l_thumbnailAssetId_0 = v76.thumbnailAssetId;
    local l_experienceName_0 = v76.experienceName;
    local v81 = l_useSelector_0(function(v80)
        return v80.Users[l_friendUserId_0];
    end);
    local v82 = l_useDispatch_0();
    local v84 = l_useSelector_0(function(v83)
        return v8(v83);
    end);
    local v85 = v19(v16);
    local v86 = nil;
    if v31() then
        v86 = v19(l_AppSessionService_0);
    end;
    local v87 = l_useStyle_0();
    local l_Spacing_3 = v87.Tokens.Component.VerticalTile.Base.ContentBottom.Spacing;
    local v89 = v76.size or Vector2.new(0, 0);
    local function v90()
        return v2.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, 0), 
            Position = UDim2.new(0, 0, 0, 0), 
            BackgroundTransparency = 1
        }, {
            ListLayout = v2.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                FillDirection = Enum.FillDirection.Vertical, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                Padding = UDim.new(0, 2)
            }), 
            Title = if not v29() then v65(not v81 and "" or v81.displayName, v87.Font.Header2, v87.Theme.TextEmphasis, 1, l_Spacing_3, v89) else v71(not v81 and "" or v81.displayName, v87, v89), 
            Padding = if not v29() then nil else v2.createElement("UIPadding", {
                PaddingTop = UDim.new(0, 4)
            }), 
            SubTitle = v65(l_experienceName_0, v87.Font.CaptionHeader, v87.Theme.TextDefault, 2, l_Spacing_3, v89)
        });
    end;
    local v91 = l_useLocalization_0({
        joinButtonText = "Feature.Home.Button.Join"
    });
    local v92 = nil;
    if v30() then
        v92 = v2.createRef();
        l_useImpressionsTagger_0(v92, v76.impressionsTag, v76.LayoutOrder);
    end;
    return v2.createElement("Frame", {
        Size = if not v32() then UDim2.new(0, v35, 0, v36) else UDim2.new(0, v89.X, 0, v89.Y), 
        BackgroundTransparency = 1, 
        LayoutOrder = v76.LayoutOrder, 
        ref = if not v30() then nil else v92
    }, {
        Tile = v2.createElement(l_ExperienceTileV3_0, {
            tileWidth = if not v32() then v35 else v89.X, 
            hasBackground = if not v29() then nil else false, 
            hasOutline = if not v29() then nil else false, 
            isActive = true, 
            isHoverEnabled = false, 
            isExperienceActionRowEnabled = true, 
            thumbnailAspectRatioOverride = l_AspectRatioModeEnum_0.Wide, 
            contentTextLineCount = 1, 
            contentTitlePadding = 0, 
            renderTopContentOverlay = function(_, v94)
                local v95 = {
                    gradient = v53("rbxassetid://13074142871", 0.3, v94)
                };
                local l_v53_0 = v53;
                local l_l_friendUserId_0_0 = l_friendUserId_0;
                v95.avatar = l_v53_0(not l_l_friendUserId_0_0 and "" or "rbxthumb://type=AvatarBust&id=" .. l_l_friendUserId_0_0 .. "&w=150&h=150", 0, v94);
                v95.joinButton = v49(l_friendUserId_0, v91.joinButtonText, v87, v76.rootPlaceId, v85, v86, v89);
                return v95;
            end, 
            onActivated = function()
                if not v30() then
                    v82(v24(l_friendUserId_0));
                    return ;
                else
                    local l_v84_0 = v84;
                    local l_v76_0 = v76;
                    local l_v85_0 = v85;
                    if v30() then
                        l_v85_0:sendEventDeferred(l_v84_0, "joinYourFriendProfileViewOpen", {
                            friendId = l_v76_0.friendUserId, 
                            universeId = l_v76_0.universeId, 
                            rootPlaceId = l_v76_0.rootPlaceId
                        });
                    end;
                    v82(v24(l_friendUserId_0, {
                        source = "JoinYourFriends"
                    }));
                    return ;
                end;
            end, 
            wideThumbnail = not l_thumbnailAssetId_0 and "" or "rbxthumb://type=Asset&id=" .. l_thumbnailAssetId_0 .. "&w=420&h=420", 
            renderBottomContent = v90, 
            styleProps = v75(v87)
        })
    });
end;
