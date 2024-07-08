local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Thunk);
local v2 = require(l_Parent_0.Constants);
local v3 = require(l_Parent_0.Models.BundleInfo);
local v4 = require(l_Parent_0.Models.AssetInfo);
local v5 = require(l_Parent_0.Actions.SetBundles);
local v6 = require(l_Parent_0.Actions.SetAssets);
return function(v7, v8)
    return v1.new(script.Name, {}, function(v9, _)
        local v11 = v9:getState();
        if v8 == v2.ItemType.Asset then
            if v11.assets[v7] then
                v9:dispatch(v6({
                    (v4.fromPurchaseSuccess(v7))
                }));
                return ;
            end;
        elseif not (not (v8 == v2.ItemType.Bundle) or not v11.bundles[v7]) then
            v9:dispatch(v5({
                (v3.fromPurchaseSuccess(v7))
            }));
        end;
    end);
end;
