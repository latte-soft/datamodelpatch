local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.React);
local v2 = require(l_CorePackages_0.UIBlox);
local l_useStyle_0 = v2.Core.Style.useStyle;
local l_ImageSetLabel_0 = v2.Core.ImageSet.ImageSetLabel;
local l_Images_0 = v2.App.ImageSet.Images;
local v6 = require(script.Parent.Parent.Service);
local l_GetFFlagSupportCompactUtility_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagSupportCompactUtility;
CompactUtilityBackButton = function(v8)
    local l_toggleTransition_0 = v8.toggleTransition;
    local v10 = l_useStyle_0();
    local v11 = false;
    if l_GetFFlagSupportCompactUtility_0() then
        v11 = not not v6:getCurrentUtility():get() or false;
    end;
    local l_IconEmphasis_0 = v10.Theme.IconEmphasis;
    return v1.createElement("Frame", {
        Size = UDim2.new(0, 36, 0, 36), 
        BorderSizePixel = 0, 
        BackgroundColor3 = v10.Theme.BackgroundOnHover.Color, 
        BackgroundTransparency = l_toggleTransition_0:map(function(v13)
            return 1 - (1 - v10.Theme.BackgroundOnHover.Transparency) * v13;
        end)
    }, {
        v1.createElement("UICorner", {
            Name = "Corner", 
            CornerRadius = UDim.new(1, 0)
        }), 
        v1.createElement(l_ImageSetLabel_0, {
            Name = "Arrow", 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Position = l_toggleTransition_0:map(function(_)
                return UDim2.new(0.5, 0, 0.5, 0);
            end), 
            BackgroundTransparency = 1, 
            Image = l_Images_0["icons/actions/truncationCollapse_small"], 
            Size = l_toggleTransition_0:map(function(v15)
                return UDim2.new(0, 16 * v15, 0, 16 * v15);
            end), 
            Visible = v11, 
            ImageColor3 = v10.Theme.IconEmphasis.Color, 
            ImageTransparency = v10.Theme.IconEmphasis.Transparency, 
            Rotation = 270
        }), 
        v1.createElement("Frame", {
            Name = "X1", 
            Position = l_toggleTransition_0:map(function(_)
                return UDim2.new(0.5, 0, 0.5, 0);
            end), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Size = l_toggleTransition_0:map(function(v17)
                return UDim2.new(0, 16 * (1 - v17), 0, 2);
            end), 
            BorderSizePixel = 0, 
            BackgroundColor3 = l_IconEmphasis_0.Color, 
            BackgroundTransparency = l_IconEmphasis_0.Transparency, 
            Rotation = 45
        }), 
        (v1.createElement("Frame", {
            Name = "X2", 
            Position = l_toggleTransition_0:map(function(_)
                return UDim2.new(0.5, 0, 0.5, 0);
            end), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Size = l_toggleTransition_0:map(function(v19)
                return UDim2.new(0, 16 * (1 - v19), 0, 2);
            end), 
            BorderSizePixel = 0, 
            BackgroundColor3 = l_IconEmphasis_0.Color, 
            BackgroundTransparency = l_IconEmphasis_0.Transparency, 
            Rotation = -45
        }))
    });
end;
return v6:register({
    id = "compact_utility_back", 
    label = "CoreScripts.TopBar.Back", 
    activated = function()
        local v20 = v6:getCurrentUtility():get();
        if v20 then
            v6:toggleCompactUtility(v20);
        end;
    end, 
    components = {
        Icon = function(v21)
            return v1.createElement(CompactUtilityBackButton, v21);
        end
    }, 
    initialAvailability = v6.AvailabilitySignal.Pinned
});
