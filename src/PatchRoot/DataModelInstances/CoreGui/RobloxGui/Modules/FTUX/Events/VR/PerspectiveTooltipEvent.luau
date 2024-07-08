local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local _ = require(script.Parent.Parent.EventType);
local v3 = require(l_CorePackages_0.Roact);
local v4 = require(script.Parent.Parent.Parent.Components.Tooltips.VRFTUXToolTips);
local v5 = require(script.Parent.Parent.Parent.Parent.Common.renderWithCoreScriptsStyleProvider);
local v6 = {
    Name = "PerspectiveTooltipEvent"
};
local v7 = nil;
v6.StartEvent = function()
    v7 = v3.mount(v5({
        (v3.createElement(v4, {
            tooltipButtons = {
                {
                    Text = "Press", 
                    Controller = Enum.UserCFrame.RightHand, 
                    ButtonKeycode = Enum.KeyCode.ButtonR3
                }
            }
        }))
    }), l_CoreGui_0:FindFirstChild("FTUXMenu"), "PerspectiveTooltip");
end;
v6.StopEvent = function()
    if v7 then
        v3.unmount(v7);
    end;
end;
return v6;
