local l_script_FirstAncestor_0 = script:FindFirstAncestor("Http");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_Thumbnail_0 = require(l_script_FirstAncestor_0.Models).Thumbnail;
local v3 = require(l_script_FirstAncestor_0.PerformFetch);
local v4 = require(l_Parent_0.ArgCheck);
local v5 = require(l_Parent_0.Promise);
local v6 = require(l_Parent_0.Result);
local v7 = require(l_Parent_0.tutils);
local v8 = math.max(0, tonumber(settings():GetFVariable("LuaAppNonFinalThumbnailMaxRetries")) or 0);
local v9 = math.max(0, tonumber(settings():GetFVariable("LuaAppThumbnailsApiRetryTimeMultiplier")) or 0);
local v34 = {
    _fetchIcons = function(v10, v11, v12, v13, v14, v15, v16, v17)
        local function _(v18)
            return v14({
                targetId = v18, 
                requestName = v15, 
                iconSize = v13
            });
        end;
        local function v24(v20)
            local v21 = {};
            for _, v23 in pairs(v20) do
                v21[v14({
                    targetId = v23, 
                    requestName = v15, 
                    iconSize = v13
                })] = v6.new(false, {
                    targetId = v23
                });
            end;
            return v21;
        end;
        return v16(v11, v12, v13):andThen(function(v25)
            local v26 = v24(v12);
            local v27 = {};
            local v28 = (v25 and v25.responseBody) and v25.responseBody.data;
            if typeof(v28) == "table" then
                for _, v30 in pairs(v28) do
                    if l_Thumbnail_0.isCompleteThumbnailData(v30) then
                        local v31 = tostring(v30.targetId);
                        local v32 = false;
                        if l_Thumbnail_0.checkStateIsFinal(v30.state) then
                            v27[v31] = l_Thumbnail_0.fromThumbnailData(v30, v13);
                            v32 = true;
                        end;
                        v26[v14({
                            targetId = v31, 
                            requestName = v15, 
                            iconSize = v13
                        })] = v6.new(v32, v30);
                    end;
                end;
            end;
            v10:dispatch(v17(v27));
            return v5.resolve(v26);
        end, function(_)
            return v5.resolve((v24(v12)));
        end);
    end
};
v34._fetch = function(v35, v36, v37, v38, v39, v40, v41, v42)
    return v34._fetchIcons(v35, v36, v37, v38, v39, v40, v41, v42):andThen(function(v43)
        local v44 = {};
        local l_v43_0 = v43;
        if _G.__TESTEZ_RUNNING_TEST__ then
            v8 = 1;
            v9 = 0.001;
        end;
        local function v46(v47)
            local v48 = {};
            for v49, v50 in pairs(l_v43_0) do
                local v51, v52 = v50:unwrap();
                if not v51 or not l_Thumbnail_0.checkStateIsFinal(v52.state) then
                    table.insert(v48, v52);
                else
                    v44[v49] = v50;
                end;
            end;
            if v7.fieldCount(v48) == 0 then
                return v5.resolve(v44);
            else
                return v5.new(function(v53, _)
                    coroutine.wrap(function()
                        wait(v9 * math.pow(2, v47 - 1));
                        v53();
                    end)();
                end):andThen(function()
                    return v34._fetchIcons(v35, v36, v37, v38, v39, v40, v41, v42);
                end):andThen(function(v55)
                    l_v43_0 = v55;
                    if v47 > 1 then
                        return v46(v47 - 1);
                    else
                        return v5.resolve(v44);
                    end;
                end);
            end;
        end;
        return v46(v8);
    end);
end;
v34.Fetch = function(v56, v57, v58, v59, v60, v61)
    v4.isType(v57, "table", "requests");
    v4.isType(v59, "string", "requestName");
    v4.isNonNegativeNumber(#v57, "requests count");
    v34.KeyMapper = v58;
    return v3.Batch(v57, v58, function(v62, v63)
        local v64 = {};
        local v65 = nil;
        for _, v67 in ipairs(v63) do
            local l_targetId_0 = v67.targetId;
            v65 = v67.iconSize;
            table.insert(v64, l_targetId_0);
        end;
        return v34._fetch(v62, v56, v64, v65, v58, v59, v60, v61);
    end);
end;
return v34;
