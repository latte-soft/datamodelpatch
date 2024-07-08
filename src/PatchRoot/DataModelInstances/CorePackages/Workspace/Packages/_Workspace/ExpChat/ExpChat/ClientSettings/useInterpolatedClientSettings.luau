local v0 = require(script:FindFirstAncestor("ExpChat").Parent.React);
local v1 = require(script.Parent);
local v2 = require(script.Parent.ClientSettingsUtility);
return function(v3)
    local v4 = v0.useContext(v1);
    local v5, v6 = v0.useState({
        BackgroundColor = v2.getBackgroundColor(v3, v4), 
        BackgroundTransparency = v2.getBackgroundTransparency(v3, v4)
    });
    v0.useEffect(function()
        v6({
            BackgroundColor3 = v2.getBackgroundColor(v3, v4), 
            BackgroundTransparency = v2.getBackgroundTransparency(v3, v4)
        });
    end, {
        v3, 
        v4
    });
    return v5;
end;
