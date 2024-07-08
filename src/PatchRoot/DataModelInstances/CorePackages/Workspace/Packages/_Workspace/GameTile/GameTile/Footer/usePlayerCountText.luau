local l_useAbbreviatedNumberLocalization_0 = require(script:FindFirstAncestor("GameTile").Parent.Localization).Hooks.useAbbreviatedNumberLocalization;
return function(v1)
    local v2 = l_useAbbreviatedNumberLocalization_0(v1);
    if not (v2 ~= nil) or v1 == -1 then
        return "--";
    else
        return v2;
    end;
end;
