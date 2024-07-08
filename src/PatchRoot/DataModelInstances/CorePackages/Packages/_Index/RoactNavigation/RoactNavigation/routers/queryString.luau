local l_HttpService_0 = game:GetService("HttpService");
local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent.Parent;
local v3 = require(l_Parent_1.LuauPolyfill);
local l_Array_0 = v3.Array;
local l_Boolean_0 = v3.Boolean;
local l_Object_0 = v3.Object;
local l_String_0 = v3.String;
local l_Number_0 = v3.Number;
local v9 = require(l_Parent_1.RegExp);
local function _(v10)
    return v10;
end;
local function v13(v12)
    return l_HttpService_0:UrlEncode(v12);
end;
local function v16(v14)
    return l_HttpService_0:UrlEncode(v14):gsub("['%(%)%*]", function(v15)
        return ("%%%x"):format(v15:byte()):upper();
    end);
end;
local v17 = require(l_Parent_0.decodeURIComponent);
local v18 = require(l_Parent_0.splitOnFirst);
local v19 = nil;
local v20 = nil;
local v21 = {};
local function _(v22)
    return tonumber(v22) or (0/0);
end;
local function v39(v24)
    local l_arrayFormat_0 = v24.arrayFormat;
    if l_arrayFormat_0 == "index" then
        return function(v26)
            return function(v27, v28)
                local v29 = #v27;
                if v24.skipNull and v28 == nil then
                    return v27;
                elseif v28 == nil then
                    return l_Array_0.concat(v27, {
                        table.concat({
                            v19(v26, v24), 
                            "[", 
                            v29, 
                            "]"
                        }, "")
                    });
                else
                    return l_Array_0.concat(v27, {
                        table.concat({
                            v19(v26, v24), 
                            "[", 
                            v19(v29, v24), 
                            "]=", 
                            v19(v28, v24)
                        }, "")
                    });
                end;
            end;
        end;
    elseif l_arrayFormat_0 == "bracket" then
        return function(v30)
            return function(v31, v32)
                if v24.skipNull and v32 == nil then
                    return v31;
                elseif v32 == nil then
                    return l_Array_0.concat(v31, {
                        table.concat({
                            v19(v30, v24), 
                            "[]"
                        }, "")
                    });
                else
                    return l_Array_0.concat(v31, {
                        table.concat({
                            v19(v30, v24), 
                            "[]=", 
                            v19(v32, v24)
                        }, "")
                    });
                end;
            end;
        end;
    elseif not (l_arrayFormat_0 ~= "comma") or l_arrayFormat_0 == "separator" then
        return function(v33)
            return function(v34, v35)
                if not (v35 ~= nil) or #v35 == 0 then
                    return v34;
                elseif #v34 == 0 then
                    return {
                        table.concat({
                            v19(v33, v24), 
                            "=", 
                            v19(v33, v24)
                        }, "")
                    };
                else
                    return {
                        table.concat({
                            v34, 
                            v19(v33, v24)
                        }, v24.arrayFormatSeparator)
                    };
                end;
            end;
        end;
    else
        return function(v36)
            return function(v37, v38)
                if v24.skipNull and v38 == nil then
                    return v37;
                elseif v38 == nil then
                    return l_Array_0.concat(v37, {
                        v19(v36, v24)
                    });
                else
                    return l_Array_0.concat(v37, {
                        table.concat({
                            v19(v36, v24), 
                            "=", 
                            v19(v38, v24)
                        }, "")
                    });
                end;
            end;
        end;
    end;
