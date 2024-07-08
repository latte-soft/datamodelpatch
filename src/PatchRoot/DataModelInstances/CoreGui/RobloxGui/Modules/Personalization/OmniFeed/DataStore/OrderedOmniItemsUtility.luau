local v0 = require(game:GetService("CorePackages").Workspace.Packages.ArgCheck);
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_Modules_0.Personalization.OmniFeed.OmniFeedConstants);
local _ = require(l_Modules_0.Personalization.DataStoreTypes);
local v4 = require(l_Modules_0.Personalization.OmniFeed.OmniFeedItemMap);
local v5 = require(l_Modules_0.Personalization.OmniFeed.DataStore.FeedItemModel);
return {
    combineOmniFeedItems = function(v6, v7)
        local v8 = {};
        local v9 = {};
        if v7 then
            for _, v11 in ipairs(v7) do
                if not (not (v11.dataSource ~= v2.DataSource.Local) or not v4.hasComponent(v11.treatmentType)) then
                    local v12 = v5.getUniqueNameForFeed(v11);
                    if v12 then
                        v0.assert(v9[v12] == nil, "Duplicate feed item id detected: " .. tostring(v12));
                        v9[v12] = v11;
                    end;
                    table.insert(v8, v11);
                end;
            end;
        end;
        if v6 then
            for _, v14 in ipairs(v6) do
                if not (not (v14.dataSource == v2.DataSource.Local) or not v4.hasComponent(v14.treatmentType)) then
                    local v15 = v5.getUniqueNameForFeed(v14);
                    assert(v15);
                    if v9[v15] == nil then
                        v9[v15] = v14;
                        local v16 = nil;
                        if v14.orderHint then
                            v16 = v14.orderHint;
                            while not (not (not (not (v16 <= #v8) or not v8[v16]) and v8[v16].dataSource == v2.DataSource.Local) or not v8[v16].orderHint) and v8[v16].orderHint == v14.orderHint do
                                v16 = v16 + 1;
                            end;
                        end;
                        if v16 ~= nil and v16 <= #v8 then
                            table.insert(v8, v16, v14);
                        else
                            table.insert(v8, v14);
                        end;
                    end;
                end;
            end;
        end;
        return v8;
    end
};
