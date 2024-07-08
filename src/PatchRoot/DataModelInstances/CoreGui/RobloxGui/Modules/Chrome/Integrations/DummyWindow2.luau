local v0 = require(game:GetService("CorePackages").Packages.React);
local v1 = require(script.Parent.Parent.Service);
local v2 = require(script.Parent.CommonIcon);
local v3 = require(script.Parent.Parent.Unibar.Constants);
return v1:register({
    initialAvailability = v1.AvailabilitySignal.Unavailable, 
    id = "dummy_window_2", 
    label = "CoreScripts.TopBar.Menu", 
    startingWindowPosition = UDim2.new(1, -245, 0, 95), 
    components = {
        Icon = function(_)
            return v2("icons/menu/home_on");
        end, 
        Window = function(_)
            return v0.createElement("Frame", {
                BackgroundTransparency = 0, 
                Size = UDim2.new(1, 0, 1, 0)
            }, {
                Corner = v0.createElement("UICorner", {
                    CornerRadius = v3.CORNER_RADIUS
                })
            });
        end
    }
});
