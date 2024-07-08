local l_CorePackages_0 = game:GetService("CorePackages");
local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.UIBlox);
local l_useStyle_0 = v3.Core.Style.useStyle;
local l_ImageSetLabel_0 = v3.Core.ImageSet.ImageSetLabel;
local l_Images_0 = v3.App.ImageSet.Images;
local v7 = require(script.Parent.Parent.Parent.SelfieView);
local l_default_0 = require(l_RobloxGui_0.Modules.VoiceChat.VoiceChatServiceManager).default;
local v9 = require(script.Parent.Parent.Service);
local v10 = require(script.Parent.RedVoiceDot);
local v11 = require(script.Parent.Parent.Unibar.Constants);
local l_GetFFlagSupportCompactUtility_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagSupportCompactUtility;
local v13 = require(script.Parent.Parent.Flags.GetFFlagTweakedMicPinning);
local v14 = require(script.Parent.Parent.Flags.GetFFlagUseNewUnibarIcon);
local v15 = require(script.Parent.Parent.Flags.GetFFlagUsePolishedAnimations);
local v16 = require(script.Parent.Parent.Flags.GetFFlagUseSelfieViewFlatIcon);
local v17 = l_Images_0["icons/actions/overflow"];
local v18 = if not v14() then v11.ICON_SIZE else 32;
local v19 = nil;
ToggleMenuButton = function(v20)
    local l_toggleTransition_0 = v20.toggleTransition;
    local v22 = l_useStyle_0();
    local v23 = false;
    if l_GetFFlagSupportCompactUtility_0() then
        v23 = not not v9:getCurrentUtility():get() or false;
    end;
    local l_IconEmphasis_0 = v22.Theme.IconEmphasis;
    return v2.createElement("Frame", {
        Size = UDim2.new(0, 36, 0, 36), 
        BorderSizePixel = 0, 
        BackgroundColor3 = v22.Theme.BackgroundOnHover.Color, 
        BackgroundTransparency = l_toggleTransition_0:map(function(v25)
            return 1 - (1 - v22.Theme.BackgroundOnHover.Transparency) * v25;
        end)
    }, {
        v2.createElement("UICorner", {
            Name = "Corner", 
            CornerRadius = UDim.new(1, 0)
        }), 
        v2.createElement(l_ImageSetLabel_0, {
            Name = not v14() and "Cube" or "Overflow", 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Position = UDim2.new(0.5, 0, 0.5, 0), 
            BackgroundTransparency = 1, 
            Image = if not v14() then l_Images_0["icons/menu/AR"] else v17, 
            Size = l_toggleTransition_0:map(function(v26)
                v26 = 1 - v26;
                return UDim2.new(0, v18 * v26, 0, v18 * v26);
            end), 
            Visible = if not v15() then nil else l_toggleTransition_0:map(function(v27)
                if v27 == 1 then
                    v19 = false;
                end;
                return v19 or v9:status():get() == v9.MenuStatus.Closed;
            end), 
            ImageColor3 = v22.Theme.IconEmphasis.Color, 
            ImageTransparency = v22.Theme.IconEmphasis.Transparency
        }), 
        v2.createElement("Frame", {
            Name = "X1", 
            Position = l_toggleTransition_0:map(function(_)
                return UDim2.new(0.5, 0, 0.5, 0);
            end), 
            AnchorPoint = if v14() or v15() then Vector2.new(0.5, 0.5) else Vector2.new(0.5, 0), 
            Size = l_toggleTransition_0:map(function(v29)
                return UDim2.new(0, 16 * v29, 0, 2);
            end), 
            Visible = if not l_GetFFlagSupportCompactUtility_0() then nil else not v23, 
            BorderSizePixel = 0, 
            BackgroundColor3 = l_IconEmphasis_0.Color, 
            BackgroundTransparency = if not v15() then l_IconEmphasis_0.Transparency else l_toggleTransition_0:map(function(v30)
                return 1 - v30;
            end), 
            Rotation = 45
        }), 
        v2.createElement("Frame", {
            Name = "X2", 
            Position = l_toggleTransition_0:map(function(_)
                return UDim2.new(0.5, 0, 0.5, 0);
            end), 
            AnchorPoint = if v14() or v15() then Vector2.new(0.5, 0.5) else Vector2.new(0.5, 0), 
            Size = l_toggleTransition_0:map(function(v32)
                return UDim2.new(0, 16 * v32, 0, 2);
            end), 
            Visible = if not l_GetFFlagSupportCompactUtility_0() then nil else not v23, 
            BorderSizePixel = 0, 
            BackgroundColor3 = l_IconEmphasis_0.Color, 
            BackgroundTransparency = if not v15() then l_IconEmphasis_0.Transparency else l_toggleTransition_0:map(function(v33)
                return 1 - v33;
            end), 
            Rotation = -45
        }), 
        v2.createElement(l_ImageSetLabel_0, {
            Name = "Arrow", 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Position = l_toggleTransition_0:map(function(_)
                return UDim2.new(0.5, 0, 0.5, 0);
            end), 
            BackgroundTransparency = 1, 
            Image = l_Images_0["icons/actions/truncationCollapse_small"], 
            Size = l_toggleTransition_0:map(function(v35)
                if v15() then
                    v35 = 1 - v35;
                end;
                return UDim2.new(0, 16 * v35, 0, 16 * v35);
            end), 
            Visible = if not v15() then v23 else l_toggleTransition_0:map(function(_)
                return not (v19 or v9:status():get() == v9.MenuStatus.Closed);
            end), 
            ImageColor3 = v22.Theme.IconEmphasis.Color, 
            ImageTransparency = v22.Theme.IconEmphasis.Transparency, 
            Rotation = 270
        }), 
        if not v13() then v2.createElement("Frame", {
            Name = "RedVoiceDotVisibleContiner", 
            Visible = l_toggleTransition_0:map(function(v37)
                return v37 < 0.5;
            end), 
            Size = UDim2.new(1, 0, 1, 0), 
            BorderSizePixel = 0, 
            BackgroundTransparency = 1
        }, {
            v2.createElement(v10, {
                position = UDim2.new(1, -7, 1, -7)
            })
        }) else nil, 
        if not v16() then nil else v2.createElement("Frame", {
            Name = "GreenCameraDotVisibleContiner", 
            Visible = l_toggleTransition_0:map(function(v38)
                return v38 < 0.5;
            end), 
            Size = UDim2.new(1, 0, 1, 0), 
            BorderSizePixel = 0, 
            BackgroundTransparency = 1
        }, {
            v7.useCameraOn() and v2.createElement(v7.CameraStatusDot, {
                Position = if v13() or l_default_0.localMuted then UDim2.new(1, -7, 1, -8) else UDim2.new(1, -7, 1, -12), 
                ZIndex = 2
            })
        })
    });
end;
return v9:register({
    id = "chrome_toggle", 
    label = "CoreScripts.TopBar.MenuToggle", 
    hideNotificationCountWhileOpen = true, 
    flashNotificationSource = true, 
    activated = function()
        if not l_GetFFlagSupportCompactUtility_0() or v15() then
            v9:toggleOpen();
        else
            local v39 = v9:getCurrentUtility():get();
            if not v39 then
                v9:toggleOpen();
            else
                v9:toggleCompactUtility(v39);
            end;
        end;
        v19 = true;
    end, 
    components = {
        Icon = function(v40)
            return v2.createElement(ToggleMenuButton, v40);
        end
    }, 
    notification = v9:totalNotifications(), 
    initialAvailability = v9.AvailabilitySignal.Pinned
});
