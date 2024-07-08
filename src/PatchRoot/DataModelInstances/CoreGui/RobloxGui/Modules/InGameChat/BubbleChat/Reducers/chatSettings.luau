local l_CorePackages_0 = game:GetService("CorePackages");
local _ = require(l_CorePackages_0.Packages.Cryo);
local v2 = require(l_CorePackages_0.Packages.Rodux);
local v3 = require(script.Parent.Parent.Actions.UpdateChatSettings);
local v4 = require(script.Parent.Parent.ChatSettings);
local function v5(v6)
    if type(v6) ~= "table" then
        return v6;
    else
        local v7 = {};
        for v8, v9 in pairs(v6) do
            v7[v8] = v5(v9);
        end;
        return v7;
    end;
end;
local function v10(v11, v12)
    for v13, v14 in pairs(v12) do
        if type(v14) ~= "table" then
            v11[v13] = v14;
        elseif v11[v13] then
            v10(v11[v13], v14);
        end;
    end;
end;
return (v2.createReducer(v4, {
    [v3.name] = function(_, v16)
        local v17 = v5(v4);
        v10(v17, v16.settings);
        local l_UserSpecificSettings_0 = v16.settings.UserSpecificSettings;
        if l_UserSpecificSettings_0 then
            for v19, v20 in pairs(l_UserSpecificSettings_0) do
                local v21 = v5(v4);
                v21.UserSpecificSettings = nil;
                v10(v21, v20);
                v17.UserSpecificSettings[v19] = v21;
            end;
        end;
        return v17;
    end
}));
