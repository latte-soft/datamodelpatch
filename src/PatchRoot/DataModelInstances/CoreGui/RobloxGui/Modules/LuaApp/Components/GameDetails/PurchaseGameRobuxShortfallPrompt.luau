local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_Modules_0.Common.Roact);
local v3 = require(l_Modules_0.Common.RoactRodux);
local v4 = require(l_Modules_0.Common.Functional);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local l_AppGuiService_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppGuiService;
local v7 = require(l_Modules_0.LuaApp.Services.RoactLocalization);
local v8 = require(l_Modules_0.LuaApp.Components.AlertWindow);
local v9 = require(l_Modules_0.LuaApp.Thunks.CloseCentralOverlay);
local v10 = require(l_Modules_0.LuaApp.AppPage);
local v11 = require(l_Modules_0.LuaApp.Thunks.NavigateDown);
local v12 = require(l_Modules_0.LuaApp.withLocalization);
local v13 = require(l_Modules_0.LuaApp.ThemeContext_DEPRECATED);
local v14 = require(l_Modules_0.LuaApp.Flags.GetFFlagLuaAppUseWithLocalization);
local v15 = v2.PureComponent:extend("PurchaseGameRobuxShortfallPrompt");
v15.init = function(v16)
    v16.buyRobux = function()
        v16.props.closePrompt();
        v16.props.openPurchaseRobuxPage();
    end;
end;
v15.didMount = function(v17)
    local l_pageFilter_0 = v17.props.pageFilter;
    local l_currentPage_0 = v17.props.currentPage;
    local l_closePrompt_0 = v17.props.closePrompt;
    if not (not l_pageFilter_0 or v4.Find(l_pageFilter_0, l_currentPage_0)) then
        l_closePrompt_0();
    end;
end;
v15.render = function(v21)
    local l_theme_0 = v21.props.theme;
    local l_containerWidth_0 = v21.props.containerWidth;
    local l_robuxShortfall_0 = v21.props.robuxShortfall;
    local l_closePrompt_1 = v21.props.closePrompt;
    local l_localization_0 = v21.props.localization;
    local l_gameName_0 = v21.props.gameName;
    local function v29(v28)
        return v2.createElement(v13.Provider, {
            value = l_theme_0
        }, {
            AlertWindow = v2.createElement(v8, {
                containerWidth = l_containerWidth_0, 
                titleText = v28.titleText, 
                titleFont = l_theme_0.GameDetails.Text.BoldFont, 
                messageText = v28.messageText, 
                messageFont = l_theme_0.GameDetails.Text.Font, 
                buttonFont = l_theme_0.GameDetails.Text.Font, 
                confirmButtonText = v28.confirmButtonText, 
                onConfirm = v21.buyRobux, 
                hasCancelButton = true, 
                onCancel = l_closePrompt_1
            })
        });
    end;
    if not v14() then
        return v29({
            titleText = l_localization_0:Format("Feature.GameDetails.Heading.PurchaseGame"), 
            messageText = l_localization_0:Format("Feature.GameDetails.Message.BuyMoreRobuxToPurchaseGameV2", {
                gameName = l_gameName_0, 
                shortfallPrice = l_robuxShortfall_0
            }), 
            confirmButtonText = l_localization_0:Format("Feature.GameDetails.Action.BuyRobux")
        });
    else
        return v12({
            titleText = "Feature.GameDetails.Heading.PurchaseGame", 
            messageText = {
                "Feature.GameDetails.Message.BuyMoreRobuxToPurchaseGameV2"; 
                gameName = l_gameName_0, 
                shortfallPrice = l_robuxShortfall_0
            }, 
            confirmButtonText = "Feature.GameDetails.Action.BuyRobux"
        })(v29);
    end;
end;
return (l_RoactServices_0.connect({
    localization = v7, 
    guiService = l_AppGuiService_0
})((v3.connect(function(v30, _)
    local v32 = v30.Navigation.history[#v30.Navigation.history];
    return {
        currentPage = v32[#v32].name
    };
end, function(v33)
    return {
        closePrompt = function()
            v33(v9());
        end, 
        openPurchaseRobuxPage = function()
            return v33(v11({
                name = v10.PurchaseRobux
            }));
        end
    };
end)(v15))));
