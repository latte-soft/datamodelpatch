local v0 = require(script.Parent.Parent.React);
local v1 = require(script.Parent.warnOnce);
return function(v2)
    if not (not _G.__DEV__ or not _G.__COMPAT_WARNINGS__) then
        v1("createFragment", "Please instead use:\n\tReact.createElement(React.Fragment, ...)");
    end;
    return v0.createElement(v0.Fragment, nil, v2);
end;
