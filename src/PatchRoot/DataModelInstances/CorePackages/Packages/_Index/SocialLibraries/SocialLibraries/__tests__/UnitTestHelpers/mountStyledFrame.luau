local l_Roact_0 = require(script.Parent.Parent.Parent.dependencies).Roact;
local v1 = require(script.Parent.mockProviders);
return function(v2, v3)
    if v3 == nil then
        v3 = Instance.new("Frame");
    end;
    local v4 = l_Roact_0.mount(v1(v2), v3);
    return v3, function()
        l_Roact_0.unmount(v4);
        v3:Destroy();
    end;
end;
