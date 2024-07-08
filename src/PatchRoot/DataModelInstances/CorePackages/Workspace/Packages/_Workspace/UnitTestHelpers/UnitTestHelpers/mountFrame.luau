local l_HttpService_0 = game:GetService("HttpService");
local v1 = require(script.Parent.Parent.Roact);
local v2 = require(script.Parent.mockProviders);
return function(v3, v4)
    v4 = v4 or {};
    local l_parent_0 = v4.parent;
    if l_parent_0 == nil then
        l_parent_0 = Instance.new("Frame");
        l_parent_0.Name = l_HttpService_0:GenerateGUID(false);
    end;
    local v6 = v1.mount(v2(v3, v4), l_parent_0);
    return l_parent_0, function()
        v1.unmount(v6);
        l_parent_0:Destroy();
    end;
end;
