local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_AppLinking_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppLinking;
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v4 = require(l_Modules_0.LuaApp.Enum.SocialMediaType);
local v5 = require(l_Modules_0.LuaApp.Components.DEPRECATED_ImageSetButton);
local v6 = require(l_Modules_0.LuaApp.Thunks.OpenCentralOverlayForLeaveRobloxAlert);
local v7 = require(l_Modules_0.LuaApp.Thunks.CloseCentralOverlay);
local l_Common_0 = l_Modules_0.Common;
local v9 = require(l_Common_0.Roact);
local v10 = require(l_Common_0.RoactRodux);
local v11 = require(l_Modules_0.LuaApp.withTheme_DEPRECATED);
local v12 = {
    [v4.Twitter] = "rbxasset://textures/ui/LuaApp/ExternalSite/twitter.png", 
    [v4.Facebook] = "rbxasset://textures/ui/LuaApp/ExternalSite/facebook.png", 
    [v4.Discord] = "rbxasset://textures/ui/LuaApp/ExternalSite/discord.png", 
    [v4.RobloxGroup] = "LuaApp/icons/GameDetails/social/RobloxGroup", 
    [v4.YouTube] = "rbxasset://textures/ui/LuaApp/ExternalSite/youtube.png", 
    [v4.Twitch] = "rbxasset://textures/ui/LuaApp/ExternalSite/twitch.png", 
    [v4.Amazon] = "rbxasset://textures/ui/LuaApp/ExternalSite/amazon.png", 
    [v4.Guilded] = "rbxasset://textures/ui/LuaApp/ExternalSite/guilded.png"
};
local v13 = v9.PureComponent:extend("SocialMediaButton");
v13.init = function(v14)
    v14.state = {
        buttonPressed = false
    };
    v14.onInputBegan = function(_, v16)
        if not (not (v16.UserInputState == Enum.UserInputState.Begin and (not (v16.UserInputType ~= Enum.UserInputType.Touch) or v16.UserInputType == Enum.UserInputType.MouseButton1)) or v14.state.buttonPressed) then
            v14:setState({
                buttonPressed = true
            });
        end;
    end;
    v14.onInputEnded = function()
        if v14.state.buttonPressed then
            v14:setState({
                buttonPressed = false
            });
        end;
    end;
    v14.onActivated = function()
        v14.props.openLeaveRobloxAlertUIBlox(v14.openUrl);
    end;
    v14.getUriParams = function()
        if v14.props.socialType == v4.Twitter then
            local v17 = v14.props.socialUrl:match("twitter.com/+([a-zA-Z0-9_]+)/*");
            if v17 ~= nil then
                return {
                    app_uri = "twitter://user?screen_name=" .. v17, 
                    web_uri = v14.props.socialUrl
                };
            end;
        end;
        return {
            app_uri = v14.props.socialUrl, 
            web_uri = v14.props.socialUrl
        };
    end;
    v14.openUrl = function()
        local v18 = v14.getUriParams();
        v14.props.linking:openURL(v18.app_uri):andThen(function(v19)
            if v19 == false then
                v14.props.linking:openURL(v18.web_uri);
            end;
        end);
        v14.props.closeAlert();
    end;
end;
v13.render = function(v20)
    local l_Size_0 = v20.props.Size;
    local l_socialType_0 = v20.props.socialType;
    local l_LayoutOrder_0 = v20.props.LayoutOrder;
    local l_buttonPressed_0 = v20.state.buttonPressed;
    local l_SocialMediaButton_0 = v20.props.appTheme.GameDetails.SocialMediaButton;
    return v9.createElement(v5, {
        Size = l_Size_0, 
        LayoutOrder = l_LayoutOrder_0, 
        Image = v12[l_socialType_0], 
        ImageTransparency = not not l_buttonPressed_0 and l_SocialMediaButton_0.OnPressTransparency or l_SocialMediaButton_0.Transparency, 
        BorderSizePixel = 0, 
        BackgroundTransparency = 1, 
        [v9.Event.Activated] = v20.onActivated, 
        [v9.Event.InputBegan] = v20.onInputBegan, 
        [v9.Event.InputEnded] = v20.onInputEnded
    });
end;
return l_RoactServices_0.connect({
    linking = l_AppLinking_0
})((v10.connect(function(_)
end, function(v27)
    return {
        openLeaveRobloxAlertUIBlox = function(v28)
            v27(v6(v28));
        end, 
        closeAlert = function()
            v27(v7());
        end
    };
end)((v11(v13)))));
