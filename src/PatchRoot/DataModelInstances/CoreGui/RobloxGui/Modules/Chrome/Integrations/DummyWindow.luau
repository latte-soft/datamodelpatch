local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.React);
local v2 = require(script.Parent.Parent.Service);
local v3 = require(script.Parent.CommonIcon);
local v4 = require(script.Parent.Parent.Unibar.Constants);
local v5 = require(script.Parent.Parent.Service.WindowSizeSignal);
local v6 = require(l_CorePackages_0.UIBlox);
local l_Images_0 = v6.App.ImageSet.Images;
local l_IconButton_0 = v6.App.Button.IconButton;
local v9 = l_Images_0["icons/navigation/cycleUp"];
local v10 = false;
local v11 = v5.new(v4.DEFAULT_WIDTH, v4.DEFAULT_HEIGHT);
local v12 = UDim2.new(1, -95, 0, 165);
v2:updateWindowPosition("dummy_window", v12);
return (v2:register({
    initialAvailability = v2.AvailabilitySignal.Unavailable, 
    id = "dummy_window", 
    label = "CoreScripts.TopBar.Menu", 
    draggable = true, 
    cachePosition = true, 
    startingWindowPosition = v12, 
    windowSize = v11, 
    components = {
        Icon = function(_)
            return v3("icons/menu/avatar_on");
        end, 
        Window = function(_)
            return v1.createElement("Frame", {
                BackgroundTransparency = 0, 
                Size = UDim2.new(1, 0, 1, 0)
            }, {
                Corner = v1.createElement("UICorner", {
                    CornerRadius = v4.CORNER_RADIUS
                }), 
                SizeIcon = v1.createElement(l_IconButton_0, {
                    icon = v9, 
                    iconSize = v4.CLOSE_ICON_SIZE, 
                    anchorPoint = Vector2.new(0.5, 1), 
                    position = UDim2.new(0.5, 0, 1, 0), 
                    backgroundTransparency = 0.5, 
                    onActivated = function()
                        if not v10 then
                            v11:requestSize(v4.DEFAULT_WIDTH_LARGE, v4.DEFAULT_HEIGHT_LARGE);
                            v10 = true;
                            return ;
                        else
                            v11:requestSize(v4.DEFAULT_WIDTH, v4.DEFAULT_HEIGHT);
                            v10 = false;
                            return ;
                        end;
                    end
                })
            });
        end
    }
}));
