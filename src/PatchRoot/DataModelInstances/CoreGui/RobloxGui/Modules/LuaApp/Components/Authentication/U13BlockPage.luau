local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.RoactRodux);
local v4 = require(l_Modules_0.LuaApp.Thunks.Authentication.Logout);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local l_AppGuiService_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppGuiService;
local v7 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local v8 = require(l_Modules_0.LuaApp.Flags.GetFFlagUseUpdatedAgeBlockLanguage);
local v9 = require(l_Modules_0.LuaApp.Analytics.Events.Auth.luaLogoutReasonNames);
local v10 = require(l_Modules_0.Common.Roact);
local v11 = require(l_CorePackages_0.UIBlox);
local l_StyledTextLabel_0 = v11.App.Text.StyledTextLabel;
local l_FullPageModal_0 = v11.App.Dialog.Modal.FullPageModal;
local l_withStyle_0 = v11.Style.withStyle;
local v15 = require(l_Modules_0.LuaApp.withLocalization);
local v16 = v2.PureComponent:extend("U13BlockPage");
v16.init = function(v17)
    v17.logOut = function()
        v17.props.logoutWithoutShowConfirmation(v17.props.networkImpl, v17.props.guiService);
    end;
end;
v16.render = function(v18)
    return v15({
        u13BlockText = not v8() and "CommonUI.Messages.Label.FeatureNotAvailableForAccount" or "CommonUI.Messages.Label.AgeBlock", 
        logOutText = "Application.Logout.Action.Logout"
    })(function(v19)
        return l_withStyle_0(function(v20)
            return v10.createElement(l_FullPageModal_0, {
                screenSize = Vector2.new(1920, 1080), 
                marginSize = 0, 
                distanceFromTop = 400, 
                onCloseClicked = v18.logOut, 
                buttonStackProps = {
                    buttons = {
                        {
                            props = {
                                isDisabled = false, 
                                onActivated = v18.logOut, 
                                text = v19.logOutText
                            }
                        }
                    }
                }
            }, {
                UIListLayout = v10.createElement("UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    VerticalAlignment = Enum.VerticalAlignment.Center, 
                    FillDirection = Enum.FillDirection.Vertical
                }), 
                TextLabel = v10.createElement(l_StyledTextLabel_0, {
                    automaticSize = Enum.AutomaticSize.Y, 
                    colorStyle = {
                        Color = Color3.new(0, 0, 0), 
                        Transparency = 0
                    }, 
                    fontStyle = v20.Font.Body, 
                    lineHeight = 1, 
                    size = UDim2.new(1, 0, 0, 0), 
                    text = v19.u13BlockText, 
                    textXAlignment = Enum.TextXAlignment.Center, 
                    textYAlignment = Enum.TextYAlignment.Bottom
                })
            });
        end);
    end);
end;
return l_RoactServices_0.connect({
    guiService = l_AppGuiService_0, 
    networkImpl = v7
})((v3.connect(function(_, _)
end, function(v23)
    return {
        logoutWithoutShowConfirmation = function(v24, v25)
            v23(v4(v24, v25, v9.MoreLogOut));
        end
    };
end)(v16)));
