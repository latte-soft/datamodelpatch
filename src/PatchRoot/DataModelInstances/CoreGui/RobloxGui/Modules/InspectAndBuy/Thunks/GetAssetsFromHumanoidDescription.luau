local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Thunk);
local v2 = require(l_Parent_0.Thunks.GetProductInfo);
local v3 = require(l_Parent_0.Thunks.GetVersionInfo);
local v4 = require(l_Parent_0.Models.AssetInfo);
local v5 = require(l_Parent_0.Actions.SetAssets);
local v6 = require(l_Parent_0.Actions.SetEquippedAssets);
local v7 = require(l_Parent_0.Constants);
local v8 = require(l_Parent_0.Thunks.GetAssetBundles);
local v9 = require(l_Parent_0.Flags.FFlagAttributionInInspectAndBuy);
local v10 = require(l_Parent_0.Flags.GetFFlagIBEnableNewDataCollectionForCollectibleSystem);
local v11 = {};
local function v24(v12)
    local v13 = {};
    for v14, v15 in pairs(v7.AssetTypeIdStringToHumanoidDescriptionProp) do
        if v7.AssetTypeIdToAccessoryTypeEnum[v14] == nil then
            for _, v17 in pairs(string.split(v12[v15] or "")) do
                if tonumber(v17) and v17 ~= "0" then
                    table.insert(v13, v4.fromHumanoidDescription(v17));
                end;
            end;
        end;
    end;
    for _, v19 in pairs((v12:GetAccessories(true))) do
        v13[#v13 + 1] = v4.fromHumanoidDescription(v19.AssetId);
    end;
    for _, v21 in pairs((v12:GetEmotes())) do
        for _, v23 in pairs(v21) do
            v13[#v13 + 1] = v4.fromHumanoidDescription(v23);
        end;
    end;
    return v13;
end;
return function(v25, v26)
    return v1.new(script.Name, v11, function(v27, _)
        local v29 = v24(v25);
        if v26 then
            v27:dispatch(v6(v29));
            return ;
        else
            for _, v31 in ipairs(v29) do
                coroutine.wrap(function()
                    v27:dispatch(v2(v31.assetId));
                    if v10() and v31.parentBundleId == nil then
                        v27:dispatch(v8(v31.assetId));
                    end;
                    if v9 then
                        v27:dispatch(v3(v31.assetId));
                    end;
                end)();
            end;
            v27:dispatch(v5(v29));
            return ;
        end;
    end);
end;
