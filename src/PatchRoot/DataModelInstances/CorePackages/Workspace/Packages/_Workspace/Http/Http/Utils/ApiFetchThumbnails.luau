local l_script_FirstAncestor_0 = script:FindFirstAncestor("Http");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Cryo);
local v3 = require(l_Parent_0.ArgCheck);
local l_PromiseUtilities_0 = require(l_Parent_0.AppCommonLib).Utils.PromiseUtilities;
local v5 = require(script.Parent.FetchSubdividedThumbnails);
local v6 = require(l_script_FirstAncestor_0.PerformFetch);
local function _(v7)
    return (tostring(v7));
end;
local v9 = {};
local function v11(v10)
    return "luaapp.thumbnails." .. tostring(v10.targetId) .. (not not v10.iconSize and "." .. v10.iconSize or "") .. (not not v10.requestName and "." .. v10.requestName or "");
end;
v9.KeyMapper = v11;
local function v16(v12, v13)
    local v14 = {};
    for v15 = 1, #v12, v13 do
        table.insert(v14, (v2.List.getRange(v12, v15, (v15 + v13) - 1)));
    end;
    return v14;
end;
v9.Fetch = function(v17, v18, v19, v20, v21, v22, v23)
    local v24 = v19 or "150x150";
    v3.isType(v18, "table", "targetIds");
    v3.isType(v20, "string", "requestName");
    v3.isNonNegativeNumber(#v18, "targetIds count");
    local v25 = {};
    local v26 = {};
    for _, v28 in pairs(v18) do
        table.insert(v25, {
            targetId = v28, 
            iconSize = v24, 
            requestName = v20
        });
    end;
    for _, v30 in ipairs((v16(v25, 100))) do
        table.insert(v26, v23:dispatch(v5.Fetch(v17, v30, v11, v20, v21, v22)));
    end;
    return l_PromiseUtilities_0.Batch(v26);
end;
v9.GetFetchingStatus = function(v31, v32, v33, v34)
    local l_GetStatus_0 = v6.GetStatus;
    local l_v31_0 = v31;
    local v37 = {
        targetId = v32, 
        requestName = v34, 
        iconSize = v33
    };
    return l_GetStatus_0(l_v31_0, "luaapp.thumbnails." .. tostring(v37.targetId) .. (not not v37.iconSize and "." .. v37.iconSize or "") .. (not not v37.requestName and "." .. v37.requestName or ""));
end;
return v9;
