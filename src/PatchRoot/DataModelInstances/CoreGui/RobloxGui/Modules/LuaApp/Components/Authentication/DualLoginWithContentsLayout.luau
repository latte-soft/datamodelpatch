local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.Cryo);
local v4 = require(l_Modules_0.LuaApp.Components.Authentication.DualLayoutBackButton);
local v5 = require(l_Modules_0.LuaApp.FitChildren);
local v6 = require(l_Modules_0.LuaApp.Enum.Alignment);
local l_useStyle_0 = require(l_CorePackages_0.UIBlox).Core.Style.useStyle;
local v8 = require(l_Modules_0.LuaApp.Hooks.useLocalization);
local l_useDesignTokens_0 = require(l_CorePackages_0.Workspace.Packages.Style).useDesignTokens;
local l_useUiModeInfo_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppHooks).useUiModeInfo;
local l_UiMode_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).UiMode;
local function v24(v12)
    local v13 = l_useStyle_0();
    local v14 = l_useDesignTokens_0();
    local l_Font_0 = v13.Font;
    local l_Theme_0 = v13.Theme;
    local l_children_0 = v12.children;
    local v18 = v12.ContentAlign or v6.Top;
    local l_Space_800_0 = v14.Global.Space_800;
    local l_Space_1000_0 = v14.Global.Space_1000;
    local v21 = v14.Global.FontSize_500 + v14.Global.Space_400;
    local v22 = l_useUiModeInfo_0();
    local v23 = {
        [v6.Top] = {
            Position = UDim2.new(0.5, 0, 0, 0), 
            AnchorPoint = Vector2.new(0.5, 0)
        }, 
        [v6.Bottom] = {
            Position = UDim2.new(0.5, 0, 1, 0), 
            AnchorPoint = Vector2.new(0.5, 1)
        }
    };
    return v2.createElement("Frame", {
        Position = UDim2.new(0, l_Space_800_0, 0, l_Space_1000_0), 
        Size = UDim2.new(1, -(2 * l_Space_800_0), 1, -(2 * l_Space_1000_0)), 
        AnchorPoint = Vector2.new(0, 0), 
        BackgroundTransparency = 1
    }, {
        {
            Title = v2.createElement("Frame", {
                Size = UDim2.new(1, 0, 1, 0), 
                AnchorPoint = Vector2.new(0, 0.5), 
                BackgroundTransparency = 1
            }, {
                BackButton = if v22.uiMode == l_UiMode_0.VR then v2.createElement(v4, {
                    navigateBack = v12.navigateBack
                }) else nil, 
                TitleLabel = v2.createElement("TextLabel", {
                    Text = v12.localized.title, 
                    TextSize = v14.Global.FontSize_500, 
                    Font = l_Font_0.Title.Font, 
                    TextXAlignment = Enum.TextXAlignment.Center, 
                    TextYAlignment = Enum.TextYAlignment.Center, 
                    TextTransparency = l_Theme_0.TextEmphasis.Transparency, 
                    TextColor3 = l_Theme_0.TextEmphasis.Color, 
                    Size = UDim2.new(1, 0, 1, 0), 
                    BackgroundTransparency = 1
                })
            }), 
            AlignmentContainer = v2.createElement("Frame", {
                BackgroundTransparency = 1, 
                Position = UDim2.new(0.5, 0, 0, v21), 
                Size = UDim2.new(1, 0, 1, -v21), 
                AnchorPoint = Vector2.new(0.5, 0), 
                ZIndex = 2
            }, {
                Content = v2.createElement(v5.FitFrame, {
                    Position = v23[v18].Position, 
                    Size = UDim2.new(1, 0, 1, 0), 
                    fitAxis = v5.FitAxis.Height, 
                    AnchorPoint = v23[v18].AnchorPoint, 
                    BackgroundTransparency = 1
                }, {
                    l_children_0
                })
            })
        }
    });
end;
return function(v25)
    return v2.createElement(v24, v3.Dictionary.join({
        localized = v8({
            title = "Authentication.Login.Heading.LoginRoblox"
        })
    }, v25));
end;
