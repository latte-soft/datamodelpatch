local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.LuaApp.Enum.AccountSecurity.DisplayType);
local v2 = require(l_Modules_0.LuaApp.Enum.AccountSecurity.PromptType);
return require(l_Modules_0.Common.Rodux).makeActionCreator(script.Name, function(v3, v4, v5)
    local v6 = true;
    if v4 ~= nil then
        v6 = v2.isEnumValue(v4);
        if not v6 then
            v6 = v3;
            if v6 then
                v6 = false;
                if typeof(v5) == "table" then
                    v6 = v1.isEnumValue(v1.fromRawValue(v5.displayType));
                end;
            end;
        end;
    end;
    assert(v6, "Expected the passed prompt type must either be a valid enum value or nil");
    return {
        isGeneric = v3, 
        promptType = v4, 
        metadata = v5, 
        lastUpdatedPromptTypeAt = DateTime.now()
    };
end);
