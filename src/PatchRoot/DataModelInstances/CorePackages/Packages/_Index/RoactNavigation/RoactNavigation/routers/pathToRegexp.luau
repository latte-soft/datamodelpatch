local l_Parent_0 = script.Parent.Parent.Parent;
local l_Array_0 = require(l_Parent_0.LuauPolyfill).Array;
local v2 = require(l_Parent_0.RegExp);
local function _(v3)
    return v3;
end;
local v5 = {};
local v6 = nil;
local v7 = nil;
local function v54(v8)
    local v9 = {};
    local v10 = 1;
    local function _(v11)
        v10 = v10 + 1;
        return v11;
    end;
    local function _(v13)
        return (string.sub(v8, v13, v13));
    end;
    local v15 = string.len(v8);
    while v10 <= v15 do
        local v16 = string.sub(v8, v10, v10);
        if not (v16 ~= "*" and v16 ~= "+") or v16 == "?" then
            local v17 = {
                type = "MODIFIER", 
                index = v10
            };
            local l_v10_0 = v10;
            v10 = v10 + 1;
            local l_l_v10_0_0 = l_v10_0;
            v17.value = string.sub(v8, l_l_v10_0_0, l_l_v10_0_0);
            table.insert(v9, v17);
        elseif v16 == "\\" then
            local v20 = {
                type = "ESCAPED_CHAR"
            };
            local l_v10_1 = v10;
            v10 = v10 + 1;
            v20.index = l_v10_1;
            local l_v10_2 = v10;
            v10 = v10 + 1;
            l_v10_1 = l_v10_2;
            v20.value = string.sub(v8, l_v10_1, l_v10_1);
            table.insert(v9, v20);
        elseif v16 == "{" then
            local v23 = {
                type = "OPEN", 
                index = v10
            };
            local l_v10_3 = v10;
            v10 = v10 + 1;
            local l_l_v10_3_0 = l_v10_3;
            v23.value = string.sub(v8, l_l_v10_3_0, l_l_v10_3_0);
            table.insert(v9, v23);
        elseif v16 == "}" then
            local v26 = {
                type = "CLOSE", 
                index = v10
            };
            local l_v10_4 = v10;
            v10 = v10 + 1;
            local l_l_v10_4_0 = l_v10_4;
            v26.value = string.sub(v8, l_l_v10_4_0, l_l_v10_4_0);
            table.insert(v9, v26);
        elseif v16 == ":" then
            local v29 = "";
            local v30 = v10 + 1;
            do
                local l_v30_0 = v30;
                local function _(v32)
                    l_v30_0 = l_v30_0 + 1;
                    return v32;
                end;
                while l_v30_0 <= v15 do
                    local v34 = string.byte(v8, l_v30_0);
                    if not (((not (v34 >= 48) or v34 > 57) and (not (v34 >= 65) or v34 > 90)) and (not (v34 >= 97) or v34 > 122)) or v34 == 95 then
                        local l_v29_0 = v29;
                        local l_l_v30_0_0 = l_v30_0;
                        l_v30_0 = l_v30_0 + 1;
                        local l_l_l_v30_0_0_0 = l_l_v30_0_0;
                        v29 = l_v29_0 .. string.sub(v8, l_l_l_v30_0_0_0, l_l_l_v30_0_0_0);
                    else
                        break;
                    end;
                end;
                if v29 == "" then
                    error((("Missing parameter name at %d"):format(v10)));
                end;
                table.insert(v9, {
                    type = "NAME", 
                    index = v10, 
                    value = v29
                });
                v10 = l_v30_0;
            end;
        elseif v16 == "(" then
            local v38 = 1;
            local v39 = "";
            local v40 = v10 + 1;
            local l_v40_0 = v40;
            if string.sub(v8, l_v40_0, l_v40_0) == "?" then
                error((("Pattern cannot start with \"?\" at %d"):format(v40)));
            end;
            do
                local l_v40_1 = v40;
                local function _(v43)
                    l_v40_1 = l_v40_1 + 1;
                    return v43;
                end;
                while l_v40_1 <= v15 do
                    local l_l_v40_1_0 = l_v40_1;
                    if string.sub(v8, l_l_v40_1_0, l_l_v40_1_0) == "\\" then
                        l_v40_0 = v39;
                        local l_l_v40_1_1 = l_v40_1;
                        l_v40_1 = l_v40_1 + 1;
                        local l_l_l_v40_1_1_0 = l_l_v40_1_1;
                        local v48 = string.sub(v8, l_l_l_v40_1_1_0, l_l_l_v40_1_1_0);
                        l_l_v40_1_1 = l_v40_1;
                        l_v40_1 = l_v40_1 + 1;
                        l_l_l_v40_1_1_0 = l_l_v40_1_1;
                        v39 = l_v40_0 .. v48 .. string.sub(v8, l_l_l_v40_1_1_0, l_l_l_v40_1_1_0);
                    end;
                    l_l_v40_1_0 = l_v40_1;
                    if string.sub(v8, l_l_v40_1_0, l_l_v40_1_0) == ")" then
                        v38 = v38 - 1;
                        if v38 == 0 then
                            l_v40_1 = l_v40_1 + 1;
                            break;
                        end;
                    else
                        l_l_v40_1_0 = l_v40_1;
                        if string.sub(v8, l_l_v40_1_0, l_l_v40_1_0) == "(" then
                            v38 = v38 + 1;
                            l_l_v40_1_0 = l_v40_1 + 1;
                            if string.sub(v8, l_l_v40_1_0, l_l_v40_1_0) ~= "?" then
                                error((("Capturing groups are not allowed at %d"):format(l_v40_1)));
                            end;
                        end;
                    end;
                    l_v40_0 = v39;
                    local l_l_v40_1_2 = l_v40_1;
                    l_v40_1 = l_v40_1 + 1;
                    local l_l_l_v40_1_2_0 = l_l_v40_1_2;
                    v39 = l_v40_0 .. string.sub(v8, l_l_l_v40_1_2_0, l_l_l_v40_1_2_0);
                end;
                if v38 ~= 0 then
                    error((("Unbalanced pattern at %d"):format(v10)));
                end;
                if v39 == "" then
                    error((("Missing pattern at %d"):format(v10)));
                end;
                table.insert(v9, {
                    type = "PATTERN", 
                    index = v10, 
                    value = v39
                });
                v10 = l_v40_1;
            end;
        else
            local v51 = {
                type = "CHAR", 
                index = v10
            };
            local l_v10_5 = v10;
            v10 = v10 + 1;
            local l_l_v10_5_0 = l_v10_5;
            v51.value = string.sub(v8, l_l_v10_5_0, l_l_v10_5_0);
            table.insert(v9, v51);
        end;
    end;
    table.insert(v9, {
        type = "END", 
        index = v10, 
        value = ""
    });
    return v9;
