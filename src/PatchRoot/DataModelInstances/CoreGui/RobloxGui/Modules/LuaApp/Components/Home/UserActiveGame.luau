local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_Common_0 = l_Modules_0.Common;
local l_LuaApp_0 = l_Modules_0.LuaApp;
local l_AppGuiService_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppGuiService;
local v5 = require(l_LuaApp_0.Constants);
local v6 = require(l_LuaApp_0.FitChildren);
local l_FormFactor_0 = require(l_CorePackages_0.Workspace.Packages.FormFactor).Enums.FormFactor;
local v8 = require(l_LuaApp_0.Components.GameButton);
local v9 = require(l_Modules_0.LuaApp.Components.DEPRECATED_ImageSetButton);
local v10 = require(l_CorePackages_0.Roact);
local v11 = require(l_CorePackages_0.Cryo);
local v12 = require(l_CorePackages_0.RoactRodux);
local l_withStyle_0 = require(l_CorePackages_0.UIBlox).Style.withStyle;
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local l_RoactAnalyticsCommonGameEvents_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).RoactAnalyticsCommonGameEvents;
local v16 = require(l_LuaApp_0.Enum.FeatureContext);
local l_ConvertUniverseIdToString_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).ConvertUniverseIdToString;
local v18 = require(l_Common_0.Text);
local v19 = require(l_Modules_0.LuaApp.Thunks.OpenGameDetails);
local l_GameIconReducer_0 = require(l_CorePackages_0.Workspace.Packages.GameIconRodux).GameIcons.GameIconReducer;
local l_VIEW_GAME_DETAILS_FROM_ICON_0 = v5.AnalyticsKeyword.VIEW_GAME_DETAILS_FROM_ICON;
local l_VIEW_GAME_DETAILS_FROM_TITLE_0 = v5.AnalyticsKeyword.VIEW_GAME_DETAILS_FROM_TITLE;
local l_game_EngineFeature_0 = game:GetEngineFeature("TextBoundsRoundUp");
local v24 = v10.PureComponent:extend("UserActiveGame");
local function v26(v25)
    return v10.createElement("Frame", {
        BackgroundColor3 = v25.color, 
        BackgroundTransparency = v25.transparency, 
        BorderSizePixel = 0, 
        LayoutOrder = v25.layoutOrder, 
        Size = UDim2.new(1, 0, 0, 1)
    });
end;
local function _(v27, v28)
    if not v27 then
        local v29 = v28 and v28.lastLocation;
        if not v29 then
            return "";
        else
            return v29;
        end;
    else
        return v27.name;
    end;
end;
v24.init = function(v31)
    v31.createOpenGameDetailsProps = function()
        return {
            onClose = v31.props.onCloseGameDetails
        };
    end;
    v31.openGameDetails = function(v32)
        local l_universePlaceInfo_0 = v31.props.universePlaceInfo;
        if l_universePlaceInfo_0 then
            local l_analytics_0 = v31.props.analytics;
            local l_friend_0 = v31.props.friend;
            local l_index_0 = v31.props.index;
            local l_absolutePosition_0 = v31.props.absolutePosition;
            local l_dismissContextualMenu_0 = v31.props.dismissContextualMenu;
            local l_featureContext_0 = v31.props.featureContext;
            local l_universeRootPlaceId_0 = l_universePlaceInfo_0.universeRootPlaceId;
            local v41 = l_ConvertUniverseIdToString_0(v31.props.universeId);
            if l_featureContext_0 == v16.PeopleList then
                l_analytics_0.reportViewProfileFromPeopleList(l_friend_0.id, l_index_0, l_absolutePosition_0, l_universeRootPlaceId_0, v32);
                l_analytics_0.reportOpenGameDetailFromPeopleList(l_friend_0.id, l_index_0, l_absolutePosition_0, l_universeRootPlaceId_0, v41, v32, "GameDetailFromUserActiveGame");
            end;
            if l_dismissContextualMenu_0 then
                l_dismissContextualMenu_0();
            end;
            v31.props.openGameDetails(v41, v31.createOpenGameDetailsProps());
            return ;
        else
            return ;
        end;
    end;
    v31.getGameTitleHeight = function(v42, v43, v44, v45)
        local v46 = v18.GetTextHeight(v42, v43, v44, v45);
        if not l_game_EngineFeature_0 then
            v46 = v46 - 2;
        end;
        return (math.min(40, v46));
    end;
