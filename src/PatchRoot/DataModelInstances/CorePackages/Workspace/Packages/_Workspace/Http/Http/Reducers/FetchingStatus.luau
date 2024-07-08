local l_script_FirstAncestor_0 = script:FindFirstAncestor("Http");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_UpdateFetchingStatus_0 = require(l_script_FirstAncestor_0.Actions).UpdateFetchingStatus;
local l_BatchUpdateFetchingStatus_0 = require(l_script_FirstAncestor_0.Actions).BatchUpdateFetchingStatus;
local v4 = require(l_Parent_0.Cryo);
local l_FFlagLuaAppBatchFetchingStatus_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppBatchFetchingStatus;
local l_FFlagLuaAppBatchSingleFetches_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppBatchSingleFetches;
local function v14(v7)
    local v8 = {};
    for _, v10 in pairs(v7) do
        local l_key_0 = v10.key;
        local l_status_0 = v10.status;
        local _ = nil;
        v8[l_key_0] = if l_status_0 ~= nil then l_status_0 else v4.None;
    end;
    return v8;
end;
return function(v15, v16)
    v15 = v15 or {};
    if v16.type == l_UpdateFetchingStatus_0.name then
        local l_key_1 = v16.key;
        local l_status_1 = v16.status;
        local _ = nil;
        v15 = v4.Dictionary.join(v15, {
            [l_key_1] = if l_status_1 ~= nil then l_status_1 else v4.None
        });
    end;
    if not (not l_FFlagLuaAppBatchFetchingStatus_0 and not l_FFlagLuaAppBatchSingleFetches_0) and v16.type == l_BatchUpdateFetchingStatus_0.name then
        v15 = v4.Dictionary.join(v15, (v14(v16.fetchingStatuses)));
    end;
    return v15;
end;