end;
v5.parse = function(v55, v56)
    local v57 = v56 or {};
    local v58 = v54(v55);
    local v59 = "./";
    if v57.prefixes ~= nil and v57.prefixes ~= "" then
        v59 = v57.prefixes;
    end;
    local v60 = string.format("[^%s]+?", v6(v57.delimiter or "/#?"));
    local v61 = {};
    local v62 = 0;
    local v63 = 1;
    local v64 = "";
    local function _(v65)
        v63 = v63 + 1;
        return v65;
    end;
    local function _(v67)
        v62 = v62 + 1;
        return v67;
    end;
    local function _(v69)
        if v63 <= #v58 and v58[v63].type == v69 then
            local l_v58_0 = v58;
            local l_v63_0 = v63;
            v63 = v63 + 1;
            return l_v58_0[l_v63_0].value;
        else
            return nil;
        end;
    end;
    local function v78(v73)
        local v74;
        if v63 <= #v58 and v58[v63].type == v73 then
            local l_v58_1 = v58;
            local l_v63_1 = v63;
            v63 = v63 + 1;
            v74 = l_v58_1[l_v63_1].value;
        else
            v74 = nil;
        end;
        if v74 ~= nil then
            return v74;
        else
            local v77 = v58[v63];
            if v77 == nil then
                error((("Expected token %s, got nil"):format(v73)));
            end;
            error((("Unexpected %s at %d, expected %s"):format(v77.type, v77.index, v73)));
            return ;
        end;
    end;
    local function v90()
        local v79 = "";
        local v80;
        if v63 <= #v58 and v58[v63].type == "CHAR" then
            local l_v58_2 = v58;
            local l_v63_2 = v63;
            v63 = v63 + 1;
            v80 = l_v58_2[l_v63_2].value;
        else
            v80 = nil;
        end;
        if not v80 then
            if v63 <= #v58 and v58[v63].type == "ESCAPED_CHAR" then
                local l_v58_3 = v58;
                local l_v63_3 = v63;
                v63 = v63 + 1;
                v80 = l_v58_3[l_v63_3].value;
            else
                v80 = nil;
            end;
        end;
        while v80 and v80 ~= "" do
            v79 = v79 .. v80;
            local v85;
            if v63 <= #v58 and v58[v63].type == "CHAR" then
                local l_v58_4 = v58;
                local l_v63_4 = v63;
                v63 = v63 + 1;
                v85 = l_v58_4[l_v63_4].value;
            else
                v85 = nil;
            end;
            if not v85 then
                if v63 <= #v58 and v58[v63].type == "ESCAPED_CHAR" then
                    local l_v58_5 = v58;
                    local l_v63_5 = v63;
                    v63 = v63 + 1;
                    v85 = l_v58_5[l_v63_5].value;
                else
                    v85 = nil;
                end;
            end;
            v80 = v85;
        end;
        return v79;
    end;
    while v63 <= #v58 do
        local v91;
        if v63 <= #v58 and v58[v63].type == "CHAR" then
            local l_v63_6 = v63;
            v63 = v63 + 1;
            v91 = v58[l_v63_6].value;
        else
            v91 = nil;
        end;
        local v93;
        if v63 <= #v58 and v58[v63].type == "NAME" then
            local l_v63_7 = v63;
            v63 = v63 + 1;
            v93 = v58[l_v63_7].value;
        else
            v93 = nil;
        end;
        local v95;
        if v63 <= #v58 and v58[v63].type == "PATTERN" then
            local l_v63_8 = v63;
            v63 = v63 + 1;
            v95 = v58[l_v63_8].value;
        else
            v95 = nil;
        end;
        if not (not v93 or v93 == "") or v95 and v95 ~= "" then
            local v97 = v91 or "";
            if string.find(v59, v97) == nil then
                v64 = v64 .. v97;
                v97 = "";
            end;
            if v64 ~= nil and v64 ~= "" then
                table.insert(v61, v64);
                v64 = "";
            end;
            local l_v93_0 = v93;
            if not (v93 ~= nil) or v93 == "" then
                local l_v62_0 = v62;
                v62 = v62 + 1;
                l_v93_0 = l_v62_0;
            end;
            local l_v95_0 = v95;
            if not (v95 ~= nil) or v95 == "" then
                l_v95_0 = v60;
            end;
            local v101 = {
                name = l_v93_0, 
                prefix = v97, 
                suffix = "", 
                pattern = l_v95_0
            };
            local v102;
            if v63 <= #v58 and v58[v63].type == "MODIFIER" then
                local l_v63_9 = v63;
                v63 = v63 + 1;
                v102 = v58[l_v63_9].value;
            else
                v102 = nil;
            end;
            v101.modifier = v102 or "";
            table.insert(v61, v101);
        else
            local l_v91_0 = v91;
            if not l_v91_0 then
                if v63 <= #v58 and v58[v63].type == "ESCAPED_CHAR" then
                    local l_v63_10 = v63;
                    v63 = v63 + 1;
                    l_v91_0 = v58[l_v63_10].value;
                else
                    l_v91_0 = nil;
                end;
            end;
            if l_v91_0 and l_v91_0 ~= "" then
                v64 = v64 .. l_v91_0;
            else
                if v64 and v64 ~= "" then
                    table.insert(v61, v64);
                    v64 = "";
                end;
                local v106;
                if v63 <= #v58 and v58[v63].type == "OPEN" then
                    local l_v63_11 = v63;
                    v63 = v63 + 1;
                    v106 = v58[l_v63_11].value;
                else
                    v106 = nil;
                end;
                if v106 and v106 ~= "" then
                    local v108 = v90();
                    local v109;
                    if v63 <= #v58 and v58[v63].type == "NAME" then
                        local l_v63_12 = v63;
                        v63 = v63 + 1;
                        v109 = v58[l_v63_12].value;
                    else
                        v109 = nil;
                    end;
                    local v111 = v109 or "";
                    local v112;
                    if v63 <= #v58 and v58[v63].type == "PATTERN" then
                        local l_v63_13 = v63;
                        v63 = v63 + 1;
                        v112 = v58[l_v63_13].value;
                    else
                        v112 = nil;
                    end;
                    v109 = v112 or "";
                    v112 = v90();
                    v78("CLOSE");
                    if v111 == "" and v109 ~= "" then
                        local l_v62_1 = v62;
                        v62 = v62 + 1;
                        v111 = l_v62_1;
                    end;
                    if (v111 ~= "" and v111 ~= 0) and (not (v109 ~= nil) or v109 == "") then
                        v109 = v60;
                    end;
                    local v115 = {
                        name = v111, 
                        pattern = v109, 
                        prefix = v108, 
                        suffix = v112
                    };
                    local v116;
                    if v63 <= #v58 and v58[v63].type == "MODIFIER" then
                        local l_v63_14 = v63;
                        v63 = v63 + 1;
                        v116 = v58[l_v63_14].value;
                    else
                        v116 = nil;
                    end;
                    v115.modifier = v116 or "";
                    table.insert(v61, v115);
                else
                    v78("END");
                end;
            end;
        end;
    end;
    return v61;
