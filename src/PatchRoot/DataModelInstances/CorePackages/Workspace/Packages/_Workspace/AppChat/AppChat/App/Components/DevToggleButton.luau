local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local v1 = require(l_script_FirstAncestor_0.Parent.React);
local l_setDisplaying_0 = require(l_script_FirstAncestor_0.App.RemoteDisplaying).setDisplaying;
return function(v3)
    return v1.createElement("TextButton", {
        Size = UDim2.fromOffset(50, 50), 
        Position = UDim2.new(0, 10, 1, -60), 
        Text = "appchat", 
        ZIndex = 2, 
        [v1.Event.Activated] = function()
            l_setDisplaying_0(not v3.displaying);
        end
    });
end;
