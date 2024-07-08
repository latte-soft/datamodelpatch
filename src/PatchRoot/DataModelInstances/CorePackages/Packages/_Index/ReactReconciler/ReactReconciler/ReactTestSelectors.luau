local _ = require(script.Parent.Parent.LuauPolyfill);
local l_supportsTestSelectors_0 = require(script.Parent.ReactFiberHostConfig).supportsTestSelectors;
local v2 = {};
local v3 = {};
v2.onCommitRoot = function()
    if l_supportsTestSelectors_0 then
        for _, v5 in v3, nil, nil do
            v5();
        end;
    end;
end;
return v2;
