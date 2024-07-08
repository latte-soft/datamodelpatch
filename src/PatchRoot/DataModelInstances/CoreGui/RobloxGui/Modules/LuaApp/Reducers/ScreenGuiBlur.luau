local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Cryo);
local v3 = require(l_CorePackages_0.Rodux);
local v4 = require(l_CorePackages_0.tutils);
return v3.createReducer({
    hasBlur = false, 
    blurDisplayOrder = 0, 
    details = {}
}, {
    [require(l_Modules_0.LuaApp.Actions.SetScreenGuiBlur).name] = function(v5, v6)
        local v7 = nil;
        v7 = if v6.blur == true then v2.Dictionary.join(v5.details, {
            [v6.source] = v6.displayOrder
        }) else v2.Dictionary.join(v5.details, {
            [v6.source] = v2.None
        });
        local v8 = v4.fieldCount(v7) > 0;
        local v9 = 0;
        for _, v11 in pairs(v7) do
            v9 = math.max(v9, v11);
        end;
        return {
            hasBlur = v8, 
            blurDisplayOrder = v9, 
            details = v7
        };
    end
});
