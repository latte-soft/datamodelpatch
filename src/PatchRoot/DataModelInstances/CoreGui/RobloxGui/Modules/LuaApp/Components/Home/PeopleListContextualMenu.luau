local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_Modules_0.Common.Roact);
local v3 = require(l_Modules_0.Common.RoactRodux);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local l_RoactAnalyticsCommonGameEvents_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).RoactAnalyticsCommonGameEvents;
local v6 = require(l_Modules_0.LuaApp.Services.RoactLocalization);
local l_AppGuiService_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppGuiService;
local l_RoactAppPolicy_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy;
local v9 = require(l_Modules_0.LuaApp.AppPage);
local v10 = require(l_Modules_0.LuaApp.Constants);
local v11 = require(l_Modules_0.LuaApp.FitChildren);
local v12 = require(l_Modules_0.LuaApp.withLocalization);
local l_FormFactor_0 = require(l_CorePackages_0.Workspace.Packages.FormFactor).Enums.FormFactor;
local v14 = require(l_Modules_0.LuaApp.Enum.FeatureContext);
local v15 = require(l_Modules_0.LuaApp.Enum.NotificationType);
local v16 = require(l_Modules_0.LuaApp.Thunks.CloseCentralOverlay);
local v17 = require(l_Modules_0.LuaApp.Thunks.NavigateDown);
local v18 = require(l_Modules_0.LuaApp.Models.User);
local v19 = require(l_Modules_0.LuaApp.Components.ListPicker);
local v20 = require(l_Modules_0.LuaApp.Components.Home.UserActiveGame);
local v21 = require(l_Modules_0.LuaApp.Components.FormBasedContextualMenu);
local l_EnteredChatFromEntryPoint_0 = require(l_CorePackages_0.Workspace.Packages.AppChat).Actions.EnteredChatFromEntryPoint;
local l_ChatEntryPointNames_0 = require(l_CorePackages_0.Workspace.Packages.SocialCommon).Enums.ChatEntryPointNames;
local v24 = require(l_Modules_0.LuaApp.Flags.GetFFlagLuaAppUseWithLocalization);
local v25 = v2.PureComponent:extend("PeopleListContextualMenu");
local l_DEFAULT_WIDE_CONTEXTUAL_MENU__WIDTH_0 = v10.DEFAULT_WIDE_CONTEXTUAL_MENU__WIDTH;
v25.defaultProps = {
    positionIndex = 0, 
    absolutePosition = 0
};
v25.init = function(v27)
    local l_analytics_0 = v27.props.analytics;
    local l_guiService_0 = v27.props.guiService;
    local l_closeCentralOverlay_0 = v27.props.closeCentralOverlay;
    local l_navigateDown_0 = v27.props.navigateDown;
    local l_user_0 = v27.props.user;
    local l_positionIndex_0 = v27.props.positionIndex;
    local l_absolutePosition_0 = v27.props.absolutePosition;
    local l_source_0 = v27.props.source;
    v27.chatWithUser = function(v36)
        l_analytics_0.reportPeopleListInteraction("ChatDropdown", v36, l_positionIndex_0, l_absolutePosition_0, v27.props.analyticContext, {
            source = l_source_0
        });
        v27.props.enteredChatFromEntryPoint(l_ChatEntryPointNames_0.PeopleListDropdown);
        l_guiService_0:BroadcastNotification(v36, v15.LAUNCH_CONVERSATION);
    end;
    v27.viewProfile = function(v37)
        l_analytics_0.reportPeopleListInteraction("ProfileDropdown", v37, l_positionIndex_0, l_absolutePosition_0, v27.props.analyticContext);
        l_navigateDown_0({
            name = v9.ViewUserProfile, 
            detail = v37, 
            extraProps = {
                onClose = function()
                    l_closeCentralOverlay_0();
                    if v27.props.onCloseProfileWebview then
                        v27.props.onCloseProfileWebview();
                    end;
                end
            }
        });
    end;
    l_analytics_0.reportPeopleListInteraction("openPeopleList", l_user_0.id, l_positionIndex_0, l_absolutePosition_0, v27.props.analyticContext, {
        source = v27.props.source, 
        universeId = if l_user_0.presence == v18.PresenceType.IN_GAME then l_user_0.universeId else nil
    });
end;
v25.didMount = function(v38)
    local l_onOpen_0 = v38.props.onOpen;
    if l_onOpen_0 then
        l_onOpen_0();
    end;
