local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local l_Parent_0 = script.Parent.Parent.Parent;
local v2 = require(l_Parent_0.React);
local l_LocalizationRoactContext_0 = require(l_Parent_0.Localization).LocalizationRoactContext;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local _ = require(script:FindFirstAncestor("NotificationsCommon").type);
local v6 = nil;
local l_RobloxTranslator_0 = l_RobloxGui_0.Modules:FindFirstChild("RobloxTranslator");
if l_RobloxTranslator_0 then
    local l_status_0, l_result_0 = pcall(function()
        return require(l_RobloxTranslator_0);
    end);
    if l_status_0 then
        v6 = l_result_0;
    end;
end;
return {
    getLocalizedStrings = function(v10)
        if v2.useContext(l_LocalizationRoactContext_0) ~= nil then
            return l_useLocalization_0(v10);
        elseif not v6 then
            return v10;
        else
            local v11 = {};
            for v12, v13 in pairs(v10) do
                local l_status_1, l_result_1 = pcall(function()
                    return v6:FormatByKey(v13);
                end);
                if not l_status_1 then
                    v11[v12] = v13;
                else
                    v11[v12] = l_result_1;
                end;
            end;
            return v11;
        end;
    end
};
