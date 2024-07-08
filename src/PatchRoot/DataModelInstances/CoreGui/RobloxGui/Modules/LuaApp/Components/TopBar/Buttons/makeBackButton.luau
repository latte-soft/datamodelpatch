local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local l_GuiService_0 = game:GetService("GuiService");
local l_RunService_0 = game:GetService("RunService");
local v4 = require(l_CorePackages_0.Packages.Dash);
local v5 = require(l_CorePackages_0.Packages.t);
local v6 = require(l_CorePackages_0.Roact);
local v7 = require(l_CorePackages_0.RoactRodux);
local v8 = require(l_CorePackages_0.RoactNavigation);
local v9 = require(l_CorePackages_0.UIBlox);
local l_Images_0 = v9.App.ImageSet.Images;
local l_withStyle_0 = v9.Style.withStyle;
local l_IconButton_0 = v9.App.Button.IconButton;
local l_IconSize_0 = v9.App.ImageSet.Enum.IconSize;
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v15 = require(l_Modules_0.LuaApp.Services.RoactAnalyticsTopBar);
local v16 = require(l_Modules_0.LuaApp.AppPage);
local v17 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AvatarScreen);
local v18 = require(l_CorePackages_0.Packages.RoactGamepad);
local v19 = require(l_Modules_0.LuaApp.Thunks.NavigateBack);
local v20 = require(l_Modules_0.LuaApp.AppPageProperties);
local v21 = require(l_Modules_0.LuaApp.Components.TopBar.TopBarConstants);
local l_GetFFlagEnableUseShowTopBar_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEnableUseShowTopBar;
local l_FFlagLuaAppImproveInfoPeekView_0 = require(l_CorePackages_0.Workspace.Packages.AppBlox).FFlagLuaAppImproveInfoPeekView;
local v24 = require(l_Modules_0.LuaApp.Flags.FFlagLuaAppImproveAccountSwitcherPeekView);
local v25 = l_GuiService_0:IsTenFootInterface();
local v26 = l_Images_0["icons/navigation/pushBack"];
return function(v27, v28)
    local v29 = v6.PureComponent:extend("BackButton");
    v29.validateProps = v5.strictInterface({
        formFactor = v5.string, 
        isCompactView = v5.boolean, 
        isUnderTitleSearchBarEnabled = v5.boolean, 
        isSearching = v5.boolean, 
        isSecondary = v5.optional(v5.boolean), 
        setVisible = v4.isCallable, 
        cancelSearch = v4.isCallable, 
        activateSearch = v4.isCallable, 
        buttonRef = v5.optional(v5.table), 
        currentRoute = v5.table, 
        navigateBack = v4.isCallable, 
        navigation = v5.table, 
        analytics = v5.table
    });
    local function _(v30)
        if not if not l_GetFFlagEnableUseShowTopBar_0() then v25 else false then
            local l_currentRoute_0 = v30.currentRoute;
            return l_currentRoute_0[#l_currentRoute_0].name == v16.AvatarExperienceRoot;
        else
            return true;
        end;
    end;
    local function _(v33)
        return ((not not v33 and v33.state) and v33.state.routeName or "") ~= v17.AvatarExperienceLandingPage;
    end;
    v29.init = function(v35)
        v35.defaultBackButtonHandler = function()
            local l_analytics_0 = v35.props.analytics;
            local l_currentRoute_1 = v35.props.currentRoute;
            local l_navigation_0 = v35.props.navigation;
            local l_navigateBack_0 = v35.props.navigateBack;
            local l_props_0 = v35.props;
            local v41;
            if not if not l_GetFFlagEnableUseShowTopBar_0() then v25 else false then
                local l_currentRoute_2 = l_props_0.currentRoute;
                v41 = l_currentRoute_2[#l_currentRoute_2].name == v16.AvatarExperienceRoot;
            else
                v41 = true;
            end;
            if not v41 then
                l_analytics_0.reportBackButtonClick(l_currentRoute_1[#l_currentRoute_1].name);
                l_navigateBack_0();
                return ;
            else
                l_analytics_0.reportBackButtonClick(l_navigation_0.state.routeName);
                l_navigation_0.goBack();
                return ;
            end;
        end;
        v35.onBackButtonActivated = v27 or v35.defaultBackButtonHandler;
    end;
    local function v49(v43)
        if not v28 then
            local v44;
            if not if not l_GetFFlagEnableUseShowTopBar_0() then v25 else false then
                local l_currentRoute_3 = v43.currentRoute;
                v44 = l_currentRoute_3[#l_currentRoute_3].name == v16.AvatarExperienceRoot;
            else
                v44 = true;
            end;
            if not v44 then
                v44 = v43.currentRoute;
                for v46 = #v44, 1, -1 do
                    local l_name_0 = v44[v46].name;
                    if ((((((((l_name_0 ~= v16.GameDetail and l_name_0 ~= v16.ProfilePeekView) and l_name_0 ~= v16.InviteLinkExpiredModal) and l_name_0 ~= v16.ShareLinkInvalidModal) and l_name_0 ~= v16.SocialMessageToast) and l_name_0 ~= v16.SquadPage) and (not l_FFlagLuaAppImproveInfoPeekView_0 or l_name_0 ~= v16.InfoPeekView)) and (not l_FFlagLuaAppImproveInfoPeekView_0 or l_name_0 ~= v16.SponsoredTooltipPeekView)) and (not v24 or l_name_0 ~= v16.AccountSelectorPeekView)) and (not v24 or l_name_0 ~= v16.AccountSwitchingAddAccountPeekView) then
                        if (not v20[l_name_0] or not v20[l_name_0].nativeWrapper) or l_RunService_0:IsStudio() then
                            return v46 > 1;
                        else
                            return false;
                        end;
                    end;
                end;
                return false;
            else
                local l_navigation_1 = v43.navigation;
                return ((not not l_navigation_1 and l_navigation_1.state) and l_navigation_1.state.routeName or "") ~= v17.AvatarExperienceLandingPage;
            end;
        else
            return true;
        end;
    end;
    v29.updateVisibility = function(v50, v51)
        local v52 = v49(v50.props);
        if v52 ~= v51 then
            v50.props.setVisible(v52);
        end;
    end;
    v29.didMount = function(v53)
        v53:updateVisibility(nil);
    end;
    v29.didUpdate = function(v54, v55, _)
        v54:updateVisibility((v49(v55)));
    end;
    v29.render = function(v57)
        return l_withStyle_0(function(v58)
            return v6.createElement(l_IconButton_0, {
                size = UDim2.new(0, v21.BACK_BUTTON_SIZE, 1, 0), 
                position = if not v57.props.isSecondary then nil else UDim2.new(0, 0, 0, -8), 
                icon = v26, 
                iconSize = l_IconSize_0.Medium, 
                iconColor3 = v58.Theme.SystemPrimaryDefault.Color, 
                iconTransparency = v58.Theme.SystemPrimaryDefault.Transparency, 
                onActivated = v57.onBackButtonActivated, 
                inputBindings = {
                    Back = v18.Input.onBegin(Enum.KeyCode.ButtonB, v57.onBackButtonActivated)
                }, 
                buttonRef = v57.props.buttonRef
            });
        end);
    end;
    return (v7.connect(function(v59, _)
        local l_history_0 = v59.Navigation.history;
        return {
            currentRoute = l_history_0[#l_history_0]
        };
    end, function(v62)
        return {
            navigateBack = function()
                return v62(v19());
            end
        };
    end)((l_RoactServices_0.connect({
        analytics = v15
    })((v8.withNavigation(v29))))));
end;
