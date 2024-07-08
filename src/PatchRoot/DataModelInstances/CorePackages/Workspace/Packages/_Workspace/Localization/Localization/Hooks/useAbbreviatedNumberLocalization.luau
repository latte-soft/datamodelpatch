local l_script_FirstAncestor_0 = script:FindFirstAncestor("Localization");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_LocalizationService_0 = game:GetService("LocalizationService");
local v3 = require(l_Parent_0.React);
local v4 = require(l_script_FirstAncestor_0.abbreviateCount);
local v5 = require(l_script_FirstAncestor_0.LocalizationRoactContext);
local l_useSignal_0 = require(l_Parent_0.RoactUtils).Hooks.useSignal;
local l_dependencyArray_0 = require(l_Parent_0.RoactUtils).Hooks.dependencyArray;
return function(v8)
    local v9 = v3.useContext(v5);
    local v10, v11 = v3.useState(l_LocalizationService_0.RobloxLocaleId);
    l_useSignal_0(v9.changed, (v3.useCallback(function(v12)
        v12 = v9:GetLocale();
        if v12 ~= v10 then
            v11(v12);
        end;
    end, {
        v9
    })));
    return v3.useMemo(function()
        if v8 == nil then
            return nil;
        else
            return v4(v8, v10);
        end;
    end, l_dependencyArray_0(v8, v10));
end;
