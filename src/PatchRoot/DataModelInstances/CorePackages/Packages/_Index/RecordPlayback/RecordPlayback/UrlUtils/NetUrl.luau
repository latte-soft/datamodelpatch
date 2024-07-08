local v0 = {
    version = "1.1.0", 
    options = {
        separator = "&", 
        cumulative_parameters = false, 
        legal_in_path = {
            [":"] = true, 
            ["-"] = true, 
            _ = true, 
            ["."] = true, 
            [""] = true, 
            ["~"] = true, 
            ["*"] = true, 
            ["'"] = true, 
            ["("] = true, 
            [")"] = true, 
            ["@"] = true, 
            ["&"] = true, 
            ["="] = true, 
            ["$"] = true, 
            [","] = true, 
            [";"] = true
        }, 
        legal_in_query = {
            [":"] = true, 
            ["-"] = true, 
            _ = true, 
            ["."] = true, 
            [","] = true, 
            [""] = true, 
            ["~"] = true, 
            ["*"] = true, 
            ["'"] = true, 
            [";"] = true, 
            ["("] = true, 
            [")"] = true, 
            ["@"] = true, 
            ["$"] = true
        }, 
        query_plus_is_space = true
    }, 
    services = {
        acap = 674, 
        cap = 1026, 
        dict = 2628, 
        ftp = 21, 
        gopher = 70, 
        http = 80, 
        https = 443, 
        iax = 4569, 
        icap = 1344, 
        imap = 143, 
        ipp = 631, 
        ldap = 389, 
        mtqp = 1038, 
        mupdate = 3905, 
        news = 2009, 
        nfs = 2049, 
        nntp = 119, 
        rtsp = 554, 
        sip = 5060, 
        snmp = 161, 
        telnet = 23, 
        tftp = 69, 
        vemmi = 575, 
        afs = 1483, 
        jms = 5673, 
        rsync = 873, 
        prospero = 191, 
        videotex = 516
    }
};
local function _(v1)
    return (v1:gsub("%%(%x%x)", function(v2)
        return (string.char((tonumber(v2, 16))));
    end));
end;
local function _(v4, v5)
    return (v4:gsub("([^%w])", function(v6)
        if not v5[v6] then
            return string.upper(string.format("%%%02x", string.byte(v6)));
        else
            return v6;
        end;
    end));
end;
local function _(v8)
    if v0.options.query_plus_is_space then
        v8 = v8:gsub("+", " ");
    end;
    return (v8:gsub("%%(%x%x)", function(v9)
        return (string.char((tonumber(v9, 16))));
    end));
end;
local function v13(v11, v12)
    if type(v11) == "table" then
        return v11:build() .. v12;
    else
        return v11 .. v12:build();
    end;
end;
v0.addSegment = function(v14, v15)
    if type(v15) == "string" then
        local l_path_0 = v14.path;
        local v17 = "/";
        local v18 = v15:gsub("^/+", "");
        local l_legal_in_path_0 = v0.options.legal_in_path;
        v14.path = l_path_0 .. v17 .. v18:gsub("([^%w])", function(v20)
            if not l_legal_in_path_0[v20] then
                return string.upper(string.format("%%%02x", string.byte(v20)));
            else
                return v20;
            end;
        end);
    end;
    return v14;
end;
v0.build = function(v21)
    local v22 = "";
    if v21.path then
        v22 = v22 .. tostring(v21.path);
    end;
    if v21.query then
        local v23 = tostring(v21.query);
        if v23 ~= "" then
            v22 = v22 .. "?" .. v23;
        end;
    end;
    if v21.host then
        local l_host_0 = v21.host;
        if not (not v21.port or not v21.scheme) and v0.services[v21.scheme] ~= v21.port then
            l_host_0 = l_host_0 .. ":" .. v21.port;
        end;
        local v25 = nil;
        if v21.user and v21.user ~= "" then
            v25 = v21.user;
            if v21.password then
                v25 = v25 .. ":" .. v21.password;
            end;
        end;
        if v25 and v25 ~= "" then
            l_host_0 = v25 .. "@" .. l_host_0;
        end;
        if l_host_0 then
            v22 = if v22 ~= "" then "//" .. l_host_0 .. "/" .. v22:gsub("^/+", "") else "//" .. l_host_0;
        end;
    end;
    if v21.scheme then
        v22 = v21.scheme .. ":" .. v22;
    end;
    if v21.fragment then
        v22 = v22 .. "#" .. v21.fragment;
    end;
    return v22;
