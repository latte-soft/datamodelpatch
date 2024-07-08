local v0 = require(script.Parent.Parent.ReactRoblox);
local v1 = require(script.Parent.warnOnce);
return function(v2)
    if not (not _G.__DEV__ or not _G.__COMPAT_WARNINGS__) then
        v1("Roact.Portal", "Please use the createPortal API on ReactRoblox instead");
    end;
    return v0.createPortal(v2.children, v2.target);
end;