end;
v24.createGameNameButton = function(v47, v48, v49, v50, v51, v52)
    local l_Theme_0 = v52.Theme;
    local l_Font_0 = v52.Font;
    return v10.createElement("TextButton", {
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        Font = l_Font_0.Header2.Font, 
        LayoutOrder = 1, 
        Size = UDim2.new(1, 0, 0, v48), 
        Text = v49, 
        TextColor3 = l_Theme_0.TextEmphasis.Color, 
        TextTransparency = l_Theme_0.TextEmphasis.Transparency, 
        TextSize = l_Font_0.BaseSize * l_Font_0.Header2.RelativeSize, 
        TextTruncate = Enum.TextTruncate.AtEnd, 
        TextWrapped = true, 
        TextXAlignment = v50, 
        TextYAlignment = v51, 
        [v10.Event.Activated] = function()
            v47.openGameDetails(l_VIEW_GAME_DETAILS_FROM_TITLE_0, v47.createOpenGameDetailsProps());
        end
    });
end;
v24.renderPhone = function(v55, v56)
    local l_layoutOrder_0 = v55.props.layoutOrder;
    local l_width_0 = v55.props.width;
    local l_universeId_0 = v55.props.universeId;
    local l_friend_1 = v55.props.friend;
    local l_index_1 = v55.props.index;
    local l_absolutePosition_1 = v55.props.absolutePosition;
    local l_dismissContextualMenu_1 = v55.props.dismissContextualMenu;
    local l_featureContext_1 = v55.props.featureContext;
    local l_gameThumbnail_0 = v55.props.gameThumbnail;
    local l_universePlaceInfo_1 = v55.props.universePlaceInfo;
    local l_forwardRef_0 = v55.props.forwardRef;
    local l_Theme_1 = v56.Theme;
    local l_Font_1 = v56.Font;
    local v70 = l_Font_1.BaseSize * l_Font_1.Header2.RelativeSize;
    local l_Font_2 = l_Font_1.Header2.Font;
    local v72 = if not l_universePlaceInfo_1 then l_friend_1 and l_friend_1.lastLocation or "" else l_universePlaceInfo_1.name;
    local l_Color_0 = l_Theme_1.BackgroundUIDefault.Color;
    local l_Transparency_0 = l_Theme_1.BackgroundUIDefault.Transparency;
    local v75 = not not l_gameThumbnail_0 and l_Color_0 or l_Theme_1.PlaceHolder.Color;
    local v76 = not not l_gameThumbnail_0 and l_Transparency_0 or l_Theme_1.PlaceHolder.Transparency;
    local v77 = l_width_0 - 30;
    return v10.createElement(v6.FitImageButton, {
        BackgroundTransparency = 1, 
        fitAxis = v6.FitAxis.Height, 
        LayoutOrder = l_layoutOrder_0, 
        Size = UDim2.new(1, 0, 0, 0), 
        AutoButtonColor = false, 
        [v10.Ref] = l_forwardRef_0
    }, {
        GameContent = v10.createElement(v6.FitFrame, {
            BackgroundTransparency = 1, 
            fitAxis = v6.FitAxis.Height, 
            Size = UDim2.new(1, 0, 0, 0)
        }, {
            Layout = v10.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                SortOrder = Enum.SortOrder.LayoutOrder
            }), 
            GameIcon = v10.createElement("Frame", {
                BackgroundColor3 = v75, 
                BackgroundTransparency = v76, 
                BorderSizePixel = 0, 
                LayoutOrder = 1, 
                Size = UDim2.new(0, 94, 0, 94)
            }, {
                Icon = v10.createElement(v9, {
                    BackgroundColor3 = v75, 
                    BorderSizePixel = 0, 
                    Image = l_gameThumbnail_0, 
                    Position = UDim2.new(0, 2, 0, 2), 
                    Size = UDim2.new(0, 90, 0, 90), 
                    [v10.Event.Activated] = function()
                        v55.openGameDetails(l_VIEW_GAME_DETAILS_FROM_ICON_0, v55.createOpenGameDetailsProps());
                    end
                })
            }), 
            GameName = v10.createElement(v6.FitFrame, {
                BackgroundTransparency = 1, 
                fitAxis = v6.FitAxis.Height, 
                LayoutOrder = 2, 
                Size = UDim2.new(1, -30, 0, 0)
            }, {
                Layout = v10.createElement("UIListLayout", {
                    HorizontalAlignment = Enum.HorizontalAlignment.Center
                }), 
                NameButton = v55:createGameNameButton(v55.getGameTitleHeight(v72, l_Font_2, v70, v77), v72, Enum.TextXAlignment.Center, Enum.TextYAlignment.Center, v56), 
                Padding = v10.createElement("UIPadding", {
                    PaddingTop = UDim.new(0, 12)
                })
            }), 
            InteractiveButton = v10.createElement(v6.FitFrame, {
                BackgroundTransparency = 1, 
                fitAxis = v6.FitAxis.Height, 
                LayoutOrder = 3, 
                Size = UDim2.new(1, -30, 0, 0)
            }, {
                Layout = v10.createElement("UIListLayout", {
                    HorizontalAlignment = Enum.HorizontalAlignment.Center
                }), 
                Padding = v10.createElement("UIPadding", {
                    PaddingTop = UDim.new(0, 24)
                }), 
                Button = v10.createElement(v8, {
                    maxWidth = v77, 
                    showLoadingIndicatorWhenDataNotReady = true, 
                    universeId = l_universeId_0, 
                    friend = l_friend_1, 
                    index = l_index_1, 
                    absolutePosition = l_absolutePosition_1, 
                    callbackOnOpenGameDetails = l_dismissContextualMenu_1, 
                    callbackOnJoinGame = l_dismissContextualMenu_1, 
                    featureContext = l_featureContext_1, 
                    source = v55.props.source
                })
            }), 
            Separator = v10.createElement(v6.FitFrame, {
                BackgroundTransparency = 1, 
                Size = UDim2.new(1, 0, 0, 0), 
                LayoutOrder = 5, 
                fitAxis = v6.FitAxis.Height
            }, {
                Layout = v10.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical, 
                    SortOrder = Enum.SortOrder.LayoutOrder
                }), 
                Line = v10.createElement(v26, {
                    color = l_Theme_1.Divider.Color, 
                    transparency = l_Theme_1.Divider.Transparency, 
                    layoutOrder = 2
                }), 
                Padding = v10.createElement("UIPadding", {
                    PaddingTop = UDim.new(0, 23)
                })
            })
        }), 
        Background = v10.createElement("Frame", {
            BackgroundColor3 = l_Color_0, 
            BackgroundTransparency = l_Transparency_0, 
            BorderSizePixel = 0, 
            Size = UDim2.new(1, 0, 1, -47), 
            Position = UDim2.new(0, 0, 0, 47)
        })
    });