end;
v5.compile = function(v118, v119)
    return v5.tokensToFunction(v5.parse(v118, v119), v119);
end;
v5.tokensToFunction = function(v120, v121)
    if v121 == nil then
        v121 = {};
    end;
    local l_v121_0 = v121;
    local v123 = v7(l_v121_0);
    local v125 = l_v121_0.encode or function(v124)
        return v124;
    end;
    local l_validate_0 = l_v121_0.validate;
    if l_validate_0 == nil then
        l_validate_0 = true;
    end;
    local v128 = l_Array_0.map(v120, function(v127)
        if type(v127) == "table" then
            return v2(("^(?:%s)$"):format(v127.pattern), v123);
        else
            return nil;
        end;
    end);
    return function(v129)
        local v130 = "";
        for v131, v132 in v120, nil, nil do
            if type(v132) == "string" then
                v130 = v130 .. v132;
            else
                local v133 = if not v129 then nil else v129[tostring(v132.name)];
                local v134 = true;
                if v132.modifier ~= "?" then
                    v134 = v132.modifier == "*";
                end;
                local v135 = true;
                if v132.modifier ~= "*" then
                    v135 = v132.modifier == "+";
                end;
                if not l_Array_0.isArray(v133) then
                    local v136 = type(v133);
                    if not (v136 ~= "string") or v136 == "number" then
                        local v137 = v125(tostring(v133), v132);
                        if not (not l_validate_0 or v128[v131]:test(v137)) then
                            error((("Expected \"%s\" to match \"%s\", but got \"%s\""):format(v132.name, v132.pattern, v137)));
                        end;
                        v130 = v130 .. v132.prefix .. v137 .. v132.suffix;
                    elseif not v134 then
                        error((("Expected \"%s\" to be %s"):format(tostring(v132.name), not v135 and "a string" or "an array")));
                    end;
                else
                    if not v135 then
                        error((("Expected \"%s\" to not repeat, but got an array"):format(v132.name)));
                    end;
                    if #v133 == 0 then
                        if not v134 then
                            error((("Expected \"%s\" to not be empty"):format(v132.name)));
                        else
                            continue;
                        end;
                    end;
                    for _, v139 in v133, nil, nil do
                        local v140 = v125(v139, v132);
                        if not (not l_validate_0 or v128[v131]:test(v140)) then
                            error((("Expected all \"%s\" to match \"%s\", but got \"%s\""):format(v132.name, v132.pattern, v140)));
                        end;
                        v130 = v130 .. v132.prefix .. v140 .. v132.suffix;
                    end;
                end;
            end;
        end;
        return v130;
    end;
