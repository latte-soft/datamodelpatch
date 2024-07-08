local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.React);
local l_useStyle_0 = require(l_CorePackages_0.UIBlox).Core.Style.useStyle;
local v3 = require(script.Parent.Parent.Service);
local v4 = require(script.Parent.RedVoiceDot);
local v5 = require(script.Parent.Parent.Flags.GetFFlagTweakedMicPinning);
ToggleMenuButton = function(v6)
    local l_toggleTransition_0 = v6.toggleTransition;
    local v8 = l_useStyle_0();
    local l_IconEmphasis_0 = v8.Theme.IconEmphasis;
    return v1.createElement("Frame", {
        Size = UDim2.new(0, 36, 0, 36), 
        BorderSizePixel = 0, 
        BackgroundColor3 = v8.Theme.BackgroundMuted.Color, 
        BackgroundTransparency = v8.Theme.BackgroundMuted.Transparency
    }, {
        v1.createElement("UICorner", {
            Name = "Corner", 
            CornerRadius = UDim.new(1, 0)
        }), 
        v1.createElement("Frame", {
            Name = "TopLine", 
            Position = l_toggleTransition_0:map(function(v10)
                return UDim2.new(0.5, 0, 0.5 - 0.17 * (1 - v10), 0);
            end), 
            AnchorPoint = Vector2.new(0.5, 0), 
            Size = UDim2.new(0, 16, 0, 2), 
            BorderSizePixel = 0, 
            BackgroundColor3 = l_IconEmphasis_0.Color, 
            BackgroundTransparency = l_IconEmphasis_0.Transparency, 
            Rotation = l_toggleTransition_0:map(function(v11)
                return 45 * v11;
            end)
        }), 
        v1.createElement("Frame", {
            Name = "CenterLine", 
            Position = UDim2.new(0.5, 0, 0.5, 0), 
            AnchorPoint = Vector2.new(0.5, 0), 
            Size = UDim2.new(0, 16, 0, 2), 
            BorderSizePixel = 0, 
            BackgroundColor3 = l_IconEmphasis_0.Color, 
            BackgroundTransparency = l_toggleTransition_0:map(function(v12)
                return 1 - (1 - l_IconEmphasis_0.Transparency) * (1 - v12);
            end)
        }), 
        v1.createElement("Frame", {
            Name = "BottomLine", 
            Position = l_toggleTransition_0:map(function(v13)
                return UDim2.new(0.5, 0, 0.5 + 0.17 * (1 - v13), 0);
            end), 
            AnchorPoint = Vector2.new(0.5, 0), 
            Size = UDim2.new(0, 16, 0, 2), 
            BorderSizePixel = 0, 
            BackgroundColor3 = l_IconEmphasis_0.Color, 
            BackgroundTransparency = l_IconEmphasis_0.Transparency, 
            Rotation = l_toggleTransition_0:map(function(v14)
                return -45 * v14;
            end)
        }), 
        if not v5() then v1.createElement("Frame", {
            Name = "RedVoiceDotVisibleContiner", 
            Visible = l_toggleTransition_0:map(function(v15)
                return v15 < 0.5;
            end), 
            Size = UDim2.new(1, 0, 1, 0), 
            BorderSizePixel = 0, 
            BackgroundTransparency = 1
        }, {
            v1.createElement(v4, {
                position = UDim2.new(1, -7, 1, -7)
            })
        }) else nil
    });
end;
return v3:register({
    id = "chrome_toggle", 
    label = "CoreScripts.TopBar.MenuToggle", 
    hideNotificationCountWhileOpen = true, 
    activated = function()
        v3:toggleOpen();
    end, 
    components = {
        Icon = function(v16)
            return ToggleMenuButton(v16);
        end
    }, 
    notification = v3:totalNotifications(), 
    initialAvailability = v3.AvailabilitySignal.Pinned
});
