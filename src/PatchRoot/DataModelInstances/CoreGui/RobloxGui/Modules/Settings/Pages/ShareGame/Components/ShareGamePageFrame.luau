local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_HttpRbxApiService_0 = game:GetService("HttpRbxApiService");
local l_RobloxReplicatedStorage_0 = game:GetService("RobloxReplicatedStorage");
local v4 = l_CoreGui_0:WaitForChild("RobloxGui", math.huge);
local v5 = require(v4.Modules.Common.Constants);
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local l_ShareGame_0 = l_Modules_0.Settings.Pages.ShareGame;
local v8 = require(l_CorePackages_0.Promise);
local v9 = require(v4.Modules.Settings.Utility);
local v10 = require(v4.Modules.Settings.Theme);
local v11 = require(l_Modules_0.Flags.GetFFlagEnableNewInviteMenu);
local v12 = require(l_Modules_0.Settings.Flags.GetFFlagInviteFriendsDesignUpdates);
local v13 = require(l_Modules_0.Settings.Flags.GetFFlagShareInviteLinkContextMenuV1Enabled);
local v14 = require(l_Modules_0.Settings.Flags.FFlagShareExperienceInviteLinkPolicy);
local v15 = require(l_CorePackages_0.Roact);
local v16 = require(l_CorePackages_0.RoactRodux);
local l_RoactAppPolicy_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy;
local v18 = require(l_Modules_0.Common.httpRequest);
local v19 = require(l_ShareGame_0.Components.Header);
local v20 = require(l_ShareGame_0.Components.ConversationList);
local v21 = require(l_ShareGame_0.Constants);
local v22 = require(l_ShareGame_0.Components.ShareInviteLink);
local l_GetGameNameAndDescription_0 = require(l_CorePackages_0.Workspace.Packages.GameDetailRodux).GetGameNameAndDescription;
local v24 = require(l_ShareGame_0.Components.BackButton);
local v25 = require(l_ShareGame_0.Actions.SetGameInfoCreated);
local v26 = 10;
local v27 = 44;
if not (not v12() or not v11()) then
    v26 = 16;
    v27 = 52;
end;
local v28 = v15.PureComponent:extend("ShareGamePageFrame");
local v29 = require(l_ShareGame_0.Components.ErrorToaster);
v28.init = function(v30)
    if v13() then
        v30.state = {
            serverType = nil
        };
    end;
end;
v28.shouldShowInviteLink = function(v31, v32)
    if not (not (not v13() or v14 and not v31.props.experienceInviteShareLinkEnabled) and v31.state.serverType == v5.STANDARD_SERVER) or not v9:IsExperienceOlderThanOneWeek(v32) then
        return false;
    else
        return true;
    end;
end;
v28.didMount = function(v33)
    if v13() then
        v33.props.fetchGameInfo();
        if v33.state.serverType == nil then
            v8.try(function()
                return l_RobloxReplicatedStorage_0:WaitForChild("GetServerType", math.huge):InvokeServer();
            end):andThen(function(v34)
                v33:setState({
                    serverType = v34
                });
            end);
        end;
    end;
end;
v28.render = function(v35)
    local l_analytics_0 = v35.props.analytics;
    local l_deviceLayout_0 = v35.props.deviceLayout;
    local l_zIndex_0 = v35.props.zIndex;
    local l_closePage_0 = v35.props.closePage;
    local l_searchAreaActive_0 = v35.props.searchAreaActive;
    local l_searchText_0 = v35.props.searchText;
    local v42 = v21.LayoutSpecific[l_deviceLayout_0];
    local l_HEADER_HEIGHT_0 = v42.HEADER_HEIGHT;
    local v44 = l_deviceLayout_0 == v21.DeviceLayout.DESKTOP;
    local v45 = not v44 and v24.IconType.Arrow or v24.IconType.None;
    local v46 = not v44;
    local l_isVisible_0 = v35.props.isVisible;
    local v48 = v35:shouldShowInviteLink(v35.props.gameInfo);
    local v49 = 0;
    local v50 = 0;
    if not (not v48 or not v10.UIBloxThemeEnabled) then
        v49 = v49 - v27;
        v50 = 10;
    end;
    return v15.createElement("Frame", {
        BackgroundTransparency = 1, 
        Size = UDim2.new(1, 0, 1, 0), 
        Position = UDim2.new(0, 0, 0, 0), 
        ZIndex = l_zIndex_0, 
        AutoLocalize = false
    }, {
        toasterPortal = v15.createElement(v15.Portal, {
            target = l_CoreGui_0
        }, {
            Toaster = v15.createElement(v29)
        }), 
        Header = v15.createElement(v19, {
            deviceLayout = l_deviceLayout_0, 
            size = UDim2.new(1, 0, 0, l_HEADER_HEIGHT_0), 
            position = UDim2.new(0, 0, 0, -l_HEADER_HEIGHT_0), 
            layoutOrder = 0, 
            zIndex = l_zIndex_0, 
            closePage = l_closePage_0, 
            searchAreaActive = l_searchAreaActive_0, 
            toggleSearchIcon = v46, 
            iconType = v45, 
            analytics = l_analytics_0
        }), 
        ShareInviteLink = not not v48 and v15.createElement(v22, {
            position = UDim2.new(0, 0, 0, v50), 
            analytics = l_analytics_0, 
            deviceLayout = l_deviceLayout_0, 
            size = UDim2.new(1, 0, 0, v27), 
            layoutOrder = 1, 
            zIndex = l_zIndex_0
        }) or nil, 
        ConversationList = v15.createElement(v20, {
            analytics = l_analytics_0, 
            size = UDim2.new(1, 0, 1, (v42.EXTEND_BOTTOM_SIZE - v26) + v49), 
            topPadding = not not v48 and (v26 + v27) + v50 or v26, 
            layoutOrder = not v48 and 1 or 2, 
            zIndex = l_zIndex_0, 
            searchText = l_searchText_0, 
            isVisible = l_isVisible_0, 
            trigger = "GameMenu"
        })
    });
end;
if v13() then
    v28 = v16.connect(function(v51)
        return {
            gameInfo = v51.GameInfo
        };
    end, function(v52)
        return {
            fetchGameInfo = function()
                l_GetGameNameAndDescription_0(v18(l_HttpRbxApiService_0), game.GameId):andThen(function(v53)
                    v52(v25(v53.Created));
                end);
            end
        };
    end)(v28);
end;
if v14 then
    v28 = l_RoactAppPolicy_0.connect(function(v54)
        return {
            experienceInviteShareLinkEnabled = v54.getExperienceInviteShareLinkEnabled()
        };
    end)(v28);
end;
return v28;
