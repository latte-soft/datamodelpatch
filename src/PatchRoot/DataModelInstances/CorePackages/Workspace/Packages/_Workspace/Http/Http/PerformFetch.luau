local l_script_FirstAncestor_0 = script:FindFirstAncestor("Http");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Result);
local v3 = require(l_Parent_0.Promise);
local l_PromiseUtilities_0 = require(l_Parent_0.AppCommonLib).Utils.PromiseUtilities;
local l_RetrievalStatus_0 = require(l_script_FirstAncestor_0.Enum).RetrievalStatus;
local l_UpdateFetchingStatus_0 = require(l_script_FirstAncestor_0.Actions).UpdateFetchingStatus;
local l_BatchUpdateFetchingStatus_0 = require(l_script_FirstAncestor_0.Actions).BatchUpdateFetchingStatus;
local l_FFlagLuaAppBatchFetchingStatus_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppBatchFetchingStatus;
local l_FFlagLuaAppBatchSingleFetches_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppBatchSingleFetches;
local v10 = {};
local v11 = {};
v10.ClearOutstandingPromiseStatus = function()
    v11 = {};
end;
local function v13(v12)
    return v12;
end;
v10.GetStatus = function(v14, v15)
    assert(typeof(v14) == "table");
    assert(typeof(v15) == "string");
    assert(#v15 > 0);
    return v14.FetchingStatus[v15] or l_RetrievalStatus_0.NotStarted;
end;
v10.Single = function(v16, v17)
    assert(typeof(v16) == "string");
    assert(typeof(v17) == "function");
    assert(#v16 > 0);
    return function(v18)
        return v10.Batch({
            v16
        }, v13, function(v19, v20)
            assert(#v20 == 1);
            local v21 = v17(v19);
            assert(v3.is(v21));
            return v21:andThen(function(...)
                assert(#{
                    ...
                } <= 1);
                return v3.resolve({
                    [v16] = v2.new(true, (...))
                });
            end, function(...)
                assert(#{
                    ...
                } <= 1);
                return v3.resolve({
                    [v16] = v2.new(false, (...))
                });
            end);
        end)(v18):andThen(function(v22)
            local v23, v24 = v22[v16]:unwrap();
            if not v23 then
                return v3.reject(v24);
            else
                return v3.resolve(v24);
            end;
        end);
    end;
end;
v10.Batch = function(v25, v26, v27)
    assert(typeof(v25) == "table");
    assert(typeof(v26) == "function");
    assert(typeof(v27) == "function");
    return function(v28)
        local v29 = {};
        local v30 = {};
        local v31 = {};
        for _, v33 in ipairs(v25) do
            local v34 = v26(v33);
            local v35 = v10.GetStatus(v28:getState(), v34);
            local v36 = v11[v34];
            if not v36 then
                if not l_FFlagLuaAppBatchSingleFetches_0 then
                    assert(v35 ~= l_RetrievalStatus_0.Fetching);
                end;
                table.insert(v29, v33);
                v30[v33] = v34;
            else
                if not l_FFlagLuaAppBatchSingleFetches_0 then
                    assert(v35 == l_RetrievalStatus_0.Fetching);
                end;
                v31[v34] = v36;
            end;
        end;
        local v37 = nil;
        local v39 = v3.new(function(v38)
            v37 = v38;
        end);
        local v40 = nil;
        if #v29 > 0 then
            if not l_FFlagLuaAppBatchFetchingStatus_0 then
                for _, v42 in pairs(v30) do
                    v28:dispatch(l_UpdateFetchingStatus_0(v42, l_RetrievalStatus_0.Fetching));
                    v11[v42] = v39;
                end;
            else
                local v43 = {};
                for _, v45 in pairs(v30) do
                    table.insert(v43, {
                        key = v45, 
                        status = l_RetrievalStatus_0.Fetching
                    });
                    v11[v45] = v39;
                end;
                if #v43 > 0 then
                    v28:dispatch(l_BatchUpdateFetchingStatus_0(v43));
                end;
            end;
            v40 = v27(v28, v29);
            assert(v3.is(v40));
        else
            v40 = v3.resolve({});
        end;
        v40:andThen(function(v46)
            v46 = v46 or {};
            return l_PromiseUtilities_0.Batch(v31):andThen(function(v47)
                local v48 = {};
                for v49, v50 in pairs(v47) do
                    local _, v52 = v50:unwrap();
                    v48[v49] = v52[v49];
                end;
                return v46, v48;
            end);
        end, function()
            assert(false, "PerformFetch fetchFunctor should never reject");
        end):andThen(function(v53, v54)
            if not l_FFlagLuaAppBatchFetchingStatus_0 then
                for _, v56 in pairs(v30) do
                    local v57 = v53[v56];
                    if not v2.is(v57) then
                        v54[v56] = v2.error();
                    else
                        v54[v56] = v57;
                    end;
                    v28:dispatch(l_UpdateFetchingStatus_0(v56, not not v54[v56]:unwrap() and l_RetrievalStatus_0.Done or l_RetrievalStatus_0.Failed));
                    v11[v56] = nil;
                end;
            else
                local v58 = {};
                for _, v60 in pairs(v30) do
                    local v61 = v53[v60];
                    if not v2.is(v61) then
                        v54[v60] = v2.error();
                    else
                        v54[v60] = v61;
                    end;
                    table.insert(v58, {
                        key = v60, 
                        status = not not v54[v60]:unwrap() and l_RetrievalStatus_0.Done or l_RetrievalStatus_0.Failed
                    });
                    v11[v60] = nil;
                end;
                if #v58 > 0 then
                    v28:dispatch(l_BatchUpdateFetchingStatus_0(v58));
                    return v54;
                end;
            end;
            return v54;
        end):andThen(function(v62)
            v37(v62);
        end);
        return v39;
    end;
end;
return v10;