end;
v5.match = function(v141, v142)
    local v143 = {};
    return v5.regexpToFunction(v5.pathToRegexp(v141, v143, v142), v143, v142);
end;
v5.regexpToFunction = function(v144, v145, v146)
    if v146 == nil then
        v146 = {};
    end;
    local v148 = v146.decode or function(v147)
        return v147;
    end;
    return function(v149)
        local v150 = v144:exec(v149);
        if v150 then
            local v151 = v150[1];
            local v152 = v150.index or 0;
            local v153 = {};
            for v154 = 2, v150.n do
                if v150[v154] ~= nil then
                    local v155 = v145[v154 - 1];
                    if not (v155.modifier ~= "*") or v155.modifier == "+" then
                        v153[v155.name] = l_Array_0.map(string.split(v150[v154], v155.prefix .. v155.suffix), function(v156)
                            return v148(v156, v155);
                        end);
                    else
                        v153[v155.name] = v148(v150[v154], v155);
                    end;
                end;
            end;
            return {
                path = v151, 
                index = v152, 
                params = v153
            };
        else
            return false;
        end;
    end;
end;
v6 = function(v157)
    return string.gsub(v157, "[%.%+%*%?=%!:${}%(%)%[%]|/\\]", function(v158)
        return "\\" .. v158;
    end);
