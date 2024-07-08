local l_script_FirstAncestor_0 = script:FindFirstAncestor("Localization");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_LocalizationService_0 = game:GetService("LocalizationService");
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.ArgCheck);
local v5 = require(l_script_FirstAncestor_0.RobloxLocaleIdKey);
local v6 = require(l_script_FirstAncestor_0.LocalizationRoactContext);
local v7 = require(l_script_FirstAncestor_0.localizeStrings);
local l_useSignal_0 = require(l_Parent_0.RoactUtils).Hooks.useSignal;
return function(v9)
    local v10 = v3.useContext(v6);
    local v11, v12 = v3.useState(l_LocalizationService_0.RobloxLocaleId);
    l_useSignal_0(v10.changed, (v3.useCallback(function(v13)
        v13 = v10:GetLocale();
        if v13 ~= v11 then
            v12(v13);
        end;
    end, {
        v10
    })));
    v4.isType(v9, "table", "LocalizationConsumer.props.stringsToBeLocalized");
    local v14 = v7(v10, v9);
    v14[v5] = v11;
    return v14;
end;
