local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.UIBlox);
local l_TooltipOrientation_0 = v1.App.Dialog.Enum.TooltipOrientation;
local l_withTooltip_0 = v1.App.Dialog.TooltipV2.withTooltip;
local v4 = require(l_CorePackages_0.Packages.React);
return function(v5)
    local l_controllerPart_0 = v5.controllerPart;
    return l_withTooltip_0({
        bodyText = v5.tooltipText
    }, {
        preferredOrientation = l_TooltipOrientation_0.Bottom, 
        guiTarget = l_controllerPart_0:WaitForChild("BillboardGui"), 
        DisplayOrder = 0, 
        triggerPointName = "TriggerPart", 
        active = true, 
        DEBUG_useTargetDirectly = true
    }, function(v7)
        return v4.createElement("BillboardGui", {
            Parent = l_controllerPart_0, 
            Adornee = l_controllerPart_0, 
            AlwaysOnTop = true, 
            Active = false, 
            Size = UDim2.new(0.5, 0, 0.5, 0)
        }, {
            TriggerBody = v4.createElement("Frame", {
                Transparency = 1, 
                Size = UDim2.new(1, 0, 1, 0), 
                Position = UDim2.new(0.49, 0, 1.02, 0), 
                [v4.Change.AbsoluteSize] = v7, 
                [v4.Change.AbsolutePosition] = v7
            })
        });
    end);
end;
