local l_script_FirstAncestor_0 = script:FindFirstAncestor("VirtualEvents");
local v1 = require(l_script_FirstAncestor_0.Parent.React);
local v2 = require(l_script_FirstAncestor_0.Parent.ReactRoblox);
local v3 = require(l_script_FirstAncestor_0.withMockProviders);
return function(v4)
    local v5 = v2.createRoot((Instance.new("ScreenGui")));
    local v6 = v3({
        HookTester = v1.createElement(function()
            v4();
            return nil;
        end)
    });
    v2.act(function()
        v5:render(v6);
    end);
end;
