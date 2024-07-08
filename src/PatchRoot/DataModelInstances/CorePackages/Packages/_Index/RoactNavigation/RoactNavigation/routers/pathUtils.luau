local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local v3 = require(l_Parent_2.LuauPolyfill);
local l_Array_0 = v3.Array;
local l_Object_0 = v3.Object;
local l_String_0 = v3.String;
local v7 = require(l_Parent_2.RegExp);
local v8 = require(l_Parent_1.utils.invariant);
local v9 = require(l_Parent_1.NavigationActions);
local v10 = require(l_Parent_0.pathToRegexp);
local l_compile_0 = v10.compile;
local l_pathToRegexp_0 = v10.pathToRegexp;
local v13 = require(l_Parent_0.queryString);
local v14 = require(l_Parent_0:FindFirstChild("ChildIsScreenRouterSymbol.roblox"));
local v15 = require(l_Parent_0:FindFirstChild("NullPathSymbol.roblox"));
local v16 = require(l_Parent_0.decodeURIComponent);
local v28 = {
    getParamsFromPath = function(v17, v18, v19)
        return (l_Array_0.reduce(l_Array_0.slice(v18, 2), function(v20, v21, v22)
            local v23 = v19[v22];
            if not v23 or v23.pattern == ".*" then
                return v20;
            else
                local l_name_0 = v23.name;
                local v25 = nil;
                if v21 then
                    local l_status_0, l_result_0 = pcall(v16, v21);
                    if l_status_0 then
                        v25 = l_result_0;
                    end;
                end;
                v20[l_name_0] = v25 or v21;
                return v20;
            end;
        end, table.clone(v17)));
    end
};
local function _(v29, v30)
    return v29[l_Array_0.findIndex(v30, function(v31)
        return v31.pattern == ".*";
    end) + 1];
end;
local function v37(v33, v34)
    if not l_Array_0.isArray(v34) then
        return v34;
    elseif #v34 == 1 then
        return v34[1];
    else
        for _, v36 in v34, nil, nil do
            if l_String_0.startsWith(v33, v36) then
                return v36;
            end;
        end;
        return nil;
    end;
end;
v28.urlToPathAndParams = function(v38, v39)
    local v40 = v7("^(.*)\\?(.*)$"):exec(v38);
    local v41 = if not v40 then v38 else v40[2];
    local v42 = v13.parse(if not v40 then {} else v40[3]);
    local v43 = v37(v41, v39);
    if not (v43 ~= nil) or v43 == "" then
        v43 = "://";
    end;
    local v44 = string.split(v41, v43)[2];
    if v44 == nil then
        v44 = v41;
    end;
    if v44 == "/" then
        v44 = "";
    end;
    if string.sub(v44, -1, -1) == "/" then
        v44 = string.sub(v44, 1, -2);
    end;
    return {
        path = v44, 
        params = v42
    };