end;
v25.render = function(v40)
    local l_localization_0 = v40.props.localization;
    local l_screenSize_0 = v40.props.screenSize;
    local l_formFactor_0 = v40.props.formFactor;
    local l_closeCentralOverlay_1 = v40.props.closeCentralOverlay;
    local l_user_1 = v40.props.user;
    local l_positionIndex_1 = v40.props.positionIndex;
    local l_absolutePosition_1 = v40.props.absolutePosition;
    local l_anchorSpaceSize_0 = v40.props.anchorSpaceSize;
    local l_anchorSpacePosition_0 = v40.props.anchorSpacePosition;
    local l_combinedName_0 = v40.props.combinedName;
    local v51 = false;
    if l_user_1.presence == v18.PresenceType.IN_GAME then
        v51 = l_user_1.universeId;
    end;
    local v52 = not not (l_formFactor_0 == l_FormFactor_0.COMPACT) and l_screenSize_0.X or l_DEFAULT_WIDE_CONTEXTUAL_MENU__WIDTH_0;
    local function v54(v53)
        return v2.createElement(v21, {
            anchorSpaceSize = l_anchorSpaceSize_0, 
            anchorSpacePosition = l_anchorSpacePosition_0, 
            itemWidth = v52
        }, {
            Content = v2.createElement(v11.FitFrame, {
                BackgroundTransparency = 1, 
                fitAxis = v11.FitAxis.Height, 
                Size = UDim2.new(1, 0, 0, 0)
            }, {
                ListLayout = v2.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical, 
                    SortOrder = Enum.SortOrder.LayoutOrder
                }), 
                GameHeader = v51 and v2.createElement(v20, {
                    friend = l_user_1, 
                    layoutOrder = 1, 
                    width = v52, 
                    index = l_positionIndex_1, 
                    absolutePosition = l_absolutePosition_1, 
                    universeId = l_user_1.universeId, 
                    dismissContextualMenu = l_closeCentralOverlay_1, 
                    featureContext = v14.PeopleList, 
                    onCloseGameDetails = v40.props.onCloseGameDetails, 
                    source = v40.props.source
                }), 
                ListPicker = v2.createElement(v19, {
                    formFactor = l_formFactor_0, 
                    items = if v40.props.areWebViewsSupported then {
                        {
                            displayIcon = "LuaApp/icons/menu/menu_messages", 
                            text = v53.chatWithFriendText, 
                            onSelect = function()
                                v40.chatWithUser(l_user_1.id);
                            end
                        }, 
                        {
                            displayIcon = "LuaApp/icons/menu/menu_profile", 
                            text = v53.viewProfileText, 
                            onSelect = function()
                                v40.viewProfile(l_user_1.id);
                            end
                        }
                    } else {
                        {
                            displayIcon = "LuaApp/icons/menu/menu_messages", 
                            text = v53.chatWithFriendText, 
                            onSelect = function()
                                v40.chatWithUser(l_user_1.id);
                            end
                        }
                    }, 
                    layoutOrder = 2, 
                    width = v52, 
                    maxHeight = 162
                })
            })
        });
    end;
    if not v24() then
        return v54({
            chatWithFriendText = l_localization_0:Format("Feature.Home.PeopleList.ChatWith", {
                username = l_combinedName_0
            }), 
            viewProfileText = l_localization_0:Format("Feature.Chat.Label.ViewProfile")
        });
    else
        return v12({
            chatWithFriendText = {
                "Feature.Home.PeopleList.ChatWith"; 
                username = l_combinedName_0
            }, 
            viewProfileText = "Feature.Chat.Label.ViewProfile"
        })(v54);
    end;
end;
v25.willUnmount = function(v55)
    local l_onClose_0 = v55.props.onClose;
    if l_onClose_0 then
        l_onClose_0();
    end;
end;
return (l_RoactAppPolicy_0.connect(function(v57, _)
    return {
        enableDisplayNamePolicy = v57.getShowDisplayName(), 
        areWebViewsSupported = v57.getWebViewSupport()
    };
end)((l_RoactServices_0.connect({
    analytics = l_RoactAnalyticsCommonGameEvents_0, 
    localization = v6, 
    guiService = l_AppGuiService_0
})((v3.connect(function(v59, _)
    return {
        formFactor = v59.FormFactor, 
        screenSize = v59.ScreenSize
    };
end, function(v61)
    return {
        navigateDown = function(v62)
            v61(v17(v62));
        end, 
        closeCentralOverlay = function()
            v61(v16());
        end, 
        enteredChatFromEntryPoint = function(v63)
            v61(l_EnteredChatFromEntryPoint_0(v63));
        end
    };
end)(v25))))));
