local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Cryo);
local v2 = require(l_CorePackages_0.Rodux);
local l_Parent_0 = script.Parent.Parent;
local v4 = require(l_Parent_0.Actions.SetBundles);
local v5 = require(l_Parent_0.Models.BundleInfo);
local v6 = require(l_Parent_0.Flags.GetFFlagIBFixBuyingFromResellers);
return v2.createReducer({}, {
    [v4.name] = function(v7, v8)
        local v9 = {};
        for _, v11 in ipairs(v8.bundles) do
            assert(v11.bundleId ~= nil, "Expected a bundle id when setting a bundle's information.");
            v9[v11.bundleId] = v1.Dictionary.join(v7[v11.bundleId] or {}, v11);
            if v6() then
                local v12 = v9[v11.bundleId];
                if v12 then
                    v9[v11.bundleId] = v5.getSaleDetailsForCollectibles(v12);
                end;
            end;
        end;
        return v1.Dictionary.join(v7, v9);
    end
});