end;
local function v58(v40)
    local v41 = nil;
    local l_arrayFormat_1 = v40.arrayFormat;
    if l_arrayFormat_1 == "index" then
        return function(v43, v44, v45)
            v41 = v9("\\[(\\d*)\\]$"):exec(v43);
            v43 = v43:gsub("%[%d*%]$", "");
            if v41 then
                if v45[v43] == nil then
                    v45[v43] = {};
                end;
                v45[v43][v41[2]] = v44;
                return ;
            else
                v45[v43] = v44;
                return ;
            end;
        end;
    elseif l_arrayFormat_1 == "bracket" then
        return function(v46, v47, v48)
            v41 = v9("(\\[\\])$"):exec(v46);
            v46 = v46:gsub("%[%]$", "");
            if v41 then
                if v48[v46] == nil then
                    v48[v46] = {
                        v47
                    };
                    return ;
                else
                    v48[v46] = l_Array_0.concat({}, v48[v46], v47);
                    return ;
                end;
            else
                v48[v46] = v47;
                return ;
            end;
        end;
    elseif not (l_arrayFormat_1 ~= "comma") or l_arrayFormat_1 == "separator" then
        return function(v49, v50, v51)
            local v52 = false;
            if type(v50) == "string" then
                v52 = string.find(v50, v40.arrayFormatSeparator, 1, true) ~= nil;
            end;
            local v53 = nil;
            if not v52 then
                if v50 ~= nil then
                    v53 = v20(v50, v40);
                end;
            else
                v53 = l_Array_0.map(v50:split(v40.arrayFormatSeparator), function(v54)
                    return v20(v54, v40);
                end);
            end;
            v51[v49] = v53;
        end;
    else
        return function(v55, v56, v57)
            if v57[v55] == nil then
                v57[v55] = v56;
                return ;
            else
                v57[v55] = l_Array_0.concat({}, v57[v55], v56);
                return ;
            end;
        end;
    end;
end;
local function _(v59)
    if not (type(v59) == "string") or #v59 ~= 1 then
        error("arrayFormatSeparator must be single character string");
    end;
end;
v19 = function(v61, v62)
    if not v62.encode then
        return v61;
    elseif not v62.strict then
        return v13(v61);
    else
        return v16(v61);
    end;
end;
v20 = function(v63, v64)
    if not v64.decode then
        return v63;
    else
        return v17(v63);
    end;
end;
local function v65(v66)
    if not l_Array_0.isArray(v66) then
        if type(v66) == "table" then
            return l_Array_0.map(l_Array_0.sort(v65(l_Object_0.keys(v66)), function(v67, v68)
                return (tonumber(v67) or (0/0)) - (tonumber(v68) or (0/0));
            end), function(v69)
                return v66[v69];
            end);
        else
            return v66;
        end;
    else
        return l_Array_0.sort(v66);
    end;
end;
local function _(v70)
    local v71 = v70:find("#");
    if v71 ~= nil then
        v70 = v70:sub(1, v71 - 1);
    end;
    return v70;
end;
local function _(v73)
    local v74 = "";
    local v75 = v73:find("#");
    if v75 ~= nil then
        v74 = v73:sub(v75);
    end;
    return v74;
end;
local function v80(v77)
    local l_v77_0 = v77;
    local v79 = l_v77_0:find("#");
    if v79 ~= nil then
        l_v77_0 = l_v77_0:sub(1, v79 - 1);
    end;
    v77 = l_v77_0;
    l_v77_0 = v77:find("?", 1, true);
    if l_v77_0 == nil then
        return "";
    else
        return v77:sub(l_v77_0 + 1);
    end;
end;
local function v83(v81, v82)
    if (not (not v82.parseNumbers or l_Number_0.isNaN(tonumber(v81) or (0/0))) and type(v81) == "string") and l_String_0.trim(v81) ~= "" then
        return tonumber(v81) or (0/0);
    else
        if (v82.parseBooleans and v81 ~= nil) and (not (string.lower(v81) ~= "true") or string.lower(v81) == "false") then
            v81 = string.lower(v81) == "true";
        end;
        return v81;
    end;