end;
v0.buildQuery = function(v26, v27, v28)
    local v29 = {};
    if not v27 then
        v27 = v0.options.separator or "&";
    end;
    local v30 = {};
    for v31 in pairs(v26) do
        v30[#v30 + 1] = v31;
    end;
    table.sort(v30, function(v32, v33)
        local function v36(v34, v35)
            return ("%03d" .. v35):format((tonumber(v34)));
        end;
        return tostring(v32):gsub("(%d+)(%.)", v36) < tostring(v33):gsub("(%d+)(%.)", v36);
    end);
    for _, v38 in ipairs(v30) do
        local v39 = v26[v38];
        local v40 = tostring(v38);
        local v41 = {
            ["-"] = true, 
            _ = true, 
            ["."] = true
        };
        local l_v41_0 = v41 --[[ copy: 12 -> 14 ]];
        v38 = v40:gsub("([^%w])", function(v43)
            if not l_v41_0[v43] then
                return string.upper(string.format("%%%02x", string.byte(v43)));
            else
                return v43;
            end;
        end);
        if v28 then
            v38 = if not not v0.options.cumulative_parameters and string.find(v38, "^%d+$") then tostring(v28) else string.format("%s[%s]", tostring(v28), (tostring(v38)));
        end;
        if type(v39) == "table" then
            v29[#v29 + 1] = v0.buildQuery(v39, v27, v38);
        else
            v41 = tostring(v39);
            local l_legal_in_query_0 = v0.options.legal_in_query;
            v40 = v41:gsub("([^%w])", function(v45)
                if not l_legal_in_query_0[v45] then
                    return string.upper(string.format("%%%02x", string.byte(v45)));
                else
                    return v45;
                end;
            end);
            if v40 ~= "" then
                v29[#v29 + 1] = string.format("%s=%s", v38, v40);
            else
                v29[#v29 + 1] = v38;
            end;
        end;
    end;
    return table.concat(v29, v27);
end;
v0.parseQuery = function(v46, v47)
    if not v47 then
        v47 = v0.options.separator or "&";
    end;
    local v48 = {};
    for v49, v50 in v46:gmatch(string.format("([^%q=]+)(=*[^%q=]*)", v47, v47)) do
        local l_v49_0 = v49;
        if v0.options.query_plus_is_space then
            l_v49_0 = l_v49_0:gsub("+", " ");
        end;
        local v53 = l_v49_0:gsub("%%(%x%x)", function(v52)
            return (string.char((tonumber(v52, 16))));
        end);
        l_v49_0 = {};
        v53 = v53:gsub("%[([^%]]*)%]", function(v54)
            if not string.find(v54, "^-?%d+$") then
                local l_v54_0 = v54;
                if v0.options.query_plus_is_space then
                    l_v54_0 = l_v54_0:gsub("+", " ");
                end;
                v54 = l_v54_0:gsub("%%(%x%x)", function(v56)
                    return (string.char((tonumber(v56, 16))));
                end);
            else
                v54 = tonumber(v54);
            end;
            table.insert(l_v49_0, v54);
            return "=";
        end):gsub("=+.*$", ""):gsub("%s", "_");
        v50 = v50:gsub("^=+", "");
        if not v48[v53] then
            v48[v53] = {};
        end;
        if #l_v49_0 > 0 and type(v48[v53]) ~= "table" then
            v48[v53] = {};
        elseif #l_v49_0 == 0 and type(v48[v53]) == "table" then
            local l_v50_0 = v50;
            if v0.options.query_plus_is_space then
                l_v50_0 = l_v50_0:gsub("+", " ");
            end;
            v48[v53] = l_v50_0:gsub("%%(%x%x)", function(v58)
                return (string.char((tonumber(v58, 16))));
            end);
        elseif v0.options.cumulative_parameters and type(v48[v53]) == "string" then
            v48[v53] = {
                v48[v53]
            };
            local v59 = v48[v53];
            local l_v50_1 = v50;
            if v0.options.query_plus_is_space then
                l_v50_1 = l_v50_1:gsub("+", " ");
            end;
            table.insert(v59, (l_v50_1:gsub("%%(%x%x)", function(v61)
                return (string.char((tonumber(v61, 16))));
            end)));
        end;
        local v62 = v48[v53];
        for v63, v64 in ipairs(l_v49_0) do
            if type(v62) ~= "table" then
                v62 = {};
            end;
            if v64 == "" then
                v64 = #v62 + 1;
            end;
            if not v62[v64] then
                v62[v64] = {};
            end;
            if v63 == #l_v49_0 then
                v62[v64] = v50;
            end;
            v62 = v62[v64];
        end;
    end;
    setmetatable(v48, {
        __tostring = v0.buildQuery
    });
    return v48;
end;
v0.setQuery = function(v65, v66)
    local l_v66_0 = v66;
    if type(l_v66_0) == "table" then
        l_v66_0 = v0.buildQuery(l_v66_0);
    end;
    v65.query = v0.parseQuery(l_v66_0);
    return l_v66_0;
end;
v0.setAuthority = function(v68, v69)
    v68.authority = v69;
    v68.port = nil;
    v68.host = nil;
    v68.userinfo = nil;
    v68.user = nil;
    v68.password = nil;
    v69 = v69:gsub("^([^@]*)@", function(v70)
        v68.userinfo = v70;
        return "";
    end):gsub(":(%d+)$", function(v71)
        v68.port = tonumber(v71);
        return "";
    end);
    local v79 = (function(v72)
        local v73 = {
            v72:match("^(%d+)%.(%d+)%.(%d+)%.(%d+)$")
        };
        if #v73 == 4 then
            for _, v75 in pairs(v73) do
                if tonumber(v75) > 255 then
                    return false;
                end;
            end;
            return v72;
        else
            local v76 = {
                v72:match("^%[" .. ("([a-fA-F0-9]*):"):rep(8):gsub(":$", "%%]$"))
            };
            if #v76 ~= 8 and ((not (#v76 < 8) or not v72:match("::")) or v72:gsub("::", "", 1):match("::")) then
                return nil;
            else
                for _, v78 in pairs(v76) do
                    if #v78 > 0 and tonumber(v78, 16) > 65535 then
                        return false;
                    end;
                end;
                return v72;
            end;
        end;
    end)(v69);
    if not v79 then
        if not (not (type(v79) == "nil" and v69 ~= "") or v68.host) then
            local v80 = v69:lower();
            if ((string.match(v80, "^[%d%a%-%.]+$") ~= nil and string.sub(v80, 0, 1) ~= ".") and string.sub(v80, -1) ~= ".") and string.find(v80, "%.%.") == nil then
                v68.host = v80;
            end;
        end;
    else
        v68.host = v79;
    end;
    if v68.userinfo then
        local v82 = v68.userinfo:gsub(":([^:]*)$", function(v81)
            v68.password = v81;
            return "";
        end);
        if not string.find(v82, "^[%w%+%.]+$") then
            v68.userinfo = nil;
            v68.user = nil;
            v68.password = nil;
        else
            v68.user = v82;
            return v69;
        end;
    end;
    return v69;
end;
v0.parse = function(v83)
    local v84 = {};
    v0.setAuthority(v84, "");
    v0.setQuery(v84, "");
    v84.path = tostring(v83 or ""):gsub("#(.*)$", function(v85)
        v84.fragment = v85;
        return "";
    end):gsub("^([%w][%w%+%-%.]*)%:", function(v86)
        v84.scheme = v86:lower();
        return "";
    end):gsub("%?(.*)", function(v87)
        v0.setQuery(v84, v87);
        return "";
    end):gsub("^//([^/]*)", function(v88)
        v0.setAuthority(v84, v88);
        return "";
    end):gsub("([^/]+)", function(v89)
        local v91 = v89:gsub("%%(%x%x)", function(v90)
            return (string.char((tonumber(v90, 16))));
        end);
        local l_legal_in_path_1 = v0.options.legal_in_path;
        return (v91:gsub("([^%w])", function(v93)
            if not l_legal_in_path_1[v93] then
                return string.upper(string.format("%%%02x", string.byte(v93)));
            else
                return v93;
            end;
        end));
    end);
    setmetatable(v84, {
        __index = v0, 
        __tostring = v0.build, 
        __concat = v13, 
        __div = v0.addSegment
    });
    return v84;
end;
v0.removeDotSegments = function(v94)
    local v95 = {};
    if string.len(v94) == 0 then
        return "";
    else
        local v96 = false;
        local v97 = false;
        if string.sub(v94, 1, 1) == "/" then
            v96 = true;
        end;
        if (not (string.len(v94) <= 1) or v96 == false) and string.sub(v94, -1) == "/" then
            v97 = true;
        end;
        v94:gsub("[^/]+", function(v98)
            table.insert(v95, v98);
        end);
        local v99 = {};
        local v100 = 0;
        for _, v102 in ipairs(v95) do
            if v102 == ".." then
                if v100 > 0 then
                    v100 = v100 - 1;
                end;
            elseif v102 ~= "." then
                v100 = v100 + 1;
                v99[v100] = v102;
            end;
        end;
        local v103 = "";
        v103 = if #v99 > 0 and v100 > 0 then table.concat(v99, "/", 1, v100) else "";
        if v96 then
            v103 = "/" .. v103;
        end;
        if v97 then
            v103 = v103 .. "/";
        end;
        return v103;
    end;
end;
local function v113(v104, v105)
    if string.sub(v105, 1, 1) == "/" then
        return "/" .. string.gsub(v105, "^[%./]+", "");
    else
        local l_v104_0 = v104;
        local v107 = string.sub(l_v104_0, 1, 1) ~= "/";
        if v105 ~= "" then
            l_v104_0 = (not v107 and "/" or "") .. l_v104_0:gsub("[^/]*$", "");
        end;
        l_v104_0 = string.gsub((l_v104_0 .. v105):gsub("([^/]*%./)", function(v108)
            if v108 ~= "./" then
                return v108;
            else
                return "";
            end;
        end), "/%.$", "/");
        local v109 = nil;
        while v109 ~= l_v104_0 do
            v109 = l_v104_0;
            l_v104_0 = string.gsub(v109, "([^/]*/%.%./)", function(v110)
                if v110 ~= "../../" then
                    return "";
                else
                    return v110;
                end;
            end);
        end;
        l_v104_0 = string.gsub(l_v104_0, "([^/]*/%.%.?)$", function(v111)
            if v111 ~= "../.." then
                return "";
            else
                return v111;
            end;
        end);
        local v112 = nil;
        while v112 ~= l_v104_0 do
            v112 = l_v104_0;
            l_v104_0 = string.gsub(v112, "^/?%.%./", "");
        end;
        return (not v107 and "/" or "") .. l_v104_0;
    end;
end;
v0.resolve = function(v114, v115)
    if type(v114) == "string" then
        v114 = v0.parse(v114);
    end;
    if type(v115) == "string" then
        v115 = v0.parse(v115);
    end;
    if not v115.scheme then
        v115.scheme = v114.scheme;
        if not v115.authority or v115.authority == "" then
            v115:setAuthority(v114.authority);
            if not v115.path or v115.path == "" then
                v115.path = v114.path;
                local l_query_0 = v115.query;
                if not (l_query_0 and next(l_query_0)) then
                    v115.query = v114.query;
                    return v115;
                end;
            else
                v115.path = v113(v114.path, v115.path);
            end;
        end;
        return v115;
    else
        return v115;
    end;
end;
v0.normalize = function(v117)
    if type(v117) == "string" then
        v117 = v0.parse(v117);
    end;
    if v117.path then
        v117.path = string.gsub(v113(v117.path, ""), "//+", "/");
    end;
    return v117;
end;
return v0;
