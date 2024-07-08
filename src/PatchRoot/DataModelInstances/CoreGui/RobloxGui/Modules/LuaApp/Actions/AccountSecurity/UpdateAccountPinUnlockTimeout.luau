return require(game:GetService("CoreGui").RobloxGui.Modules.Common.Rodux).makeActionCreator(script.Name, function(v0)
    local v1 = true;
    if v0 ~= nil then
        v1 = typeof(v0) == "DateTime";
    end;
    assert(v1, "Expected the passed unlock time must be a valid `DateTime` or nil");
    return {
        accountPinUnlockedUntil = v0
    };
end);
