local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(l_Modules_0.LuaApp.withLocalization);
local l_withStyle_0 = require(l_CorePackages_0.UIBlox).Style.withStyle;
local l_useDesignTokens_0 = require(l_CorePackages_0.Workspace.Packages.Style).useDesignTokens;
local v6 = require(l_Modules_0.LuaApp.FitChildren);
local v7 = require(l_Modules_0.LuaApp.Components.FitTextLabel);
local v8 = require(l_Modules_0.LuaApp.Components.Authentication.CrossDeviceLogin.UserThumbnail);
return function(v9)
    local l_LoginView_0 = l_useDesignTokens_0().LuaApps.LoginView;
    return l_withStyle_0(function(v11)
        local l_UserId_0 = v9.UserId;
        local l_DisplayName_0 = v9.DisplayName;
        local l_Font_0 = v11.Font.Body.Font;
        local l_BaseSize_0 = v11.Font.BaseSize;
        local v16 = l_BaseSize_0 * v11.Font.Body.RelativeSize;
        local v17 = l_BaseSize_0 * v11.Font.CaptionBody.RelativeSize;
        local l_Transparency_0 = v11.Theme.TextEmphasis.Transparency;
        local l_Color_0 = v11.Theme.TextEmphasis.Color;
        local l_Color_1 = v11.Theme.BackgroundUIDefault.Color;
        local l_leftAlignText_0 = v9.leftAlignText;
        return v3({
            confirmLogin = "Authentication.CrossDevice.Label.ConfirmOnDevice", 
            loggingInAs = "Authentication.CrossDevice.Label.LogginInAs"
        })(function(v22)
            return v2.createFragment({
                UserThumbnail = v2.createElement(v8, {
                    Size = UDim2.new(0, l_LoginView_0.thumbnailSize, 0, l_LoginView_0.thumbnailSize), 
                    UserId = l_UserId_0, 
                    MaskColor = l_Color_1, 
                    LayoutOrder = 1
                }), 
                Spacer = v2.createElement("Frame", {
                    Size = UDim2.new(1, 0, 0, l_LoginView_0.spacerSize), 
                    BackgroundTransparency = 1, 
                    LayoutOrder = 2
                }), 
                ConfirmLogin = v2.createElement(v7, {
                    Size = UDim2.new(1, 0, 0, 0), 
                    fitAxis = v6.FitAxis.Height, 
                    Text = v22.confirmLogin, 
                    TextWrapped = true, 
                    BackgroundTransparency = 1, 
                    TextColor3 = l_Color_0, 
                    Font = l_Font_0, 
                    TextSize = v16, 
                    TextTransparency = l_Transparency_0, 
                    TextXAlignment = if not l_leftAlignText_0 then nil else Enum.TextXAlignment.Left, 
                    LayoutOrder = 3
                }), 
                LoggingInAs = l_DisplayName_0 and v2.createElement(v7, {
                    Size = UDim2.new(1, 0, 0, 0), 
                    fitAxis = v6.FitAxis.Height, 
                    Text = string.format(v22.loggingInAs, "<b>" .. l_DisplayName_0 .. "</b>"), 
                    TextWrapped = true, 
                    RichText = true, 
                    BackgroundTransparency = 1, 
                    TextColor3 = l_Color_0, 
                    Font = l_Font_0, 
                    TextSize = v17, 
                    TextTransparency = l_Transparency_0, 
                    TextXAlignment = if not l_leftAlignText_0 then nil else Enum.TextXAlignment.Left, 
                    LayoutOrder = 4
                })
            });
        end);
    end);
end;
