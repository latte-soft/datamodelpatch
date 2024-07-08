local l_HttpService_0 = game:GetService("HttpService");
local l_Parent_0 = script.Parent;
local v2 = require(l_Parent_0.Parent.Roact);
local v3 = require(l_Parent_0.mockStyle);
return function(v4)
    local l_Frame_0 = Instance.new("Frame");
    l_Frame_0.Name = l_HttpService_0:GenerateGUID(false);
    local v6 = v2.mount(v3(v4), l_Frame_0);
    return l_Frame_0, function()
        v2.unmount(v6);
        l_Frame_0:Destroy();
    end;
end;
