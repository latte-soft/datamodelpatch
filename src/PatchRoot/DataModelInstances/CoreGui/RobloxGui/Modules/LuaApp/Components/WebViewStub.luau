local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Roact);
local l_withStyle_0 = require(l_CorePackages_0.UIBlox).Style.withStyle;
local v4 = require(l_Modules_0.LuaApp.Components.TopBar.TopBar);
local l_isRunningInStudio_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).isRunningInStudio;
local v6 = require(l_Modules_0.LuaApp.Flags.GetFFlagLuaAppWebViewsSinkInput);
local function v14(v7, v8)
    local v9 = v6();
    local v10 = v7.isVisible or false;
    local _ = v7.DisplayOrder or 0;
    if not l_isRunningInStudio_0() then
        local l_Overlay_0 = v8.Theme.Overlay;
        return v2.createElement(not v9 and "Frame" or "TextButton", {
            Visible = v10, 
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundColor3 = l_Overlay_0.Color, 
            BackgroundTransparency = l_Overlay_0.Transparency, 
            Text = if not v9 then nil else "", 
            Active = if not v9 then nil else false, 
            AutoButtonColor = if not v9 then nil else false, 
            Selectable = if not v9 then nil else false
        });
    else
        local l_BackgroundDefault_0 = v8.Theme.BackgroundDefault;
        return v2.createElement("Frame", {
            Visible = v10, 
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundColor3 = l_BackgroundDefault_0.Color, 
            BackgroundTransparency = l_BackgroundDefault_0.Transparency
        }, {
            TopBar = v2.createElement(v4.Container, {
                titleText = "WebViewStub", 
                leftItem = v4.BackButton
            })
        });
    end;
end;
return function(v15)
    return l_withStyle_0(function(v16)
        return v14(v15, v16);
    end);
end;
