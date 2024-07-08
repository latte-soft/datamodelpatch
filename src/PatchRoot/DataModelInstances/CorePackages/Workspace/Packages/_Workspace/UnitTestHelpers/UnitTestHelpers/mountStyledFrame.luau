local v0 = require(script.Parent.Parent.Roact);
local v1 = require(script.Parent.mockProviders);
return function(v2, v3)
    if v3 == nil then
        v3 = Instance.new("Frame");
    end;
    local v4 = v0.mount(v1(v2), v3);
    return v3, function()
        v0.unmount(v4);
        v3:Destroy();
    end;
end;
