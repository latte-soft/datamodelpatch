local v0 = {};
v0.mt = {
    __index = v0
};
v0.new = function(_, v2)
    local v3 = {};
    local v4 = nil;
    if getmetatable(v2) == v0.mt then
        v4 = true;
    end;
    if type(v2) == "table" then
        if not v4 and #v2 > 0 then
            for _, v6 in ipairs(v2) do
                v3[v6] = true;
            end;
        else
            for v7 in pairs(v2) do
                v3[v7] = true;
            end;
        end;
    elseif v2 ~= nil then
        v3 = {
            [v2] = true
        };
    end;
    return (setmetatable(v3, v0.mt));
end;
v0.add = function(v8, v9)
    if v9 ~= nil then
        v8[v9] = true;
    end;
    return v8;
end;
v0.remove = function(v10, v11)
    if v11 ~= nil then
        v10[v11] = nil;
    end;
    return v10;
end;
v0.tolist = function(v12)
    local v13 = {};
    for v14 in pairs(v12) do
        table.insert(v13, v14);
    end;
    return v13;
end;
v0.to_list = v0.tolist;
v0.mt.__add = function(v15, v16)
    local v17 = v0:new();
    local v18 = v0:new(v15);
    local v19 = v0:new(v16);
    for v20 in pairs(v18) do
        v17[v20] = true;
    end;
    for v21 in pairs(v19) do
        v17[v21] = true;
    end;
    return v17;
end;
v0.mt.__sub = function(v22, v23)
    local v24 = v0:new();
    local v25 = v0:new(v22);
    local v26 = v0:new(v23);
    for v27 in pairs(v25) do
        v24[v27] = true;
    end;
    for v28 in pairs(v26) do
        v24[v28] = nil;
    end;
    return v24;
end;
v0.mt.__mul = function(v29, v30)
    local v31 = v0:new();
    local v32 = v0:new(v29);
    local v33 = v0:new(v30);
    for v34 in pairs(v32) do
        v31[v34] = v33[v34];
    end;
    return v31;
end;
v0.mt.__tostring = function(v35)
    local v36 = "{";
    local v37 = "";
    for v38 in pairs(v35) do
        v36 = v36 .. v37 .. tostring(v38);
        v37 = ", ";
    end;
    return v36 .. "}";
end;
local v39 = {};
v39.mt = {
    __index = v39
};
v39.new = function(_, v41, v42, v43, v44, v45, v46)
    local v47 = {
        index = v41, 
        name = v42, 
        level = 0, 
        parent = nil, 
        root = nil, 
        nodes = {}, 
        _openstart = v45, 
        _openend = v46, 
        _closestart = v45, 
        _closeend = v46, 
        attributes = {}, 
        id = nil, 
        classes = {}, 
        deepernodes = v0:new(), 
        deeperelements = {}, 
        deeperattributes = {}, 
        deeperids = {}, 
        deeperclasses = {}
    };
    v47.attrs = v47.attributes;
    v47.children = v47.nodes;
    v47.descendants = v47.deepernodes;
    v47.descendant_elements = v47.deeperelements;
    v47.descendant_attrs = v47.deeperattributes;
    v47.descendent_ids = v47.deeperids;
    v47.descendant_classes = v47.deeperclasses;
    if v43 then
        if not v44 then
            v47.root = v43.root;
            v47.parent = v43.parent or v43;
            v47.level = v43.level;
            table.insert(not not v43.parent and v43.parent.nodes or v43.nodes, v47);
        else
            v47.root = v43.root;
            v47.parent = v43;
            v47.level = v43.level + 1;
            table.insert(v43.nodes, v47);
        end;
    else
        v47.name = "root";
        v47.root = v47;
        v47._text = v42;
        local v48 = string.len(v42);
        v47._openstart = 1;
        v47._openend = v48;
        v47._closestart = 1;
        v47._closeend = v48;
    end;
    return (setmetatable(v47, v39.mt));
end;
v39.text = function(v49)
    return (string.sub(v49.root._text, v49._openstart, v49._closeend));
end;
v39.gettext = v39.text;
v39.settext = function(v50, v51)
    v50.root._text = v51;
