local l_UserGameSettings_0 = UserSettings():GetService("UserGameSettings");
local l_Actions_0 = script:FindFirstAncestor("ExpChat").Actions;
local v2 = require(l_Actions_0.ClientSettingsLoaded);
local v3 = require(l_Actions_0.ClientSettingsChanged);
return function(v4)
    v4:dispatch(v2({
        preferredTransparency = l_UserGameSettings_0.PreferredTransparency
    }));
    l_UserGameSettings_0:GetPropertyChangedSignal("PreferredTransparency"):Connect(function()
        v4:dispatch(v3("preferredTransparency", l_UserGameSettings_0.PreferredTransparency));
    end);
end;
