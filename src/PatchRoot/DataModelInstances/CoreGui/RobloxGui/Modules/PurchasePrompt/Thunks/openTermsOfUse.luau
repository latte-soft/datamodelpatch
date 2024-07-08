local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Enums.UpsellFlow);
local v2 = require(l_Parent_0.NativeUpsell.getUpsellFlow);
local v3 = require(l_Parent_0.Services.ExternalSettings);
local v4 = require(l_Parent_0.Services.PlatformInterface);
local v5 = require(l_Parent_0.Thunk);
local v6 = {
    v3, 
    v4
};
return function()
    return v5.new(script.Name, v6, function(_, v8)
        local v9 = v8[v3];
        local v10 = v8[v4];
        if v2(v9.getPlatform()) == v1.Web then
            v10.openTermsOfUse();
        end;
    end);
end;