end;
v39.textonly = function(v52)
    return (v52:text():gsub("<[^>]*>", ""));
end;
v39.content = function(v53)
    return (string.sub(v53.root._text, v53._openend + 1, v53._closestart - 1));
end;
v39.getcontent = v39.content;
v39.addattribute = function(v54, v55, v56)
    v54.attributes[v55] = v56;
    if string.lower(v55) == "id" then
        v54.id = v56;
        return ;
    else
        if string.lower(v55) == "class" then
            for v57 in string.gmatch(v56, "%S+") do
                table.insert(v54.classes, v57);
            end;
        end;
        return ;
    end;
end;
v39.links = function(v58)
    local v59 = {};
    for _, v61 in ipairs(v58:select("a[href]")) do
        if #v61.attributes.href > 0 then
            table.insert(v59, v61.attributes.href);
        end;
    end;
    return v59;
end;
v39.absolutelinks = function(v62, v63)
    v63 = ((v63 or v62.page_url) or ""):split("?")[1]:split("#")[1];
    local v64 = v63:split("://");
    v64 = v64[#v64]:split("/")[1];
    local v65 = not not v63:find("://") and v63:split("://")[1] or "http";
    while v63:sub(-1, -1) == "/" do
        v63 = v63:sub(1, -2);
    end;
    local v66 = {};
    for _, v68 in ipairs(v62:select("a[href]")) do
        if #v68.attributes.href > 0 then
            local l_href_0 = v68.attributes.href;
            if not l_href_0:find("://") then
                l_href_0 = if l_href_0:sub(1, 2) == "//" then v65 .. ":" .. l_href_0 else if l_href_0:sub(1, 1) == "/" then v65 .. "://" .. v64 .. l_href_0 else v63 .. "/" .. l_href_0;
            end;
            table.insert(v66, l_href_0);
        end;
    end;
    return v66;
end;
v39.absolute_links = v39.absolutelinks;
local function _(v70, v71, v72)
    v70[v71] = v70[v71] or v0:new();
    v70[v71]:add(v72);
end;
v39.close = function(v74, v75, v76)
    if not (not v75 or not v76) then
        v74._closestart = v75;
        v74._closeend = v76;
    end;
    local l_v74_0 = v74;
    while true do
        l_v74_0 = l_v74_0.parent;
        if l_v74_0 then
            l_v74_0.deepernodes:add(v74);
            local l_deeperelements_0 = l_v74_0.deeperelements;
            local l_name_0 = v74.name;
            l_deeperelements_0[l_name_0] = l_deeperelements_0[l_name_0] or v0:new();
            l_deeperelements_0[l_name_0]:add(v74);
            for v80 in pairs(v74.attributes) do
                local l_deeperattributes_0 = l_v74_0.deeperattributes;
                l_deeperattributes_0[v80] = l_deeperattributes_0[v80] or v0:new();
                l_deeperattributes_0[v80]:add(v74);
            end;
            if v74.id then
                l_deeperelements_0 = l_v74_0.deeperids;
                l_name_0 = v74.id;
                l_deeperelements_0[l_name_0] = l_deeperelements_0[l_name_0] or v0:new();
                l_deeperelements_0[l_name_0]:add(v74);
            end;
            for _, v83 in ipairs(v74.classes) do
                local l_deeperclasses_0 = l_v74_0.deeperclasses;
                l_deeperclasses_0[v83] = l_deeperclasses_0[v83] or v0:new();
                l_deeperclasses_0[v83]:add(v74);
            end;
        else
            break;
        end;
    end;
end;
local function v86(v85)
    return string.gsub(v85, "([%^%$%(%)%%%.%[%]%*%+%-%?])", "%%" .. "%1");
end;
local function v128(v87, v88)
    if not (v88 and type(v88) == "string") or v88 == "" then
        return v0:new();
    else
        local v89 = {
            [""] = v87.deeperelements, 
            ["["] = v87.deeperattributes, 
            ["#"] = v87.deeperids, 
            ["."] = v87.deeperclasses
        };
        local function v103(v90, v91)
            local v92 = nil;
            local v93 = nil;
            local v94 = nil;
            if v90 == "[" then
                local v95, v96, v97, v98 = string.match(v91, "([=|%*~%$%]?)" .. "(=?)" .. "(.*)");
                v91 = v95;
                v92 = v96;
                v93 = v97;
                v94 = v98;
            end;
            local v99 = v0:new(v89[v90][v91]);
            if v93 == "=" then
                if #v94 < 2 then
                    v94 = "'" .. v94 .. "'";
                end;
                v94 = string.sub(v94, 2, #v94 - 1);
                if v92 == "" then
                    v99 = v0:new(v87.deepernodes);
                end;
                for v100 in pairs(v99) do
                    local v101 = v100.attributes[v91];
                    if v92 == "" and v101 ~= v94 then
                        v99:remove(v100);
                    elseif v92 == "" and v101 == v94 then
                        v99:remove(v100);
                    elseif v92 == "|" and string.match(v101, "^[^-]*") ~= v94 then
                        v99:remove(v100);
                    elseif v92 == "*" and string.match(v101, v86(v94)) ~= v94 then
                        v99:remove(v100);
                    elseif v92 == "~" then
                        v99:remove(v100);
                        for v102 in string.gmatch(v101, "%S+") do
                            if v102 == v94 then
                                v99:add(v100);
                                break;
                            end;
                        end;
                    elseif v92 == "^" and string.match(v101, "^" .. string.gsub(v94, "([%^%$%(%)%%%.%[%]%*%+%-%?])", "%%" .. "%1")) ~= v94 then
                        v99:remove(v100);
                    elseif v92 == "$" and string.match(v101, string.gsub(v94, "([%^%$%(%)%%%.%[%]%*%+%-%?])", "%%" .. "%1") .. "$") ~= v94 then
                        v99:remove(v100);
                    end;
                end;
            end;
            return v99;
        end;
        local v104, v105, v106 = v0:new({
            v87
        });
        for v107 in string.gmatch(v88, "%S+") do
            if v107 == ">" then
                v106 = true;
            else
                v105 = v0:new();
                for v108 in pairs(v104) do
                    local l_deepernodes_0 = v108.deepernodes;
                    if v106 then
                        l_deepernodes_0 = v0:new(v108.nodes);
                    end;
                    v105 = v105 + l_deepernodes_0;
                end;
                v106 = false;
                if v107 ~= "*" then
                    local v110, v111 = v0:new();
                    local v112 = 0;
                    local v113 = 0;
                    while true do
                        local v114 = nil;
                        local v115 = nil;
                        local v116 = nil;
                        local v117 = nil;
                        local v118 = nil;
                        local v119, v120, v121, v122, v123, v124, v125 = string.find(v107, "(%(?%)?)" .. "([:%[#.]?)" .. "([%w-_\\]+)" .. "([|%*~%$%]?=?)" .. "(['\"]?)", v113 + 1);
                        v112 = v119;
                        v113 = v120;
                        v114 = v121;
                        v115 = v122;
                        v116 = v123;
                        v117 = v124;
                        v118 = v125;
                        if v116 then
                            if v115 == ":" then
                                v111 = v116;
                            else
                                if v114 == ")" then
                                    v111 = nil;
                                end;
                                if v115 == "[" and v118 ~= "" then
                                    v119 = nil;
                                    v120, v121, v122 = string.find(v107, "(%b" .. v118 .. v118 .. ")]", v113);
                                    v112 = v120;
                                    v113 = v121;
                                    v116 = v116 .. v117 .. v122;
                                end;
                                v119 = v103(v115, v116);
                                if v111 == "not" then
                                    v110 = v110 + v119;
                                else
                                    v105 = v105 * v119;
                                end;
                            end;
                        else
                            break;
                        end;
                    end;
                    v105 = v105 - v110;
                    v104 = v0:new(v105);
                end;
            end;
        end;
        v105 = v105:tolist();
        table.sort(v105, function(v126, v127)
            return v126.index < v127.index;
        end);
        return v105;
    end;
end;
v39.select = function(v129, v130)
    return v128(v129, v130);
end;
v39.mt.__call = v128;
return v39;
