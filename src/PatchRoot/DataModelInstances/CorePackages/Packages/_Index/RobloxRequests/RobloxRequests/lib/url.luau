local v0 = {
    version = "0.9.0", 
    options = {
        separator = "&"
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
local v1 = {
    ["-"] = true, 
    _ = true, 
    ["."] = true, 
    [""] = true, 
    ["~"] = true, 
    ["*"] = true, 
    ["'"] = true, 
    ["("] = true, 
    [")"] = true, 
    [":"] = true, 
    ["@"] = true, 
    ["&"] = true, 
    ["="] = true, 
    ["+"] = true, 
    ["$"] = true, 
    [","] = true, 
    [";"] = true
};
local function _(v2, v3)
    local l_v2_0 = v2;
    if not v3 then
        l_v2_0 = l_v2_0:gsub("+", " ");
    end;
    return (l_v2_0:gsub("%%(%x%x)", function(v5)
        return (string.char((tonumber(v5, 16))));
    end));
end;
local function _(v7)
    return (v7:gsub("([^A-Za-z0-9%_%.%-%~])", function(v8)
        return string.upper(string.format("%%%02x", string.byte(v8)));
    end));
end;
local function _(v10)
    return v10:gsub("([^A-Za-z0-9%_%.%-%~])", function(v11)
        return string.upper(string.format("%%%02x", string.byte(v11)));
    end):gsub("%%20", "+");
end;
local function v16(v13)
    return v13:gsub("([^a-zA-Z0-9])", function(v14)
        if not v1[v14] then
            return (v14:gsub("([^A-Za-z0-9%_%.%-%~])", function(v15)
                return string.upper(string.format("%%%02x", string.byte(v15)));
            end));
        else
            return v14;
        end;
    end);
end;
local function v19(v17, v18)
    return v17 .. v18:build();
end;
v0.build = function(v20)
    local v21 = "";
    if v20.path then
        local l_path_0 = v20.path;
        l_path_0:gsub("([^/]+)", function(v23)
            return v16(v23);
        end);
        v21 = v21 .. tostring(l_path_0);
    end;
    if v20.query then
        local v24 = tostring(v20.query);
        if v24 ~= "" then
            v21 = v21 .. "?" .. v24;
        end;
    end;
    if v20.host then
        local l_host_0 = v20.host;
        if not (not v20.port or not v20.scheme) and v0.services[v20.scheme] ~= v20.port then
            l_host_0 = l_host_0 .. ":" .. v20.port;
        end;
        local v26 = nil;
        if v20.user and v20.user ~= "" then
            v26 = v20.user;
            if v20.password then
                v26 = v26 .. ":" .. v20.password;
            end;
        end;
        if v26 and v26 ~= "" then
            l_host_0 = v26 .. "@" .. l_host_0;
        end;
        if l_host_0 then
            v21 = if v21 ~= "" then "//" .. l_host_0 .. "/" .. v21:gsub("^/+", "") else "//" .. l_host_0;
        end;
    end;
    if v20.scheme then
        v21 = v20.scheme .. ":" .. v21;
    end;
    if v20.fragment then
        v21 = v21 .. "#" .. v20.fragment;
    end;
    return v21;
end;
v0.buildQuery = function(v27, v28, v29)
    local v30 = {};
    if not v28 then
        v28 = v0.options.separator or "&";
    end;
    local v31 = {};
    for v32 in pairs(v27) do
        v31[#v31 + 1] = v32;
    end;
    table.sort(v31);
    for _, v34 in ipairs(v31) do
        local v35 = v27[v34];
        v34 = tostring(v34):gsub("([^A-Za-z0-9%_%.%-%~])", function(v36)
            return string.upper(string.format("%%%02x", string.byte(v36)));
        end);
        if v29 then
            v34 = string.format("%s[%s]", tostring(v29), (tostring(v34)));
        end;
        if type(v35) == "table" then
            v30[#v30 + 1] = v0.buildQuery(v35, v28, v34);
        else
            local v38 = tostring(v35):gsub("([^A-Za-z0-9%_%.%-%~])", function(v37)
                return string.upper(string.format("%%%02x", string.byte(v37)));
            end):gsub("%%20", "+");
            if v38 ~= "" then
                v30[#v30 + 1] = string.format("%s=%s", v34, v38);
            else
                v30[#v30 + 1] = v34;
            end;
        end;
    end;
    return table.concat(v30, v28);
end;
v0.parseQuery = function(v39, v40)
    if not v40 then
        v40 = v0.options.separator or "&";
    end;
    local v41 = {};
    for v42, v43 in v39:gmatch(string.format("([^%q=]+)(=*[^%q=]*)", v40, v40)) do
        local v45 = v42:gsub("+", " "):gsub("%%(%x%x)", function(v44)
            return (string.char((tonumber(v44, 16))));
        end);
        local v46 = {};
        v45 = v45:gsub("%[([^%]]*)%]", function(v47)
            table.insert(v46, if not string.find(v47, "^-?%d+$") then v47:gsub("+", " "):gsub("%%(%x%x)", function(v48)
                return (string.char((tonumber(v48, 16))));
            end) else tonumber(v47));
            return "=";
        end):gsub("=+.*$", ""):gsub("%s", "_");
        v43 = v43:gsub("^=+", "");
        if not v41[v45] then
            v41[v45] = {};
        end;
        if #v46 > 0 and type(v41[v45]) ~= "table" then
            v41[v45] = {};
        elseif #v46 == 0 and type(v41[v45]) == "table" then
            v41[v45] = v43:gsub("+", " "):gsub("%%(%x%x)", function(v49)
                return (string.char((tonumber(v49, 16))));
            end);
        end;
        local v50 = v41[v45];
        for v51, v52 in ipairs(v46) do
            if type(v50) ~= "table" then
                v50 = {};
            end;
            if v52 == "" then
                v52 = #v50 + 1;
            end;
            if not v50[v52] then
                v50[v52] = {};
            end;
            if v51 == #v46 then
                v50[v52] = v43:gsub("+", " "):gsub("%%(%x%x)", function(v53)
                    return (string.char((tonumber(v53, 16))));
                end);
            end;
            v50 = v50[v52];
        end;
    end;
    setmetatable(v41, {
        __tostring = v0.buildQuery
    });
    return v41;
end;
v0.setQuery = function(v54, v55)
    local l_v55_0 = v55;
    if type(l_v55_0) == "table" then
        l_v55_0 = v0.buildQuery(l_v55_0);
    end;
    v54.query = v0.parseQuery(l_v55_0);
    return l_v55_0;
end;
v0.setAuthority = function(v57, v58)
    v57.authority = v58;
    v57.port = nil;
    v57.host = nil;
    v57.userinfo = nil;
    v57.user = nil;
    v57.password = nil;
    v58 = v58:gsub("^([^@]*)@", function(v59)
        v57.userinfo = v59;
        return "";
    end):gsub("^%[[^%]]+%]", function(v60)
        v57.host = v60;
        return "";
    end):gsub(":([^:]*)$", function(v61)
        v57.port = tonumber(v61);
        return "";
    end);
    if not (not (v58 ~= "") or v57.host) then
        v57.host = v58:lower();
    end;
    if v57.userinfo then
        v57.user = v57.userinfo:gsub(":([^:]*)$", function(v62)
            v57.password = v62;
            return "";
        end);
    end;
    return v58;
end;
v0.parse = function(v63)
    local v64 = {};
    v0.setAuthority(v64, "");
    v0.setQuery(v64, "");
    v64.path = tostring(v63 or ""):gsub("#(.*)$", function(v65)
        v64.fragment = v65;
        return "";
    end):gsub("^([%w][%w%+%-%.]*)%:", function(v66)
        v64.scheme = v66:lower();
        return "";
    end):gsub("%?(.*)", function(v67)
        v0.setQuery(v64, v67);
        return "";
    end):gsub("^//([^/]*)", function(v68)
        v0.setAuthority(v64, v68);
        return "";
    end):gsub("%%(%x%x)", function(v69)
        return (string.char((tonumber(v69, 16))));
    end);
    setmetatable(v64, {
        __index = v0, 
        __concat = v19, 
        __tostring = v0.build
    });
    return v64;
end;
v0.removeDotSegments = function(v70)
    local v71 = {};
    if string.len(v70) == 0 then
        return "";
    else
        local v72 = false;
        local v73 = false;
        if string.sub(v70, 1, 1) == "/" then
            v72 = true;
        end;
        if (not (string.len(v70) <= 1) or v72 == false) and string.sub(v70, -1) == "/" then
            v73 = true;
        end;
        v70:gsub("[^/]+", function(v74)
            table.insert(v71, v74);
        end);
        local v75 = {};
        local v76 = 0;
        for _, v78 in ipairs(v71) do
            if v78 == ".." then
                if v76 > 0 then
                    v76 = v76 - 1;
                end;
            elseif v78 ~= "." then
                v76 = v76 + 1;
                v75[v76] = v78;
            end;
        end;
        local v79 = "";
        v79 = if #v75 > 0 and v76 > 0 then table.concat(v75, "/", 1, v76) else "";
        if v72 then
            v79 = "/" .. v79;
        end;
        if v73 then
            v79 = v79 .. "/";
        end;
        return v79;
    end;
end;
local function v88(v80, v81)
    if string.sub(v81, 1, 1) == "/" then
        return "/" .. string.gsub(v81, "^[%./]+", "");
    else
        local l_v80_0 = v80;
        if v81 ~= "" then
            l_v80_0 = "/" .. l_v80_0:gsub("[^/]*$", "");
        end;
        l_v80_0 = string.gsub((l_v80_0 .. v81):gsub("([^/]*%./)", function(v83)
            if v83 ~= "./" then
                return v83;
            else
                return "";
            end;
        end), "/%.$", "/");
        local v84 = nil;
        while v84 ~= l_v80_0 do
            v84 = l_v80_0;
            l_v80_0 = string.gsub(v84, "([^/]*/%.%./)", function(v85)
                if v85 ~= "../../" then
                    return "";
                else
                    return v85;
                end;
            end);
        end;
        l_v80_0 = string.gsub(l_v80_0, "([^/]*/%.%.?)$", function(v86)
            if v86 ~= "../.." then
                return "";
            else
                return v86;
            end;
        end);
        local v87 = nil;
        while v87 ~= l_v80_0 do
            v87 = l_v80_0;
            l_v80_0 = string.gsub(v87, "^/?%.%./", "");
        end;
        return "/" .. l_v80_0;
    end;
end;
v0.resolve = function(v89, v90)
    if type(v89) == "string" then
        v89 = v0.parse(v89);
    end;
    if type(v90) == "string" then
        v90 = v0.parse(v90);
    end;
    if not v90.scheme then
        v90.scheme = v89.scheme;
        if not v90.authority or v90.authority == "" then
            v90:setAuthority(v89.authority);
            if not v90.path or v90.path == "" then
                v90.path = v89.path;
                local l_query_0 = v90.query;
                if not (l_query_0 and next(l_query_0)) then
                    v90.query = v89.query;
                    return v90;
                end;
            else
                v90.path = v88(v89.path, v90.path);
            end;
        end;
        return v90;
    else
        return v90;
    end;
end;
v0.normalize = function(v92)
    if type(v92) == "string" then
        v92 = v0.parse(v92);
    end;
    if v92.path then
        v92.path = string.gsub(v88(v92.path, ""), "//+", "/");
    end;
    return v92;
end;
return v0;