end;
v28.createPathParser = function(v45, v46, v47)
    local v48 = v47.paths or {};
    local l_disableRouteNamePaths_0 = v47.disableRouteNamePaths;
    local v50 = {};
    local v51 = {};
    for v52 in v45, nil, nil do
        local v53 = nil;
        if v48[v52] ~= nil then
            v53 = v48[v52];
        elseif type(v46[v52]) == "table" then
            v53 = v46[v52].path;
        end;
        if v53 == nil then
            v53 = if not l_disableRouteNamePaths_0 then v52 else v15;
        end;
        local l_v8_0 = v8;
        local v55 = true;
        if v53 ~= v15 then
            v55 = type(v53) == "string";
        end;
        l_v8_0(v55, "Route path for %s must be specified as a string, or RoactNavigation.NoPath.", v52);
        l_v8_0 = v53 ~= v15;
        v55 = {};
        local v56 = nil;
        if l_v8_0 then
            v56 = l_pathToRegexp_0(v53, v55);
        end;
        local v57 = {};
        local v58 = true;
        if v53 ~= "" then
            v58 = not l_v8_0;
        end;
        v50[v52] = {
            exactRe = v56, 
            exactReKeys = v55, 
            extendedPathRe = l_pathToRegexp_0(if not v58 then ("%s/(.*)"):format(v53) else "(.*)", v57), 
            extendedPathReKeys = v57, 
            isWildcard = v58, 
            toPath = v53 == v15 and function()
                return "";
            end or l_compile_0(v53)
        };
    end;
    v51 = l_Object_0.entries(v50);
    return {
        getActionForPathAndParams = function(v59, v60)
            if v59 == nil then
                v59 = "";
            end;
            if v60 == nil then
                v60 = {};
            end;
            for _, v62 in v51, nil, nil do
                local v63 = v62[1];
                local v64 = v62[2];
                local l_exactRe_0 = v64.exactRe;
                local l_exactReKeys_0 = v64.exactReKeys;
                local l_extendedPathRe_0 = v64.extendedPathRe;
                local l_extendedPathReKeys_0 = v64.extendedPathReKeys;
                local v69 = v45[v63];
                local v70 = l_exactRe_0 and l_exactRe_0:exec(v59);
                if v70 and v70.n ~= 0 then
                    local v71 = l_extendedPathRe_0 and l_extendedPathRe_0:exec(v59);
                    local v72 = nil;
                    if not (not v71 or not v69) then
                        v72 = v69.getActionForPathAndParams(v71[l_Array_0.findIndex(l_extendedPathReKeys_0, function(v73)
                            return v73.pattern == ".*";
                        end) + 1], v60);
                    end;
                    return v9.navigate({
                        routeName = v63, 
                        params = v28.getParamsFromPath(v60, v70, l_exactReKeys_0), 
                        action = v72
                    });
                end;
            end;
            for _, v75 in v51, nil, nil do
                local v76 = v75[1];
                local v77 = v75[2];
                local l_extendedPathRe_1 = v77.extendedPathRe;
                local l_extendedPathReKeys_1 = v77.extendedPathReKeys;
                local v80 = v45[v76];
                local v81 = l_extendedPathRe_1 and l_extendedPathRe_1:exec(v59);
                if v81 and v81.n ~= 0 then
                    local v83 = v81[l_Array_0.findIndex(l_extendedPathReKeys_1, function(v82)
                        return v82.pattern == ".*";
                    end) + 1];
                    local v84 = nil;
                    if v80 then
                        v84 = v80.getActionForPathAndParams(v83, v60);
                    end;
                    if v84 then
                        return v9.navigate({
                            routeName = v76, 
                            params = v28.getParamsFromPath(v60, v81, l_extendedPathReKeys_1), 
                            action = v84
                        });
                    end;
                end;
            end;
            return nil;
        end, 
        getPathAndParamsForRoute = function(v85)
            local l_routeName_0 = v85.routeName;
            local l_params_0 = v85.params;
            local v88 = v45[l_routeName_0];
            local v89 = v50[l_routeName_0];
            local l_toPath_0 = v89.toPath;
            local l_exactReKeys_1 = v89.exactReKeys;
            local v92 = l_toPath_0(l_params_0);
            local v93 = {};
            if l_params_0 then
                for _, v97 in (l_Array_0.filter(l_Object_0.keys(l_params_0), function(v94)
                    return not l_Array_0.find(l_exactReKeys_1, function(v95)
                        return v95.name == v94;
                    end);
                end)), nil, nil do
                    v93[v97] = l_params_0[v97];
                end;
            end;
            if v88 and v88 ~= v14 then
                local v98 = v88.getPathAndParamsForState(v85);
                return {
                    path = if not not v92 and v92 ~= "" then ("%s/%s"):format(v92, v98.path) else v98.path, 
                    params = if not v98.params then v93 else l_Object_0.assign(v93, v98.params)
                };
            else
                return {
                    path = v92, 
                    params = v93
                };
            end;
        end
    };
end;
return v28;