end;
local function v100(v84, v85)
    v85 = l_Object_0.assign({
        decode = true, 
        sort = true, 
        arrayFormat = "none", 
        arrayFormatSeparator = ",", 
        parseNumbers = false, 
        parseBooleans = false
    }, v85);
    local l_arrayFormatSeparator_0 = v85.arrayFormatSeparator;
    if not (type(l_arrayFormatSeparator_0) == "string") or #l_arrayFormatSeparator_0 ~= 1 then
        error("arrayFormatSeparator must be single character string");
    end;
    l_arrayFormatSeparator_0 = v58(v85);
    local v87 = {};
    if type(v84) ~= "string" then
        return v87;
    else
        v84 = string.gsub(l_String_0.trim(v84), "^[%?#&]", "");
        if v84 == "" then
            return v87;
        else
            for _, v89 in v84:split("&") do
                local v90 = v18(if not v85.decode then v89 else string.gsub(v89, "%+", " "), "=");
                local v91 = v90[1];
                local v92 = v90[2];
                if v92 ~= nil and v85.arrayFormat ~= "comma" then
                    v92 = v20(v92, v85);
                end;
                l_arrayFormatSeparator_0(v20(v91, v85), v92, v87);
            end;
            for v93 in v87, nil, nil do
                local v94 = v87[v93];
                if type(v94) == "table" then
                    for v95 in v94, nil, nil do
                        v94[v95] = v83(v94[v95], v85);
                    end;
                else
                    v87[v93] = v83(v94, v85);
                end;
            end;
            if v85.sort == false then
                return v87;
            else
                local _ = nil;
                return l_Array_0.reduce(if v85.sort == true then l_Array_0.sort(l_Object_0.keys(v87)) else l_Array_0.sort(l_Object_0.keys(v87), v85.sort), function(v97, v98)
                    local v99 = v87[v98];
                    if not (l_Boolean_0.toJSBoolean(v99) and type(v99) == "table") or l_Array_0.isArray(v99) then
                        v97[v98] = v99;
                        return v97;
                    else
                        v97[v98] = v65(v99);
                        return v97;
                    end;
                end, {});
            end;
        end;
    end;
end;
v21.extract = v80;
v21.parse = v100;
v21.stringify = function(v101, v102)
    if v101 then
        v102 = l_Object_0.assign({
            encode = true, 
            strict = true, 
            arrayFormat = "none", 
            arrayFormatSeparator = ","
        }, v102);
        local l_arrayFormatSeparator_1 = v102.arrayFormatSeparator;
        if not (type(l_arrayFormatSeparator_1) == "string") or #l_arrayFormatSeparator_1 ~= 1 then
            error("arrayFormatSeparator must be single character string");
        end;
        l_arrayFormatSeparator_1 = v39(v102);
        local v104 = l_Object_0.keys((table.clone(v101)));
        if v102.sort ~= false then
            l_Array_0.sort(v104, v102.sort);
        end;
        return table.concat(l_Array_0.filter(l_Array_0.map(v104, function(v105)
            local v106 = v101[v105];
            if v106 == nil then
                return v19(v105, v102);
            elseif not l_Array_0.isArray(v106) then
                return (v19(v105, v102) + "=") + v19(v106, v102);
            else
                return table.concat(l_Array_0.reduce(v106, l_arrayFormatSeparator_1(v105), {}), "&");
            end;
        end), function(v107)
            return v107.length > 0;
        end), "&");
    else
        return "";
    end;
end;
v21.parseUrl = function(v108, v109)
    local v110 = {};
    local l_v108_0 = v108;
    local v112 = l_v108_0:find("#");
    if v112 ~= nil then
        l_v108_0 = l_v108_0:sub(1, v112 - 1);
    end;
    v110.url = l_v108_0:split("?")[1] or "";
    local l_v100_0 = v100;
    l_v108_0 = v108;
    v112 = l_v108_0:find("#");
    if v112 ~= nil then
        l_v108_0 = l_v108_0:sub(1, v112 - 1);
    end;
    local l_l_v108_0_0 = l_v108_0;
    l_v108_0 = l_l_v108_0_0:find("?", 1, true);
    v110.query = l_v100_0(l_v108_0 == nil and "" or l_l_v108_0_0:sub(l_v108_0 + 1), v109);
    return v110;
end;
v21.stringifyUrl = function(v115, v116)
    local l_url_0 = v115.url;
    local v118 = l_url_0:find("#");
    if v118 ~= nil then
        l_url_0 = l_url_0:sub(1, v118 - 1);
    end;
    local v119 = l_url_0:split("?")[1] or "";
    local v120 = v21.parse((v21.extract(v115.url)));
    v118 = v115.url;
    local v121 = "";
    local v122 = v118:find("#");
    if v122 ~= nil then
        v121 = v118:sub(v122);
    end;
    l_url_0 = v121;
    v121 = v21.stringify(l_Object_0.assign(v120, v115.query), v116) and ("?%s"):format(v121);
    return ("%s%s%s"):format(v119, v121, l_url_0);
end;
return v21;
