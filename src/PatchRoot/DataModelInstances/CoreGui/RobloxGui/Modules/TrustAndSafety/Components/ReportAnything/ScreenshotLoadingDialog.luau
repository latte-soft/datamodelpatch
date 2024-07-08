local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.UIBlox);
local v2 = require(l_CorePackages_0.Packages.React);
local l_ButtonStack_0 = v1.App.Button.ButtonStack;
local l_ButtonType_0 = v1.App.Button.Enum.ButtonType;
return function(v5)
    return v2.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 0
    }, {
        Buttons = v2.createElement(l_ButtonStack_0, {
            buttons = {
                {
                    buttonType = l_ButtonType_0.PrimarySystem, 
                    props = {
                        onActivated = function()
                            v5.onNextPage();
                        end, 
                        text = "This is page 1. Click to go next"
                    }
                }
            }
        })
    });
end;
