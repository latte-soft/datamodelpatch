local v0 = require(script.Parent.GetFFlagExploreApiSortsEnabledByDefault);
local v1 = require(script.Parent.GetFFlagExploreApiSortsEnabledIXP);
return function()
    return v1() or v0();
end;
