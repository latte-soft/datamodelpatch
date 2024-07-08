local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Cryo);
local v2 = require(l_Parent_0.StringUtilities);
local l_StringTrim_0 = v2.StringTrim;
local l_StringSplit_0 = v2.StringSplit;
local v5 = require(script.Parent.encodeURIComponent);
local v6 = require(script.Parent.UrlBase);
local v7 = require(script.Parent.UrlPatterns.GameUrlPatterns);
local v8 = require(script.Parent.UrlPatterns.UserUrlPatterns);
local v9 = require(script.Parent.UrlPatterns.StaticUrlPatterns);
local v10 = require(script.Parent.UrlPatterns.CatalogUrlPatterns);
local v11 = require(script.Parent.UrlPatterns.EconomyUrlPatterns);
local v12 = require(script.Parent.UrlPatterns.ShareLinksUrlPatterns);
local v13 = require(script.Parent.UrlPatterns.UserModerationPatterns);
local v14 = require(script.Parent.UrlPatterns.AccountInformationPatterns);
local v15 = require(script.Parent.UrlPatterns.VirtualEventsUrlPatterns);
local v16 = require(script.Parent.UrlPatterns.PlatformAuthPatterns);
local v17 = {};
local function v23(v18, v19, v20)
    return (v1.List.filter(v1.List.map(l_StringSplit_0(v18, v19, v20), function(v21)
        return l_StringTrim_0(v21);
    end), function(v22)
        return #v22 > 0;
    end));
end;
local function v29(v24)
    local v25 = type(v24);
    if v25 == "string" then
        return true;
    elseif v25 == "number" then
        return true;
    elseif v25 == "table" then
        for _, v27 in ipairs(v24) do
            local v28 = type(v27);
            if v28 ~= "string" and v28 ~= "number" then
                return false;
            end;
        end;
        return true;
    else
        return false;
    end;
end;
local function _(v30)
    if string.sub(v30, 1, 1) == "{" then
        assert(string.sub(v30, -1, -1) == "}", "invalid pattern: placeholder items should end with `}`");
    end;