end;
v24.renderTablet = function(v78, v79)
    local l_layoutOrder_1 = v78.props.layoutOrder;
    local l_width_1 = v78.props.width;
    local l_universeId_1 = v78.props.universeId;
    local l_friend_2 = v78.props.friend;
    local l_index_2 = v78.props.index;
    local l_absolutePosition_2 = v78.props.absolutePosition;
    local l_dismissContextualMenu_2 = v78.props.dismissContextualMenu;
    local l_featureContext_2 = v78.props.featureContext;
    local l_gameThumbnail_1 = v78.props.gameThumbnail;
    local l_universePlaceInfo_2 = v78.props.universePlaceInfo;
    local l_forwardRef_1 = v78.props.forwardRef;
    local v91 = if not l_universePlaceInfo_2 then l_friend_2 and l_friend_2.lastLocation or "" else l_universePlaceInfo_2.name;
    local l_Theme_2 = v79.Theme;
    local l_Color_1 = l_Theme_2.BackgroundUIDefault.Color;
    local l_Transparency_1 = l_Theme_2.BackgroundUIDefault.Transparency;
    return v10.createElement(v6.FitImageButton, {
        BackgroundColor3 = l_Color_1, 
        BackgroundTransparency = l_Transparency_1, 
        BorderSizePixel = 0, 
        fitAxis = v6.FitAxis.Height, 
        LayoutOrder = l_layoutOrder_1, 
        Size = UDim2.new(0, l_width_1, 0, 0), 
        AutoButtonColor = false, 
        [v10.Ref] = l_forwardRef_1
    }, {
        Layout = v10.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            SortOrder = Enum.SortOrder.LayoutOrder
        }), 
        GameContent = v10.createElement(v6.FitFrame, {
            BackgroundTransparency = 1, 
            fitAxis = v6.FitAxis.Height, 
            LayoutOrder = 1, 
            Size = UDim2.new(1, 0, 0, 0)
        }, {
            Padding = v10.createElement("UIPadding", {
                PaddingTop = UDim.new(0, 12), 
                PaddingLeft = UDim.new(0, 12), 
                PaddingRight = UDim.new(0, 12), 
                PaddingBottom = UDim.new(0, 11)
            }), 
            Layout = v10.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                Padding = UDim.new(0, 15)
            }), 
            GameIcon = v10.createElement(v9, {
                BackgroundColor3 = not not l_gameThumbnail_1 and l_Color_1 or l_Theme_2.PlaceHolder.Color, 
                BackgroundTransparency = not not l_gameThumbnail_1 and l_Transparency_1 or l_Theme_2.PlaceHolder.Transparency, 
                BorderSizePixel = 0, 
                LayoutOrder = 1, 
                Image = l_gameThumbnail_1, 
                Size = UDim2.new(0, 90, 0, 90), 
                [v10.Event.Activated] = function()
                    v78.openGameDetails(l_VIEW_GAME_DETAILS_FROM_ICON_0, v78.createOpenGameDetailsProps());
                end
            }, {
                Padding = v10.createElement("UIPadding", {
                    PaddingLeft = UDim.new(0, 12)
                })
            }), 
            GameInfo = v10.createElement(v6.FitFrame, {
                BackgroundTransparency = 1, 
                fitAxis = v6.FitAxis.Height, 
                LayoutOrder = 2, 
                Size = UDim2.new(1, -105, 0, 0)
            }, {
                Layout = v10.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical, 
                    SortOrder = Enum.SortOrder.LayoutOrder
                }), 
                NameButton = v78:createGameNameButton(40, v91, Enum.TextXAlignment.Left, Enum.TextYAlignment.Top, v79), 
                InteractiveButton = v10.createElement(v6.FitFrame, {
                    BackgroundTransparency = 1, 
                    Size = UDim2.new(1, 0, 0, 0), 
                    LayoutOrder = 2, 
                    fitAxis = v6.FitAxis.Height
                }, {
                    Layout = v10.createElement("UIListLayout", {
                        HorizontalAlignment = Enum.HorizontalAlignment.Right
                    }), 
                    Button = v10.createElement(v8, {
                        layoutOrder = 3, 
                        maxWidth = (l_width_1 - 36) - 90, 
                        showLoadingIndicatorWhenDataNotReady = true, 
                        universeId = l_universeId_1, 
                        friend = l_friend_2, 
                        index = l_index_2, 
                        absolutePosition = l_absolutePosition_2, 
                        callbackOnOpenGameDetails = l_dismissContextualMenu_2, 
                        callbackOnJoinGame = l_dismissContextualMenu_2, 
                        featureContext = l_featureContext_2, 
                        source = v78.props.source
                    }), 
                    Padding = v10.createElement("UIPadding", {
                        PaddingTop = UDim.new(0, 18)
                    })
                })
            })
        }), 
        Separator = v10.createElement(v26, {
            layoutOrder = 2
        })
    });
end;
v24.render = function(v95)
    local l_formFactor_0 = v95.props.formFactor;
    return l_withStyle_0(function(v97)
        if l_formFactor_0 == l_FormFactor_0.COMPACT then
            return v95:renderPhone(v97);
        else
            return v95:renderTablet(v97);
        end;
    end);
end;
v24 = l_RoactServices_0.connect({
    analytics = l_RoactAnalyticsCommonGameEvents_0, 
    guiService = l_AppGuiService_0
})((v12.connect(function(v98, v99)
    local v100 = l_ConvertUniverseIdToString_0(v99.universeId);
    local _ = nil;
    local v102 = v98[l_GameIconReducer_0.key][v100];
    return {
        formFactor = v98.FormFactor, 
        gameThumbnail = v102 and v102.url or v5.DEFAULT_GAME_ICON, 
        universePlaceInfo = v98.UniversePlaceInfos[v100]
    };
end, function(v103)
    return {
        openGameDetails = function(v104, v105)
            v103(v19(v104, v105));
        end
    };
end)(v24)));
return v10.forwardRef(function(v106, v107)
    return v10.createElement(v24, v11.Dictionary.join(v106, {
        forwardRef = v107
    }));
end);
