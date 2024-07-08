local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(l_CorePackages_0.RoactRodux);
local v4 = require(l_CorePackages_0.UIBlox);
local l_FormFactor_0 = require(l_CorePackages_0.Workspace.Packages.FormFactor).Enums.FormFactor;
local l_getSafeAreaSize_0 = require(l_CorePackages_0.Workspace.Packages.InputUi).getSafeAreaSize;
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local v8 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagCenteredModalViewAbsorbsInputs);
local l_withStyle_0 = v4.Style.withStyle;
local _ = require(l_CorePackages_0.Packages.React);
local function v12(v11)
    if not v11.wideMode then
        return UDim2.fromScale(1, 1);
    else
        return UDim2.new(0, math.min(l_getSafeAreaSize_0(v11.screenSize, v11.globalGuiInset).X.Offset, 640), 1, 0);
    end;
end;
return (v3.connect(function(v13, _)
    return {
        wideMode = v13.FormFactor == l_FormFactor_0.WIDE, 
        screenSize = v13.ScreenSize, 
        globalGuiInset = v13.GlobalGuiInset
    };
end, nil)(function(v15)
    local v16 = v12(v15);
    local v17 = v15[v2.Children];
    if v15.wideMode then
        return l_withStyle_0(function(v18)
            if not v8() then
                return v2.createElement("Frame", {
                    Size = UDim2.new(1, 0, 1, 0), 
                    BackgroundTransparency = v18.Theme.Overlay.Transparency, 
                    BackgroundColor3 = v18.Theme.Overlay.Color, 
                    Active = true
                }, {
                    Window = v2.createElement("Frame", {
                        AnchorPoint = Vector2.new(0.5, 0), 
                        Position = UDim2.new(0.5, 0, 0, 0), 
                        Size = v16, 
                        BackgroundTransparency = if not v15.backgroundTransparency then v18.Theme.BackgroundDefault.Transparency else v15.backgroundTransparency, 
                        BackgroundColor3 = v18.Theme.BackgroundDefault.Color, 
                        BorderSizePixel = 0
                    }, v17)
                });
            else
                return v2.createElement("TextButton", {
                    Size = UDim2.new(1, 0, 1, 0), 
                    BackgroundTransparency = v18.Theme.Overlay.Transparency, 
                    BackgroundColor3 = v18.Theme.Overlay.Color, 
                    Active = true, 
                    AutoButtonColor = false, 
                    Text = " "
                }, {
                    Window = v2.createElement("Frame", {
                        AnchorPoint = Vector2.new(0.5, 0), 
                        Position = UDim2.new(0.5, 0, 0, 0), 
                        Size = v16, 
                        BackgroundTransparency = if not v15.backgroundTransparency then v18.Theme.BackgroundDefault.Transparency else v15.backgroundTransparency, 
                        BackgroundColor3 = v18.Theme.BackgroundDefault.Color, 
                        BorderSizePixel = 0
                    }, v17)
                });
            end;
        end);
    else
        return v2.createFragment(v17);
    end;
end));