end;
local function v36(v32, v33)
    assert(type(v32) == "table", "invalid pattern: elements should all be tables");
    if v33 then
        assert(type(v32.name) == "string", "invalid pattern: element name should be a string");
        assert(#v32.name > 0, "invalid pattern: element name should not be empty");
    end;
    local v34 = true;
    if type(v32.value) ~= "string" then
        v34 = type(v32.value) == "number";
    end;
    assert(v34, "invalid pattern: element value should be a string or number");
    if type(v32.value) == "string" then
        local l_value_0 = v32.value;
        if string.sub(l_value_0, 1, 1) == "{" then
            assert(string.sub(l_value_0, -1, -1) == "}", "invalid pattern: placeholder items should end with `}`");
        end;
    end;
    if v32.optional ~= nil then
        assert(type(v32.optional) == "boolean", "invalid pattern: element optional should be a boolean");
    end;
    if v32.default ~= nil then
        assert(v29(v32.default), "invalid pattern: element default should be a string, number, or a table of strings and numbers only");
    end;
    if v32.collect ~= nil then
        v34 = true;
        if v32.collect ~= "multi" then
            v34 = v32.collect == "csv";
        end;
        assert(v34, "invalid pattern: element optional should be one of `multi`, `csv`");
    end;
end;
local function v42(v37)
    assert(type(v37.base) == "string", "invalid pattern: base should be a string");
    assert(#v37.base > 0, "invalid pattern: base should not be empty");
    assert(type(v37.path) == "table", "invalid pattern: path should be a table");
    for _, v39 in ipairs(v37.path) do
        v36(v39, false);
    end;
    if v37.query ~= nil then
        assert(type(v37.query) == "table", "invalid pattern: query should be a table");
    end;
    if type(v37.query) == "table" then
        for _, v41 in ipairs(v37.query) do
            v36(v41, true);
        end;
    end;
    if v37.hash ~= nil then
        assert(type(v37.hash) == "string", "invalid pattern: hash should be a string");
    end;
end;
local function _(v43, v44)
    return (v1.List.map(v23(v43, not v44 and "/" or "&"), function(v45)
        local v46 = nil;
        local v47 = l_StringTrim_0(v45);
        local v48 = nil;
        local v49 = nil;
        local v50 = nil;
        if v44 then
            local v51 = l_StringSplit_0(v47, "=", 2);
            v46 = l_StringTrim_0(v51[1]);
            v47 = v51[2];
            if string.sub(v46, 1, 1) == "{" then
                v46 = l_StringSplit_0(l_StringTrim_0(v46, "{}"), "|", 2)[1];
                if v47 == nil then
                    v47 = v51[1];
                end;
                v46 = l_StringTrim_0(v46);
            end;
            v50 = "multi";
        end;
        if not (not (v47 ~= nil) or not string.find(v47, "^{.*}$")) then
            local v52 = l_StringSplit_0(l_StringTrim_0(v47, "{}"), "|", 2);
            v47 = l_StringTrim_0(v52[1]);
            if #v52 > 1 then
                v48 = true;
                if #v52[2] > 1 then
                    v49 = v52[2];
                end;
            end;
            v47 = "{" .. v47 .. "}";
        end;
        return {
            name = v46, 
            value = v47, 
            optional = v48, 
            default = v49, 
            collect = v50
        };
    end));
end;
local function v58(v54)
    local v55 = {};
    for v56, v57 in pairs(v54) do
        table.insert(v55, v56 .. "=" .. v57);
    end;
    return table.concat(v55, "&");
end;
local function v89(v59)
    local l_base_0 = v59.base;
    local l_path_0 = v59.path;
    local l_query_0 = v59.query;
    local l_hash_0 = v59.hash;
    if l_base_0 ~= nil and v6[string.upper(l_base_0)] ~= nil then
        l_base_0 = v6[string.upper(l_base_0)];
    end;
    if type(l_path_0) == "string" then
        local v64 = v23(l_path_0, "/");
        local l_map_0 = v1.List.map;
        local l_v64_0 = v64;
        local v67 = false;
        local l_v67_0 = v67 --[[ copy: 9 -> 10 ]];
        l_path_0 = l_map_0(l_v64_0, function(v69)
            local v70 = nil;
            local v71 = l_StringTrim_0(v69);
            local v72 = nil;
            local v73 = nil;
            local v74 = nil;
            if l_v67_0 then
                local v75 = l_StringSplit_0(v71, "=", 2);
                v70 = l_StringTrim_0(v75[1]);
                v71 = v75[2];
                if string.sub(v70, 1, 1) == "{" then
                    v70 = l_StringSplit_0(l_StringTrim_0(v70, "{}"), "|", 2)[1];
                    if v71 == nil then
                        v71 = v75[1];
                    end;
                    v70 = l_StringTrim_0(v70);
                end;
                v74 = "multi";
            end;
            if not (not (v71 ~= nil) or not string.find(v71, "^{.*}$")) then
                local v76 = l_StringSplit_0(l_StringTrim_0(v71, "{}"), "|", 2);
                v71 = l_StringTrim_0(v76[1]);
                if #v76 > 1 then
                    v72 = true;
                    if #v76[2] > 1 then
                        v73 = v76[2];
                    end;
                end;
                v71 = "{" .. v71 .. "}";
            end;
            return {
                name = v70, 
                value = v71, 
                optional = v72, 
                default = v73, 
                collect = v74
            };
        end);
    end;
    if type(l_query_0) == "table" and l_query_0[1] == nil then
        l_query_0 = v58(l_query_0);
    end;
    if type(l_query_0) == "string" then
        local v77 = v23(l_query_0, "&");
        local l_map_1 = v1.List.map;
        local l_v77_0 = v77;
        local v80 = true;
        l_query_0 = l_map_1(l_v77_0, function(v81)
            local v82 = nil;
            local v83 = l_StringTrim_0(v81);
            local v84 = nil;
            local v85 = nil;
            local v86 = nil;
            if v80 then
                local v87 = l_StringSplit_0(v83, "=", 2);
                v82 = l_StringTrim_0(v87[1]);
                v83 = v87[2];
                if string.sub(v82, 1, 1) == "{" then
                    v82 = l_StringSplit_0(l_StringTrim_0(v82, "{}"), "|", 2)[1];
                    if v83 == nil then
                        v83 = v87[1];
                    end;
                    v82 = l_StringTrim_0(v82);
                end;
                v86 = "multi";
            end;
            if not (not (v83 ~= nil) or not string.find(v83, "^{.*}$")) then
                local v88 = l_StringSplit_0(l_StringTrim_0(v83, "{}"), "|", 2);
                v83 = l_StringTrim_0(v88[1]);
                if #v88 > 1 then
                    v84 = true;
                    if #v88[2] > 1 then
                        v85 = v88[2];
                    end;
                end;
                v83 = "{" .. v83 .. "}";
            end;
            return {
                name = v82, 
                value = v83, 
                optional = v84, 
                default = v85, 
                collect = v86
            };
        end);
    end;
    return {
        base = l_base_0, 
        path = l_path_0, 
        query = l_query_0, 
        hash = l_hash_0
    };
end;
local function v93(v90, v91)
    return table.concat(v1.List.filter(v90, function(v92)
        if not v91 then
            return #v92 > 0;
        else
            return #v23(v92, "=") > 1;
        end;
    end), not v91 and "/" or "&");
end;
local function v100(v94, v95, v96)
    if v95 == nil then
        v95 = {};
    end;
    local v97 = nil;
    if type(v94.value) == "string" and string.sub(v94.value, 1, 1) == "{" then
        v97 = v95[string.sub(v94.value, 2, -2)];
        if v97 == nil then
            v97 = v94.default;
        end;
        if not v94.optional then
            assert(v97 ~= nil, "UrlBuilder: missing parameter: `" .. v94.value .. "`");
        end;
        if v97 == nil then
            v97 = {};
        end;
        assert(v29(v97), "UrlBuilder: invalid parameter: `" .. v94.value .. "`, " .. "should be a string, number, or a table of strings and numbers only");
    else
        v97 = v94.value;
    end;
    if type(v97) ~= "table" then
        v97 = {
            v97
        };
    end;
    v97 = v1.List.map(v97, function(v98)
        return v5((tostring(v98)));
    end);
    if v96 then
        if v94.collect == "csv" then
            v97 = {
                table.concat(v97, "%2C")
            };
        end;
        v97 = v1.List.map(v97, function(v99)
            return v5(v94.name) .. "=" .. v99;
        end);
    end;
    return v93(v97, v96);
end;
local function v105(v101, v102, v103)
    return v93(v1.List.map(v101 or {}, function(v104)
        return v100(v104, v102, v103);
    end), v103);
end;
v17.new = function(v106)
    v106 = v89(v106);
    v42(v106);
    return function(v107, v108)
        local v109 = l_StringTrim_0(v106.base, "/", {
            right = true
        });
        local v110 = v105(v106.path, v107, false);
        if #v110 > 0 then
            v109 = v109 .. "/" .. v110;
        end;
        if string.match(v109, "[^/]/[^/]") == nil then
            v109 = v109 .. "/";
        end;
        local v111 = v105(v106.query, v107, true);
        if #v111 > 0 then
            v109 = v109 .. "?" .. v111;
        end;
        if v106.hash and #v106.hash > 0 then
            v109 = v109 .. "#" .. v106.hash;
        end;
        if not v108 then
            return v109;
        else
            if v109 ~= v108 then
                warn("UrlBuilder: unexpected output for pattern:");
                warn("UrlBuilder: expected `" .. v108 .. "`");
                warn("UrlBuilder: actual `" .. v109 .. "`");
            end;
            return v108;
        end;
    end;
end;
v17.fromString = function(v112)
    local v113 = l_StringSplit_0(v112, ":", 2);
    if #v113 < 2 then
        v113 = {
            "", 
            v113[1]
        };
    end;
    local v114 = v113[1];
    v113 = l_StringSplit_0(v113[2], "%#", 2);
    local v115 = v113[2] or "";
    v113 = l_StringSplit_0(v113[1], "%?", 2);
    local v116 = v113[1] or "";
    local v117 = v113[2] or "";
    if string.sub(v116, 1, 2) == "//" then
        v113 = l_StringSplit_0(string.sub(v116, 3), "/", 2);
        v114 = v114 .. "://" .. v113[1];
        v116 = v113[2] or "/";
    end;
    return v17.new({
        base = l_StringTrim_0(v114), 
        path = l_StringTrim_0(v116), 
        query = l_StringTrim_0(v117), 
        hash = v115
    });
end;
v17.addQueryString = function(v118, v119)
    local v120 = l_StringTrim_0(v118);
    local v121 = string.find(v120, "%?");
    if v121 == nil then
        v120 = v120 .. "?";
    elseif v121 < #v120 then
        v120 = v120 .. "&";
    end;
    return v17.fromString(v120 .. table.concat(v1.List.map(v1.Dictionary.keys(v119), function(v122)
        return "{" .. v122 .. "}";
    end), "&"))(v119);
end;
v17.game = v7(v17);
v17.user = v8(v17);
v17.catalog = v10(v17);
v17.static = v9(v17);
v17.usermoderation = v13(v17);
v17.accountinformation = v14(v17);
v17.sharelinks = v12(v17);
v17.economy = v11(v17);
v17.virtualevents = v15(v17);
v17.PlatformAuth = v16(v17);
return v17;