end;
v7 = function(v159)
    if not v159 or not v159.sensitive then
        return "i";
    else
        return "";
    end;
end;
local function v164(v160, v161, v162)
    return v2(("(?:%s)"):format(table.concat(l_Array_0.map(v160, function(v163)
        return v5.pathToRegexp(v163, v161, v162).source;
    end), "|")), v7(v162));
end;
local function v168(v165, v166, v167)
    return v5.tokensToRegexp(v5.parse(v165, v167), v166, v167);
end;
v5.tokensToRegexp = function(v169, v170, v171)
    local v172 = {};
    if v171 ~= nil then
        v172 = v171;
    end;
    local l_strict_0 = v172.strict;
    if l_strict_0 == nil then
        l_strict_0 = false;
    end;
    local l_start_0 = v172.start;
    if l_start_0 == nil then
        l_start_0 = true;
    end;
    local l_end__0 = v172.end_;
    if l_end__0 == nil then
        l_end__0 = true;
    end;
    local v177 = v172.encode or function(v176)
        return v176;
    end;
    local v178 = not v172.endsWith and "$" or ("[%s]|$"):format(v6(v172.endsWith or ""));
    local v179 = ("[%s]"):format(v6(v172.delimiter or "/#?"));
    local v180 = not l_start_0 and "" or "^";
    for _, v182 in v169, nil, nil do
        if type(v182) == "string" then
            v180 = v180 .. v6(v177(v182));
        else
            local v183 = v6(v177(v182.prefix));
            local v184 = v6(v177(v182.suffix));
            if v182.pattern and v182.pattern ~= "" then
                if v170 then
                    table.insert(v170, v182);
                end;
                if not (not v183 or v183 == "") or v184 and v184 ~= "" then
                    if not (v182.modifier ~= "+") or v182.modifier == "*" then
                        v180 = v180 .. ("(?:%s((?:%s)(?:%s%s(?:%s))*)%s)%s"):format(v183, v182.pattern, v184, v183, v182.pattern, v184, v182.modifier == "*" and "?" or "");
                    else
                        v180 = v180 .. ("(?:%s(%s)%s)%s"):format(v183, v182.pattern, v184, v182.modifier);
                    end;
                else
                    v180 = v180 .. ("(%s)%s"):format(v182.pattern, v182.modifier);
                end;
            else
                v180 = v180 .. ("(?:%s%s)%s"):format(v183, v184, v182.modifier);
            end;
        end;
    end;
    if not l_end__0 then
        local v185 = v169[#v169];
        local v186 = v185 == nil;
        if type(v185) == "string" then
            v186 = string.find(v179, v185:sub(-1)) ~= nil;
        end;
        if not l_strict_0 then
            v180 = v180 .. string.format("(?:%s(?=%s))?", v179, v178);
        end;
        if not v186 then
            v180 = v180 .. string.format("(?=%s|%s)", v179, v178);
        end;
    else
        if not l_strict_0 then
            v180 = v180 .. ("%s?"):format(v179);
        end;
        v180 = if not not v172.endsWith and v172.endsWith ~= "" then v180 .. ("(?=%s)"):format(v178) else v180 .. "$";
    end;
    return v2(v180, v7(v172));
end;
v5.pathToRegexp = function(v187, v188, v189)
    if not l_Array_0.isArray(v187) then
        return v168(v187, v188, v189);
    else
        return v164(v187, v188, v189);
    end;
end;
return v5;
