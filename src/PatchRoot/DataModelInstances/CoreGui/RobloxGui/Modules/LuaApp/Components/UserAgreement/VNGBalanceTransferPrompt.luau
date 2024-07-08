local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(l_CorePackages_0.RoactRodux);
local v4 = require(l_CorePackages_0.UIBlox);
local l_InteractiveAlert_0 = v4.App.Dialog.Alert.InteractiveAlert;
local l_ButtonType_0 = v4.App.Button.Enum.ButtonType;
local l_withStyle_0 = v4.Core.Style.withStyle;
local v8 = require(l_Modules_0.LuaApp.withLocalization);
local v9 = require(l_Modules_0.LuaApp.Thunks.NavigateDown);
local v10 = require(l_Modules_0.LuaApp.openExternalBrowser);
local l_RoactAppPolicy_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy;
local v12 = require(l_Modules_0.LuaApp.Http.UrlBuilder);
local v13 = require(l_Modules_0.LuaApp.AppPage);
local v14 = v2.Component:extend(script.Name);
v14.defaultProps = {
    anchorPoint = Vector2.new(0.5, 0.5), 
    position = UDim2.new(0.5, 0, 0.5, 0)
};
v14.init = function(v15)
    v15.supportFormActivated = function(v16)
        if not v15.props.useExternalBrowserForDisclaimerLinks then
            v15.props.navigateDown({
                name = v13.GenericWebPage, 
                detail = v12.static.about.support(), 
                extraProps = {
                    title = v16.support
                }
            });
            return ;
        else
            v10(v15.props.linking, v12.static.about.support());
            return ;
        end;
    end;
end;
v14.render = function(v17)
    return v8({
        title = "CommonUI.UserAgreements.Popup.TransferCurrency.Title", 
        message = "CommonUI.UserAgreements.Popup.TransferCurrency.Message", 
        button = "CommonUI.UserAgreements.Popup.ContactCustomerSupport", 
        support = "Feature.Moderation.Link.SupportForm"
    })(function(v18)
        return l_withStyle_0(function(v19)
            return v17:renderWithProviders(v18, v19);
        end);
    end);
end;
v14.renderWithProviders = function(v20, v21, _)
    local l_props_0 = v20.props;
    return v2.createElement(l_InteractiveAlert_0, {
        anchorPoint = l_props_0.anchorPoint, 
        position = l_props_0.position, 
        screenSize = l_props_0.screenSize, 
        title = v21.title, 
        bodyText = v21.message, 
        buttonStackInfo = {
            buttons = {
                {
                    buttonType = l_ButtonType_0.PrimarySystem, 
                    props = {
                        onActivated = function()
                            v20.supportFormActivated(v21);
                            l_props_0.doneActivated();
                        end, 
                        text = v21.button
                    }
                }
            }
        }
    });
end;
return (v3.connect(nil, function(v24)
    return {
        navigateDown = function(v25)
            v24(v9(v25));
        end
    };
end)((l_RoactAppPolicy_0.connect(function(v26)
    return {
        useExternalBrowserForDisclaimerLinks = v26.shouldUseExternalBrowserForDisclaimerLinks()
    };
end)(v14))));
