local l_StarterGui_0 = game:GetService("StarterGui");
local v1 = require(script.Parent.Actions.SetTopBarEnabled);
return function(v2)
    l_StarterGui_0:RegisterSetCore("TopbarEnabled", function(v3)
        if type(v3) == "boolean" then
            v2:dispatch(v1(v3));
            return ;
        else
            error("SetCore TopbarEnabled argument must be a boolean", 2);
            return ;
        end;
    end);
    l_StarterGui_0:RegisterGetCore("TopbarEnabled", function()
        return v2:getState().displayOptions.topbarEnabled;
    end);
end;
