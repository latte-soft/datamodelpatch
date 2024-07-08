local v0 = {
    cacheSize = 256, 
    unicodeData = false
};
local v1 = v0.unicodeData and require(script:WaitForChild("_unicodechar_category"));
local v2 = v0.unicodeData and require(script:WaitForChild("_scripts"));
local v3 = v0.unicodeData and require(script:WaitForChild("_xuc"));
local v4 = setmetatable({}, {
    __mode = "k"
});
local v5 = {};
local v6 = {};
local v7 = {};
local v8 = nil;
local function v17(v9, v10)
    if v10 then
        v9 = string.sub(v9, utf8.offset(v9, v10));
    end;
    local v11 = utf8.len(v9);
    if v11 <= 1999 then
        return {
            n = v11, 
            s = v9; 
            utf8.codepoint(v9, 1, #v9)
        };
    else
        local v12 = math.ceil(v11 / 1999);
        local v13 = table.create(v11);
        local v14 = 1;
        for v15 = 1, v12 do
            local v16 = table.pack(utf8.codepoint(v9, utf8.offset(v9, v15 * 1999 - 1998), utf8.offset(v9, v15 * 1999 - (v15 == v12 and 1998 - ((v11 - 1) % 1999 + 1) or -1)) - 1));
            table.move(v16, 1, v16.n, v14, v13);
            v14 = v14 + v16.n;
        end;
        v13.s = v9;
        v13.n = v11;
        return v13;
    end;
end;
local function v23(v18)
    local v19 = v18.n or #v18;
    if v19 <= 7997 then
        return utf8.char(table.unpack(v18));
    else
        local v20 = math.ceil(v19 / 7997);
        local v21 = table.create(v20);
        for v22 = 1, v20 do
            v21[v22] = utf8.char(table.unpack(v18, v22 * 7997 - 7996, v22 * 7997 - (v22 == v20 and 7997 - ((v19 - 1) % 7997 + 1) or 0)));
        end;
        return table.concat(v21);
    end;
end;
local function _(v24, v25, v26)
    v26 = utf8.offset(v24, v26);
    return (string.sub(v24, utf8.offset(v24, v25), v26 and v26 - 1));
end;
local v28 = {
    a = "anchored", 
    i = "caseless", 
    m = "multiline", 
    s = "dotall", 
    u = "unicode", 
    U = "ungreedy", 
    x = "extended"
};
local v29 = {
    alnum = true, 
    alpha = true, 
    ascii = true, 
    blank = true, 
    cntrl = true, 
    digit = true, 
    graph = true, 
    lower = true, 
    print = true, 
    punct = true, 
    space = true, 
    upper = true, 
    word = true, 
    xdigit = true
};
local v30 = {
    [68] = {
        "class", 
        "digit", 
        true
    }, 
    [83] = {
        "class", 
        "space", 
        true
    }, 
    [87] = {
        "class", 
        "word", 
        true
    }, 
    [100] = {
        "class", 
        "digit", 
        false
    }, 
    [115] = {
        "class", 
        "space", 
        false
    }, 
    [119] = {
        "class", 
        "word", 
        false
    }, 
    [72] = {
        "class", 
        "blank", 
        true
    }, 
    [86] = {
        "class", 
        "vertical_tab", 
        true
    }, 
    [104] = {
        "class", 
        "blank", 
        false
    }, 
    [118] = {
        "class", 
        "vertical_tab", 
        false
    }, 
    [78] = {
        78
    }, 
    [82] = {
        82
    }, 
    [66] = 8, 
    [110] = 10, 
    [114] = 13, 
    [116] = 9
};
local v31 = {
    [98] = {
        98, 
        {
            "class", 
            "word", 
            false
        }
    }, 
    [66] = {
        66, 
        {
            "class", 
            "word", 
            false
        }
    }, 
    [75] = {
        75
    }, 
    [71] = {
        71
    }, 
    [74] = {
        74
    }, 
    [90] = {
        90
    }, 
    [122] = {
        122
    }
};
local v32 = {
    C = true, 
    Cc = true, 
    Cf = true, 
    Cn = true, 
    Co = true, 
    Cs = true, 
    L = true, 
    Ll = true, 
    Lm = true, 
    Lo = true, 
    Lt = true, 
    Lu = true, 
    M = true, 
    Mc = true, 
    Me = true, 
    Mn = true, 
    N = true, 
    Nd = true, 
    Nl = true, 
    No = true, 
    P = true, 
    Pc = true, 
    Pd = true, 
    Pe = true, 
    Pf = true, 
    Pi = true, 
    Po = true, 
    Ps = true, 
    S = true, 
    Sc = true, 
    Sk = true, 
    Sm = true, 
    So = true, 
    Z = true, 
    Zl = true, 
    Zp = true, 
    Zs = true, 
    Xan = true, 
    Xps = true, 
    Xsp = true, 
    Xuc = true, 
    Xwd = true
};
local v33 = {
    [33] = true, 
    [34] = true, 
    [35] = true, 
    [36] = true, 
    [37] = true, 
    [38] = true, 
    [39] = true, 
    [40] = true, 
    [41] = true, 
    [42] = true, 
    [43] = true, 
    [44] = true, 
    [45] = true, 
    [46] = true, 
    [47] = true, 
    [58] = true, 
    [59] = true, 
    [60] = true, 
    [61] = true, 
    [62] = true, 
    [63] = true, 
    [64] = true, 
    [91] = true, 
    [92] = true, 
    [93] = true, 
    [94] = true, 
    [95] = true, 
    [96] = true, 
    [123] = true, 
    [124] = true, 
    [125] = true, 
    [126] = true
};
local v34 = {
    36
};
local v35 = {
    46
};
local v36 = {
    94
};
local v37 = {
    124
};
local function _(v38, v39, v40)
    if v38 == "Match" then
        return function(...)
            if select("#", ...) < 1 then
                error("missing argument #1 (Match expected)", 2);
            end;
            local v41, v42 = ...;
            if not v4[v41] or v4[v41].name ~= "Match" then
                error(string.format("invalid argument #1 to %q (Match expected, got %s)", v39, (typeof(v41))), 2);
            else
                v41 = v4[v41];
            end;
            if (not (v39 ~= "group") or v39 == "span") and v42 == nil then
                v42 = 0;
            end;
            return v40(v41, v42);
        end;
    else
        return function(...)
            local v43 = select("#", ...);
            if v43 < 1 then
                error("missing argument #1 (RegEx expected)", 2);
            elseif v43 < 2 then
                error("missing argument #2 (string expected)", 2);
            end;
            local v44, v45, v46, v47, v48, v49 = ...;
            if not v4[v44] or v4[v44].name ~= "RegEx" then
                if type(v44) ~= "string" and type(v44) ~= "number" then
                    error(string.format("invalid argument #1 to %q (RegEx expected, got %s)", v39, (typeof(v44))), 2);
                end;
                v44 = v5.fromstring(v44);
            elseif v39 == "sub" then
                if type(v46) == "number" then
                    v46 = v46 .. "";
                elseif type(v46) ~= "string" then
                    error(string.format("invalid argument #3 to 'sub' (string expected, got %s)", (typeof(v46))), 2);
                end;
            elseif type(v45) == "number" then
                v45 = v45 .. "";
            elseif type(v45) ~= "string" then
                error(string.format("invalid argument #2 to %q (string expected, got %s)", v39, (typeof(v45))), 2);
            end;
            if v39 ~= "sub" and v39 ~= "split" then
                local v50 = typeof(v46);
                if v50 ~= "nil" then
                    v46 = tonumber(v46);
                    if v46 then
                        v46 = if v46 < 0 then (#v45 + math.floor(v46 + 0.5)) + 1 else math.max(math.floor(v46 + 0.5), 1);
                    else
                        error(string.format("invalid argument #3 to %q (number expected, got %s)", v39, v50), 2);
                    end;
                end;
            end;
            v44 = v4[v44];
            if not (v39 ~= "match") or v39 == "matchiter" then
                v47 = ...;
            elseif v39 == "sub" then
                v49 = ...;
            end;
            return v40(v44, v45, v46, v47, v48, v49);
        end;
    end;
end;
local function v62(v52)
    local l_spans_0 = v4[v52].spans;
    local v54 = l_spans_0[0][1];
    local v55 = l_spans_0[0][2];
    if v55 <= v54 then
        return string.format("Match (%d..%d, empty)", v54, v55 - 1);
    else
        local l_format_0 = string.format;
        local v57 = "Match (%d..%d): %s";
        local l_v54_0 = v54;
        local v59 = v55 - 1;
        local l_input_0 = l_spans_0.input;
        local v61 = utf8.offset(l_input_0, v55);
        return l_format_0(v57, l_v54_0, v59, (string.sub(l_input_0, utf8.offset(l_input_0, v54), v61 and v61 - 1)));
    end;
end;
local function v69(v63, v64, v65, v66)
    v63.source = v65;
    v63.input = v66;
    local v67 = newproxy(true);
    local v68 = getmetatable(v67);
    v68.__metatable = v8;
    v68.__index = setmetatable(v63, v7);
    v68.__tostring = v62;
    v4[v67] = {
        name = "Match", 
        spans = v63, 
        group_id = v64
    };
    return v67;
end;
local function v76(v70, v71)
    local v72 = v70.spans[type(v71) == "number" and v71 or v70.group_id[v71]];
    if v72 then
        local l_input_1 = v70.spans.input;
        local v74 = v72[1];
        local v75 = utf8.offset(l_input_1, v72[2]);
        return (string.sub(l_input_1, utf8.offset(l_input_1, v74), v75 and v75 - 1));
    else
        return nil;
    end;
end;
local v77 = "group";
local l_v77_0 = v77 --[[ copy: 27 -> 47 ]];
local l_v76_0 = v76 --[[ copy: 26 -> 48 ]];
v7.group = function(...)
    if select("#", ...) < 1 then
        error("missing argument #1 (Match expected)", 2);
    end;
    local v80, v81 = ...;
    if not v4[v80] or v4[v80].name ~= "Match" then
        error(string.format("invalid argument #1 to %q (Match expected, got %s)", l_v77_0, (typeof(v80))), 2);
    else
        v80 = v4[v80];
    end;
    if (not (l_v77_0 ~= "group") or l_v77_0 == "span") and v81 == nil then
        v81 = 0;
    end;
    return l_v76_0(v80, v81);
end;
v76 = function(v82, v83)
    local v84 = v82.spans[type(v83) == "number" and v83 or v82.group_id[v83]];
    if v84 then
        return v84[1], v84[2] - 1;
    else
        return nil;
    end;
end;
v77 = "span";
local l_v77_1 = v77 --[[ copy: 27 -> 49 ]];
local l_v76_1 = v76 --[[ copy: 26 -> 50 ]];
v7.span = function(...)
    if select("#", ...) < 1 then
        error("missing argument #1 (Match expected)", 2);
    end;
    local v87, v88 = ...;
    if not v4[v87] or v4[v87].name ~= "Match" then
        error(string.format("invalid argument #1 to %q (Match expected, got %s)", l_v77_1, (typeof(v87))), 2);
    else
        v87 = v4[v87];
    end;
    if (not (l_v77_1 ~= "group") or l_v77_1 == "span") and v88 == nil then
        v88 = 0;
    end;
    return l_v76_1(v87, v88);
end;
v76 = function(v89)
    local l_spans_1 = v89.spans;
    if l_spans_1.n > 0 then
        local v91 = table.create(l_spans_1.n);
        for v92 = 0, l_spans_1.n do
            local v93 = l_spans_1[v92];
            if v93 then
                local l_input_2 = l_spans_1.input;
                local v95 = v93[1];
                local v96 = utf8.offset(l_input_2, v93[2]);
                v91[v92] = string.sub(l_input_2, utf8.offset(l_input_2, v95), v96 and v96 - 1);
            end;
        end;
        return table.unpack(v91, 1, l_spans_1.n);
    else
        local l_input_3 = l_spans_1.input;
        local v98 = l_spans_1[0][1];
        local v99 = utf8.offset(l_input_3, l_spans_1[0][2]);
        return (string.sub(l_input_3, utf8.offset(l_input_3, v98), v99 and v99 - 1));
    end;
end;
v77 = "groups";
local l_v77_2 = v77 --[[ copy: 27 -> 51 ]];
local l_v76_2 = v76 --[[ copy: 26 -> 52 ]];
v7.groups = function(...)
    if select("#", ...) < 1 then
        error("missing argument #1 (Match expected)", 2);
    end;
    local v102, v103 = ...;
    if not v4[v102] or v4[v102].name ~= "Match" then
        error(string.format("invalid argument #1 to %q (Match expected, got %s)", l_v77_2, (typeof(v102))), 2);
    else
        v102 = v4[v102];
    end;
    if (not (l_v77_2 ~= "group") or l_v77_2 == "span") and v103 == nil then
        v103 = 0;
    end;
    return l_v76_2(v102, v103);
end;
v76 = function(v104)
    local l_spans_2 = v104.spans;
    local v106 = {};
    for v107, v108 in pairs(v104.group_id) do
        v108 = l_spans_2[v108];
        if v108 then
            local l_input_4 = l_spans_2.input;
            local v110 = v108[1];
            local v111 = utf8.offset(l_input_4, v108[2]);
            v106[v107] = string.sub(l_input_4, utf8.offset(l_input_4, v110), v111 and v111 - 1);
        end;
    end;
    return v106;
end;
v77 = "groupdict";
local l_v77_3 = v77 --[[ copy: 27 -> 53 ]];
local l_v76_3 = v76 --[[ copy: 26 -> 54 ]];
v7.groupdict = function(...)
    if select("#", ...) < 1 then
        error("missing argument #1 (Match expected)", 2);
    end;
    local v114, v115 = ...;
    if not v4[v114] or v4[v114].name ~= "Match" then
        error(string.format("invalid argument #1 to %q (Match expected, got %s)", l_v77_3, (typeof(v114))), 2);
    else
        v114 = v4[v114];
    end;
    if (not (l_v77_3 ~= "group") or l_v77_3 == "span") and v115 == nil then
        v115 = 0;
    end;
    return l_v76_3(v114, v115);
end;
v76 = function(v116)
    local l_spans_3 = v116.spans;
    local v118 = table.create(l_spans_3.n);
    for v119 = 0, l_spans_3.n do
        local v120 = l_spans_3[v119];
        if v120 then
            local l_input_5 = l_spans_3.input;
            local v122 = v120[1];
            local v123 = utf8.offset(l_input_5, v120[2]);
            v118[v119] = string.sub(l_input_5, utf8.offset(l_input_5, v122), v123 and v123 - 1);
        end;
    end;
    v118.n = l_spans_3.n;
    return v118;
end;
v77 = "groupdict";
local l_v77_4 = v77 --[[ copy: 27 -> 55 ]];
local l_v76_4 = v76 --[[ copy: 26 -> 56 ]];
v7.grouparr = function(...)
    if select("#", ...) < 1 then
        error("missing argument #1 (Match expected)", 2);
    end;
    local v126, v127 = ...;
    if not v4[v126] or v4[v126].name ~= "Match" then
        error(string.format("invalid argument #1 to %q (Match expected, got %s)", l_v77_4, (typeof(v126))), 2);
    else
        v126 = v4[v126];
    end;
    if (not (l_v77_4 ~= "group") or l_v77_4 == "span") and v127 == nil then
        v127 = 0;
    end;
    return l_v76_4(v126, v127);
end;
local v128 = {
    CR = 0, 
    LF = 1, 
    CRLF = 2, 
    ANYRLF = 3, 
    ANY = 4, 
    NUL = 5
};
v76 = function(v129, v130, v131)
    local l_newline_0 = v131.newline;
    local v133 = v129[v130];
    if l_newline_0 == 0 then
        return v133 == 13;
    elseif l_newline_0 == 2 then
        local v134 = false;
        if v133 == 10 then
            v134 = v129[v130 - 1] == 32;
        end;
        return v134;
    elseif l_newline_0 == 3 then
        local v135 = true;
        if v133 ~= 10 then
            v135 = v133 == 13;
        end;
        return v135;
    elseif l_newline_0 == 4 then
        local v136 = true;
        if v133 ~= 10 then
            v136 = true;
            if v133 ~= 11 then
                v136 = true;
                if v133 ~= 12 then
                    v136 = true;
                    if v133 ~= 13 then
                        v136 = true;
                        if v133 ~= 133 then
                            v136 = true;
                            if v133 ~= 8232 then
                                v136 = v133 == 8233;
                            end;
                        end;
                    end;
                end;
            end;
        end;
        return v136;
    elseif l_newline_0 == 5 then
        return v133 == 0;
    else
        return v133 == 10;
    end;
end;
v77 = function(v137, v138, v139, v140, v141)
    local v142 = v138[v139];
    if v142 then
        if (v140.ignoreCase and v142 >= 97) and v142 <= 122 then
            v142 = v142 - 32;
        end;
        if type(v137) == "number" then
            return v137 == v142;
        elseif v137[1] == "charset" then
            for _, v144 in ipairs(v137[3]) do
                if v77(v144, v138, v139, v140, v141) then
                    return not v137[2];
                end;
            end;
            return v137[2];
        elseif v137[1] == "range" then
            local v145;
            if v137[2] <= v142 then
                v145 = true;
                if not (v142 > v137[3]) then
                    goto label0;
                end;
            end;
            v145 = v140.ignoreCase;
            if v145 then
                v145 = false;
                if v142 >= 65 then
                    v145 = false;
                    if v142 <= 90 then
                        v145 = false;
                        if v137[2] <= v142 + 32 then
                            v145 = v142 + 32 <= v137[3];
                        end;
                    end;
                end;
            end;
            ::label0::;
            return v145;
        elseif v137[1] == "class" then
            local v146 = v137[2];
            local v147 = v137[3];
            local v148 = false;
            if v146 == "xdigit" then
                local v149;
                if v142 >= 48 then
                    v149 = true;
                    if not (v142 > 57) then
                        goto label1;
                    end;
                end;
                if v142 >= 65 then
                    v149 = true;
                    if not (v142 > 70) then
                        goto label1;
                    end;
                end;
                v149 = false;
                if v142 >= 97 then
                    v149 = v142 <= 102;
                end;
                ::label1::;
                v148 = v149;
            elseif v146 == "ascii" then
                v148 = v142 <= 127;
            elseif v146 == "vertical_tab" then
                local v150;
                if v142 >= 10 then
                    v150 = true;
                    if not (v142 > 13) then
                        goto label2;
                    end;
                end;
                v150 = true;
                if v142 ~= 8232 then
                    v150 = v142 == 8233;
                end;
                ::label2::;
                v148 = v150;
            elseif not v140.unicode then
                if v146 == "alnum" then
                    local v151;
                    if v142 >= 48 then
                        v151 = true;
                        if not (v142 > 57) then
                            goto label3;
                        end;
                    end;
                    if v142 >= 65 then
                        v151 = true;
                        if not (v142 > 90) then
                            goto label3;
                        end;
                    end;
                    v151 = false;
                    if v142 >= 97 then
                        v151 = v142 <= 122;
                    end;
                    ::label3::;
                    v148 = v151;
                elseif v146 == "alpha" then
                    local v152;
                    if v142 >= 65 then
                        v152 = true;
                        if not (v142 > 90) then
                            goto label4;
                        end;
                    end;
                    v152 = false;
                    if v142 >= 97 then
                        v152 = v142 <= 122;
                    end;
                    ::label4::;
                    v148 = v152;
                elseif v146 == "blank" then
                    local v153 = true;
                    if v142 ~= 9 then
                        v153 = v142 == 32;
                    end;
                    v148 = v153;
                elseif v146 == "cntrl" then
                    local v154 = true;
                    if v142 > 31 then
                        v154 = v142 == 127;
                    end;
                    v148 = v154;
                elseif v146 == "digit" then
                    local v155 = false;
                    if v142 >= 48 then
                        v155 = v142 <= 57;
                    end;
                    v148 = v155;
                elseif v146 == "graph" then
                    local v156 = false;
                    if v142 >= 33 then
                        v156 = v142 <= 126;
                    end;
                    v148 = v156;
                elseif v146 == "lower" then
                    local v157 = false;
                    if v142 >= 97 then
                        v157 = v142 <= 122;
                    end;
                    v148 = v157;
                elseif v146 == "print" then
                    local v158 = false;
                    if v142 >= 32 then
                        v158 = v142 <= 126;
                    end;
                    v148 = v158;
                elseif v146 == "punct" then
                    v148 = v33[v142];
                elseif v146 == "space" then
                    local v159;
                    if v142 >= 9 then
                        v159 = true;
                        if not (v142 > 13) then
                            goto label5;
                        end;
                    end;
                    v159 = v142 == 32;
                    ::label5::;
                    v148 = v159;
                elseif v146 == "upper" then
                    local v160 = false;
                    if v142 >= 65 then
                        v160 = v142 <= 90;
                    end;
                    v148 = v160;
                elseif v146 == "word" then
                    local v161;
                    if v142 >= 48 then
                        v161 = true;
                        if not (v142 > 57) then
                            goto label6;
                        end;
                    end;
                    if v142 >= 65 then
                        v161 = true;
                        if not (v142 > 90) then
                            goto label6;
                        end;
                    end;
                    if v142 >= 97 then
                        v161 = true;
                        if not (v142 > 122) then
                            goto label6;
                        end;
                    end;
                    v161 = v142 == 95;
                    ::label6::;
                    v148 = v161;
                end;
            else
                local v162 = v1[v142] or "Cn";
                local v163 = v162:sub(1, 1);
                if v146 == "alnum" then
                    local v164 = true;
                    if v163 ~= "L" then
                        v164 = true;
                        if v162 ~= "Nl" then
                            v164 = v162 == "Nd";
                        end;
                    end;
                    v148 = v164;
                elseif v146 == "alpha" then
                    local v165 = true;
                    if v163 ~= "L" then
                        v165 = v162 == "Nl";
                    end;
                    v148 = v165;
                elseif v146 == "blank" then
                    local v166 = true;
                    if v162 ~= "Zs" then
                        v166 = v142 == 9;
                    end;
                    v148 = v166;
                elseif v146 == "cntrl" then
                    v148 = v162 == "Cc";
                elseif v146 == "digit" then
                    v148 = v162 == "Nd";
                elseif v146 == "graph" then
                    local v167 = false;
                    if v163 ~= "P" then
                        v167 = v163 ~= "C";
                    end;
                    v148 = v167;
                elseif v146 == "lower" then
                    v148 = v162 == "Ll";
                elseif v146 == "print" then
                    v148 = v163 ~= "C";
                elseif v146 == "punct" then
                    v148 = v163 == "P";
                elseif v146 == "space" then
                    local v168 = true;
                    if v163 ~= "Z" then
                        v168 = false;
                        if v142 >= 9 then
                            v168 = v142 <= 13;
                        end;
                    end;
                    v148 = v168;
                elseif v146 == "upper" then
                    v148 = v162 == "Lu";
                elseif v146 == "word" then
                    local v169 = true;
                    if v163 ~= "L" then
                        v169 = true;
                        if v162 ~= "Nl" then
                            v169 = true;
                            if v162 ~= "Nd" then
                                v169 = v162 == "Pc";
                            end;
                        end;
                    end;
                    v148 = v169;
                end;
            end;
            if not v147 then
                return v148;
            else
                return not v148;
            end;
        elseif v137[1] == "category" then
            local v170 = v1[v142] or "Cn";
            local v171 = v137[3];
            local v172 = #v171;
            if v172 == 3 then
                local v173 = false;
                if not (v171 ~= "Xan") or v171 == "Xwd" then
                    local v174 = v170:find("^[LN]");
                    if not v174 then
                        v174 = false;
                        if v171 == "Xwd" then
                            v174 = v142 == 95;
                        end;
                    end;
                    v173 = v174;
                elseif not (v171 ~= "Xps") or v171 == "Xsp" then
                    local v175 = true;
                    if v170:sub(1, 1) ~= "Z" then
                        v175 = false;
                        if v142 >= 9 then
                            v175 = v142 <= 13;
                        end;
                    end;
                    v173 = v175;
                elseif v171 == "Xuc" then
                    v173 = v77(v3, v138, v139, v140, v141);
                end;
                if not v137[2] then
                    return v173;
                else
                    return not v173;
                end;
            elseif v170:sub(1, v172) == v171 then
                return not v137[2];
            else
                return v137[2];
            end;
        elseif v137[1] == 46 then
            return v140.dotAll or not v76(v138, v139, v141);
        elseif v137[1] == 78 then
            return not v76(v138, v139, v141);
        elseif v137[1] == 82 then
            if v141.newline_seq == 0 then
                local v176 = true;
                if v142 ~= 10 then
                    v176 = v142 == 13;
                end;
                return v176;
            else
                local v177 = true;
                if v142 ~= 10 then
                    v177 = true;
                    if v142 ~= 11 then
                        v177 = true;
                        if v142 ~= 12 then
                            v177 = true;
                            if v142 ~= 13 then
                                v177 = true;
                                if v142 ~= 133 then
                                    v177 = true;
                                    if v142 ~= 8232 then
                                        v177 = v142 == 8233;
                                    end;
                                end;
                            end;
                        end;
                    end;
                end;
                return v177;
            end;
        else
            return false;
        end;
    else
        return false;
    end;
end;
local function v183(v178, v179, v180)
    while true do
        local v181 = v178[v179];
        local v182 = type(v181) == "table";
        if v181 == v37 then
            return v179, v180;
        else
            if v182 and v181[1] == 40 then
                if v180 then
                    v180 = v180 + v181.count;
                end;
                v179 = v181[3];
            elseif ((v182 and v181[1] == "quantifier") and type(v181[5]) == "table") and v181[5][1] == 40 then
                if v180 then
                    v180 = v180 + v181[5].count;
                end;
                v179 = v181[5][3];
            elseif not v181 or v182 and v181[1] == 41 then
                return nil, v180;
            elseif v180 then
                v180 = if not not v182 and v181[1] == "quantifier" then v180 + v181[3] else v180 + 1;
            end;
            v179 = v179 + 1;
        end;
    end;
end;
local function v265(v184, v185, v186, v187, v188, v189)
    local v190 = 0;
    local l_v186_0 = v186;
    local l_v186_1 = v186;
    local v193 = {};
    while true do
        if not v190 then
            break;
        elseif v190 == 0 then
            v190 = v190 + 1;
            local v194 = v183(v184, v190);
            if v194 then
                table.insert(v193, 1, {
                    "alternation", 
                    v194, 
                    l_v186_0
                });
            end;
        else
            local v195 = v184[v190];
            local v196 = false;
            if type(v195) == "table" then
                v196 = v195[1];
            end;
            if v195 then
                if v195 == "ACCEPT" then
                    local v197 = true;
                    local l_v190_0 = v190;
                    while true do
                        l_v190_0 = l_v190_0 + 1;
                        local v199 = type(v184[l_v190_0]) == "table";
                        local v200 = v184[l_v190_0];
                        if v199 and (not (v200[1] ~= 40) or (v200[1] == "quantifier" and type(v200[5]) == "table") and v200[5][1] == 40) then
                            l_v190_0 = v200[1] == "quantifier" and v200[5][3] or v200[3];
                        elseif (v199 and v200[1] == 41) and (not (v200[4] ~= 33) or v200[4] == 61) then
                            v197 = false;
                            v190 = l_v190_0;
                            break;
                        end;
                        if not v200 then
                            break;
                        end;
                    end;
                    if v197 then
                        break;
                    end;
                elseif not (v195 ~= "PRUNE") or v195 == "SKIP" then
                    table.insert(v193, 1, {
                        v195, 
                        l_v186_0
                    });
                    v190 = v190 + 1;
                elseif v196 == 40 then
                    table.insert(v193, 1, {
                        "group", 
                        v190, 
                        l_v186_0, 
                        nil, 
                        v195[2], 
                        v195[3], 
                        v195[4]
                    });
                    v190 = v190 + 1;
                    local l_v183_0 = v183;
                    local l_v184_0 = v184;
                    local l_v190_1 = v190;
                    local v204;
                    if v195[4] ~= 33 then
                        v204 = false;
                        if not (v195[4] == 61) then
                            goto label7;
                        end;
                    end;
                    v204 = v195[5] and 0;
                    ::label7::;
                    l_v183_0, l_v184_0 = l_v183_0(l_v184_0, l_v190_1, v204);
                    if l_v183_0 then
                        table.insert(v193, 1, {
                            "alternation", 
                            l_v183_0, 
                            l_v186_0
                        });
                    end;
                    if l_v184_0 then
                        l_v186_0 = l_v186_0 - l_v184_0;
                    end;
                elseif v196 == 41 and v195[4] ~= 33 then
                    if not (v195[4] ~= 33) or v195[4] == 61 then
                        local v205, v206;
                        while true do
                            v206 = nil;
                            v205 = table.remove(v193, 1);
                            if not (v205[1] == "group" and v205[2] == v195[3]) then
                                if not (not (v205[1] == "matchStart") or v206) and v195[4] == 61 then
                                    v206 = v205;
                                end;
                            else
                                break;
                            end;
                        end;
                        if not (not (not (v195[4] ~= 33) or v195[4] == 61) or v195[5]) then
                            l_v186_0 = v205[3];
                        end;
                        if v206 then
                            table.insert(v193, 1, v206);
                        end;
                    elseif v195[4] == 62 then
                        while true do
                            local v207 = table.remove(v193, 1);
                            if not (v207 and (not (v207[1] == "group") or v207[2] ~= v195[3])) then
                                break;
                            end;
                        end;
                    else
                        for _, v209 in ipairs(v193) do
                            if v209[1] == "group" and v209[2] == v195[3] then
                                if v209.jmp then
                                    v190 = v209.jmp;
                                end;
                                v209[4] = l_v186_0;
                                if v209[7] == "quantifier" and v209[10] + 1 < v209[9] then
                                    if not (v184[v195[3]][4] == "lazy") or v209[10] + 1 < v209[8] then
                                        v190 = v195[3];
                                    end;
                                    local v210 = v184[v195[3]];
                                    table.insert(v193, 1, {
                                        "group", 
                                        v209[2], 
                                        l_v186_0, 
                                        nil, 
                                        v210[5][2], 
                                        v210[5][3], 
                                        "quantifier", 
                                        v210[2], 
                                        v210[3], 
                                        v209[10] + 1, 
                                        v209[11], 
                                        v210[4]
                                    });
                                    if v209[11] then
                                        table.insert(v193, 1, {
                                            "alternation", 
                                            v209[11], 
                                            l_v186_0
                                        });
                                        break;
                                    else
                                        break;
                                    end;
                                else
                                    break;
                                end;
                            end;
                        end;
                    end;
                    v190 = v190 + 1;
                elseif v196 == 75 then
                    table.insert(v193, 1, {
                        "matchStart", 
                        l_v186_0
                    });
                    v190 = v190 + 1;
                elseif v196 == 124 then
                    local l_v190_2 = v190;
                    while true do
                        l_v190_2 = l_v190_2 + 1;
                        local v212 = type(v184[l_v190_2]) == "table";
                        local v213 = v184[l_v190_2];
                        if v212 and (not (v213[1] ~= 40) or (v213[1] == "quantifier" and type(v213[5]) == "table") and v213[5][1] == 40) then
                            l_v190_2 = v213[1] == "quantifier" and v213[5][3] or v213[3];
                        end;
                        if not (not v212 or v213[1] ~= 41) or not v213 then
                            break;
                        end;
                    end;
                    if not v184[l_v190_2] then
                        v190 = l_v190_2;
                    else
                        for _, v215 in ipairs(v193) do
                            if v215[1] == "group" and v215[6] == l_v190_2 then
                                v190 = v215[6];
                                break;
                            end;
                        end;
                    end;
                elseif v196 == "recurmatch" then
                    table.insert(v193, 1, {
                        "group", 
                        v195[3], 
                        l_v186_0, 
                        nil, 
                        nil, 
                        v184[v195[3]][3], 
                        nil; 
                        jmp = v190
                    });
                    v190 = v195[3] + 1;
                    local v216, _ = v183(v184, v190);
                    if v216 then
                        table.insert(v193, 1, {
                            "alternation", 
                            v216, 
                            l_v186_0
                        });
                    end;
                else
                    local v218 = nil;
                    if v195 == "FAIL" then
                        v218 = false;
                    elseif v196 == 41 then
                        while true do
                            local v219 = table.remove(v193, 1);
                            if not (not (v219[1] == "group") or v219[2] ~= v195[3]) then
                                break;
                            end;
                        end;
                    elseif v196 == "quantifier" then
                        if type(v195[5]) == "table" and v195[5][1] == 40 then
                            local v220 = v183(v184, v190 + 1);
                            if v220 then
                                table.insert(v193, 1, {
                                    "alternation", 
                                    v220, 
                                    l_v186_0
                                });
                            end;
                            table.insert(v193, not v220 and 1 or 2, {
                                "group", 
                                v190, 
                                l_v186_0, 
                                nil, 
                                v195[5][2], 
                                v195[5][3], 
                                "quantifier", 
                                v195[2], 
                                v195[3], 
                                0, 
                                v220, 
                                v195[4]
                            });
                            if v195[4] == "lazy" and v195[2] == 0 then
                                v190 = v195[5][3];
                            end;
                            v218 = true;
                        else
                            local v221 = nil;
                            local v222 = nil;
                            local v223 = 1;
                            local v224 = false;
                            if type(v195[5]) == "table" then
                                v224 = v195[5][1] == "backref";
                            end;
                            if v224 then
                                v223 = 0;
                                local v225 = v195[5][2];
                                for _, v227 in ipairs(v193) do
                                    if v227[1] == "group" and v227[5] == v225 then
                                        v221 = v227[3];
                                        v222 = v227[4];
                                        v223 = v222 - v221;
                                        break;
                                    end;
                                end;
                            end;
                            local v228 = l_v186_0 + v195[2] * v223;
                            local v229 = 0;
                            while v229 < v195[3] do
                                if not v224 then
                                    if not v77(v195[5], v185, l_v186_0, v187, v188) then
                                        break;
                                    end;
                                elseif not (not v221 or not v222) then
                                    local l_l_v186_0_0 = l_v186_0;
                                    local l_s_0 = v185.s;
                                    local l_v221_0 = v221;
                                    local v233 = utf8.offset(l_s_0, v222);
                                    local v234 = string.sub(l_s_0, utf8.offset(l_s_0, l_v221_0), v233 and v233 - 1);
                                    l_v221_0 = v185.s;
                                    v233 = utf8.offset(l_v221_0, l_v186_0 + v223);
                                    if not (v234 == string.sub(l_v221_0, utf8.offset(l_v221_0, l_l_v186_0_0), v233 and v233 - 1)) then
                                        break;
                                    end;
                                else
                                    break;
                                end;
                                l_v186_0 = l_v186_0 + v223;
                                v229 = v229 + 1;
                            end;
                            v218 = v195[2] <= v229;
                            if v218 and v195[4] ~= "possessive" then
                                if v195[4] == "lazy" then
                                    local l_l_v186_0_1 = l_v186_0;
                                    l_v186_0 = v228;
                                    v228 = l_l_v186_0_1;
                                end;
                                table.insert(v193, 1, {
                                    "quantifier", 
                                    v190, 
                                    l_v186_0, 
                                    math.min(v228, v185.n + 1), 
                                    (v195[4] == "lazy" and 1 or -1) * v223
                                });
                            end;
                        end;
                    elseif v196 == "backref" then
                        local v236 = nil;
                        local v237 = nil;
                        local v238 = v195[2];
                        for _, v240 in ipairs(v193) do
                            if v240[1] == "group" and v240[5] == v238 then
                                v236 = v240[3];
                                v237 = v240[4];
                                break;
                            end;
                        end;
                        if not (not v236 or not v237) then
                            local l_l_v186_0_2 = l_v186_0;
                            l_v186_0 = l_v186_0 + (v237 - v236);
                            local l_s_1 = v185.s;
                            local l_v236_0 = v236;
                            local v244 = utf8.offset(l_s_1, v237);
                            local v245 = string.sub(l_s_1, utf8.offset(l_s_1, l_v236_0), v244 and v244 - 1);
                            l_v236_0 = v185.s;
                            v244 = utf8.offset(l_v236_0, l_v186_0);
                            v218 = v245 == string.sub(l_v236_0, utf8.offset(l_v236_0, l_l_v186_0_2), v244 and v244 - 1);
                        end;
                    else
                        local v246 = v185[l_v186_0];
                        if not (v196 ~= 36 and v196 ~= 90) or v196 == 122 then
                            local v247 = true;
                            if l_v186_0 ~= v185.n + 1 then
                                if not (not (v196 == 36) or not v187.multiline) then
                                    v247 = v76(v185, l_v186_0 + 1, v188);
                                    if v247 then
                                        goto label8;
                                    end;
                                end;
                                v247 = false;
                                if v196 == 90 then
                                    v247 = false;
                                    if l_v186_0 == v185.n then
                                        v247 = v76(v185, l_v186_0, v188);
                                    end;
                                end;
                            end;
                            ::label8::;
                            v218 = v247;
                        elseif not (v196 ~= 94 and v196 ~= 65) or v196 == 71 then
                            local v248 = true;
                            if l_v186_0 ~= 1 then
                                if not (not (v196 == 94) or not v187.multiline) then
                                    v248 = v76(v185, l_v186_0 - 1, v188);
                                    if v248 then
                                        goto label9;
                                    end;
                                end;
                                v248 = false;
                                if v196 == 71 then
                                    v248 = l_v186_0 == v186;
                                end;
                            end;
                            ::label9::;
                            v218 = v248;
                        elseif not (v196 ~= 66) or v196 == 98 then
                            local v249 = true;
                            if l_v186_0 ~= 1 then
                                v249 = v187.multiline and v76(v185, l_v186_0 - 1, v188);
                            end;
                            local v250 = true;
                            if l_v186_0 ~= v185.n + 1 then
                                v250 = v187.multiline and v76(v185, l_v186_0, v188);
                            end;
                            local v251 = if not v77(v195[2], v185[l_v186_0 - 1], v187) then v77(v195[2], v246, v187) and 1 else 0;
                            if v251 == 0 then
                                v218 = v250 or not v77(v195[2], v246, v187);
                            elseif v251 then
                                v218 = v249 or not v77(v195[2], v185[l_v186_0 - 1], v187);
                            end;
                            if v196 == 66 then
                                v218 = not v218;
                            end;
                        else
                            v218 = v77(v195, v185, l_v186_0, v187, v188);
                            l_v186_0 = l_v186_0 + 1;
                        end;
                    end;
                    if not v218 then
                        while true do
                            local v252 = v193[1] and v193[1][1];
                            local v253 = v193[1];
                            if not (v252 and v252 ~= "PRUNE") or v252 == "SKIP" then
                                if v252 then
                                    table.clear(v193);
                                end;
                                if v185.n < l_v186_1 then
                                    if not v189 then
                                        return nil;
                                    else
                                        return false;
                                    end;
                                else
                                    l_v186_1 = v252 == "SKIP" and v253[2] or l_v186_1 + 1;
                                    v190 = 0;
                                    l_v186_0 = l_v186_1;
                                    break;
                                end;
                            elseif v252 == "alternation" then
                                v190 = v253[2];
                                l_v186_0 = v253[3];
                                local v254, v255 = v183(v184, v190 + 1);
                                if not v254 then
                                    table.remove(v193, 1);
                                else
                                    v253[2] = v254;
                                end;
                                if v255 then
                                    l_v186_0 = l_v186_0 - v255;
                                    break;
                                else
                                    break;
                                end;
                            else
                                if v252 == "group" then
                                    if v253[7] == "quantifier" then
                                        if not ((not (v253[12] == "greedy") or v253[8] > v253[10]) and (not (v253[12] == "lazy" and v253[10] < v253[9]) or v253[13])) then
                                            v190 = v253[12] == "greedy" and v253[6] or v253[2];
                                            l_v186_0 = v253[3];
                                            if v253[12] == "greedy" then
                                                table.remove(v193, 1);
                                                break;
                                            elseif v253[8] <= v253[10] then
                                                v253[13] = true;
                                                break;
                                            end;
                                        end;
                                    elseif v253[7] == 33 then
                                        table.remove(v193, 1);
                                        v190 = v253[6];
                                        l_v186_0 = v253[3];
                                        break;
                                    end;
                                elseif v252 == "quantifier" and math.sign(v253[4] - v253[3]) == math.sign(v253[5]) then
                                    v253[3] = v253[3] + v253[5];
                                    v190 = v253[2];
                                    l_v186_0 = v253[3];
                                    break;
                                end;
                                table.remove(v193, 1);
                            end;
                        end;
                    end;
                    v190 = v190 + 1;
                end;
            else
                break;
            end;
        end;
    end;
    if not v189 then
        local v256 = false;
        local v257 = table.create(v184.group_n);
        local v258 = 0;
        local v259 = {
            l_v186_1, 
            l_v186_0
        };
        local l_group_n_0 = v184.group_n;
        v257[v258] = v259;
        v257.n = l_group_n_0;
        for _, v262 in ipairs(v193) do
            if not (v262[1] == "matchStart") or v256 then
                if not ((not (v262[1] == "group") or not v262[5]) or v257[v262[5]]) then
                    v257[v262[5]] = {
                        v262[3], 
                        v262[4]
                    };
                end;
            else
                local v263 = v257[0];
                local v264 = v262[2];
                v256 = true;
                v263[1] = v264;
            end;
        end;
        return v257;
    else
        return true;
    end;
end;
local function v269(v266, v267, v268)
    return (v265(v266.token, v17(v267, v268), 1, v266.flags, v266.verb_flags, true));
end;
local v270 = "test";
local l_v270_0 = v270 --[[ copy: 32 -> 57 ]];
local l_v269_0 = v269 --[[ copy: 31 -> 58 ]];
v6.test = function(...)
    local v273 = select("#", ...);
    if v273 < 1 then
        error("missing argument #1 (RegEx expected)", 2);
    elseif v273 < 2 then
        error("missing argument #2 (string expected)", 2);
    end;
    local v274, v275, v276, v277, v278, v279 = ...;
    if not v4[v274] or v4[v274].name ~= "RegEx" then
        if type(v274) ~= "string" and type(v274) ~= "number" then
            error(string.format("invalid argument #1 to %q (RegEx expected, got %s)", l_v270_0, (typeof(v274))), 2);
        end;
        v274 = v5.fromstring(v274);
    elseif l_v270_0 == "sub" then
        if type(v276) == "number" then
            v276 = v276 .. "";
        elseif type(v276) ~= "string" then
            error(string.format("invalid argument #3 to 'sub' (string expected, got %s)", (typeof(v276))), 2);
        end;
    elseif type(v275) == "number" then
        v275 = v275 .. "";
    elseif type(v275) ~= "string" then
        error(string.format("invalid argument #2 to %q (string expected, got %s)", l_v270_0, (typeof(v275))), 2);
    end;
    if l_v270_0 ~= "sub" and l_v270_0 ~= "split" then
        local v280 = typeof(v276);
        if v280 ~= "nil" then
            v276 = tonumber(v276);
            if v276 then
                v276 = if v276 < 0 then (#v275 + math.floor(v276 + 0.5)) + 1 else math.max(math.floor(v276 + 0.5), 1);
            else
                error(string.format("invalid argument #3 to %q (number expected, got %s)", l_v270_0, v280), 2);
            end;
        end;
    end;
    v274 = v4[v274];
    if not (l_v270_0 ~= "match") or l_v270_0 == "matchiter" then
        v277 = ...;
    elseif l_v270_0 == "sub" then
        v279 = ...;
    end;
    return l_v269_0(v274, v275, v276, v277, v278, v279);
end;
v269 = function(v281, v282, v283, v284)
    local v285 = v265(v281.token, v17(v282, v283), 1, v281.flags, v281.verb_flags, false);
    if v285 then
        return (v69(v285, v281.group_id, v284, v282));
    else
        return nil;
    end;
end;
v270 = "match";
local l_v270_1 = v270 --[[ copy: 32 -> 59 ]];
local l_v269_1 = v269 --[[ copy: 31 -> 60 ]];
v6.match = function(...)
    local v288 = select("#", ...);
    if v288 < 1 then
        error("missing argument #1 (RegEx expected)", 2);
    elseif v288 < 2 then
        error("missing argument #2 (string expected)", 2);
    end;
    local v289, v290, v291, v292, v293, v294 = ...;
    if not v4[v289] or v4[v289].name ~= "RegEx" then
        if type(v289) ~= "string" and type(v289) ~= "number" then
            error(string.format("invalid argument #1 to %q (RegEx expected, got %s)", l_v270_1, (typeof(v289))), 2);
        end;
        v289 = v5.fromstring(v289);
    elseif l_v270_1 == "sub" then
        if type(v291) == "number" then
            v291 = v291 .. "";
        elseif type(v291) ~= "string" then
            error(string.format("invalid argument #3 to 'sub' (string expected, got %s)", (typeof(v291))), 2);
        end;
    elseif type(v290) == "number" then
        v290 = v290 .. "";
    elseif type(v290) ~= "string" then
        error(string.format("invalid argument #2 to %q (string expected, got %s)", l_v270_1, (typeof(v290))), 2);
    end;
    if l_v270_1 ~= "sub" and l_v270_1 ~= "split" then
        local v295 = typeof(v291);
        if v295 ~= "nil" then
            v291 = tonumber(v291);
            if v291 then
                v291 = if v291 < 0 then (#v290 + math.floor(v291 + 0.5)) + 1 else math.max(math.floor(v291 + 0.5), 1);
            else
                error(string.format("invalid argument #3 to %q (number expected, got %s)", l_v270_1, v295), 2);
            end;
        end;
    end;
    v289 = v4[v289];
    if not (l_v270_1 ~= "match") or l_v270_1 == "matchiter" then
        v292 = ...;
    elseif l_v270_1 == "sub" then
        v294 = ...;
    end;
    return l_v269_1(v289, v290, v291, v292, v293, v294);
end;
v269 = function(v296, v297, v298, v299)
    v297 = v17(v297, v298);
    local v300 = 1;
    return function()
        local v301 = false;
        if v300 <= v297.n + 1 then
            v301 = v265(v296.token, v297, v300, v296.flags, v296.verb_flags, false);
        end;
        if v301 then
            v300 = v301[0][2] + (v301[0][2] <= v301[0][1] and 1 or 0);
            return (v69(v301, v296.group_id, v299, v297.s));
        else
            return nil;
        end;
    end;
end;
v270 = "matchall";
local l_v270_2 = v270 --[[ copy: 32 -> 61 ]];
local l_v269_2 = v269 --[[ copy: 31 -> 62 ]];
v6.matchall = function(...)
    local v304 = select("#", ...);
    if v304 < 1 then
        error("missing argument #1 (RegEx expected)", 2);
    elseif v304 < 2 then
        error("missing argument #2 (string expected)", 2);
    end;
    local v305, v306, v307, v308, v309, v310 = ...;
    if not v4[v305] or v4[v305].name ~= "RegEx" then
        if type(v305) ~= "string" and type(v305) ~= "number" then
            error(string.format("invalid argument #1 to %q (RegEx expected, got %s)", l_v270_2, (typeof(v305))), 2);
        end;
        v305 = v5.fromstring(v305);
    elseif l_v270_2 == "sub" then
        if type(v307) == "number" then
            v307 = v307 .. "";
        elseif type(v307) ~= "string" then
            error(string.format("invalid argument #3 to 'sub' (string expected, got %s)", (typeof(v307))), 2);
        end;
    elseif type(v306) == "number" then
        v306 = v306 .. "";
    elseif type(v306) ~= "string" then
        error(string.format("invalid argument #2 to %q (string expected, got %s)", l_v270_2, (typeof(v306))), 2);
    end;
    if l_v270_2 ~= "sub" and l_v270_2 ~= "split" then
        local v311 = typeof(v307);
        if v311 ~= "nil" then
            v307 = tonumber(v307);
            if v307 then
                v307 = if v307 < 0 then (#v306 + math.floor(v307 + 0.5)) + 1 else math.max(math.floor(v307 + 0.5), 1);
            else
                error(string.format("invalid argument #3 to %q (number expected, got %s)", l_v270_2, v311), 2);
            end;
        end;
    end;
    v305 = v4[v305];
    if not (l_v270_2 ~= "match") or l_v270_2 == "matchiter" then
        v308 = ...;
    elseif l_v270_2 == "sub" then
        v310 = ...;
    end;
    return l_v269_2(v305, v306, v307, v308, v309, v310);
end;
local function v312(v313, v314, v315, v316)
    for _, v318 in ipairs(v316) do
        if type(v318) == "table" then
            if v318[1] == "condition" then
                if not v315[v318[2]] then
                    if v318[4] then
                        v312(v313, v314, v315, v318[4]);
                    end;
                elseif not v318[3] then
                    table.move(v314, v315[v318[2]][1], v315[v318[2]][2] - 1, #v313 + 1, v313);
                else
                    v312(v313, v314, v315, v318[3]);
                end;
            else
                table.move(v318, 1, #v318, #v313 + 1, v313);
            end;
        elseif v315[v318] then
            table.move(v314, v315[v318][1], v315[v318][2] - 1, #v313 + 1, v313);
        end;
    end;
    v313.n = #v313;
    return v313;
end;
v270 = function(v319, v320, v321, v322, v323, v324)
    if (v323 ~= nil and type(v323) ~= "number") and type(v323) ~= "string" then
        error(string.format("invalid argument #5 to 'sub' (string expected, got %s)", (typeof(v323))), 3);
    end;
    local v325 = {
        l = false, 
        o = false, 
        u = false
    };
    for v326 in string.gmatch(v323 or "", utf8.charpattern) do
        if v325[v326] ~= false then
            error("invalid regular expression substitution flag " .. v326, 3);
        end;
        v325[v326] = true;
    end;
    local v327 = type(v320);
    if v327 == "number" then
        v320 = v320 .. "";
    elseif (v327 ~= "string" and v327 ~= "function") and (not v325.o or v327 ~= "table") then
        error(string.format("invalid argument #2 to 'sub' (string/function%s expected, got %s)", not v325.o and "" or "/table", (typeof(v320))), 3);
    end;
    if not tonumber(v322) then
        if v322 ~= nil then
            error(string.format("invalid argument #4 to 'sub' (number expected, got %s)", (typeof(v322))), 3);
        else
            v322 = math.huge;
        end;
    else
        v322 = tonumber(v322);
        if not (v322 > -1) or v322 ~= v322 then
            v322 = math.huge;
        end;
    end;
    if v322 < 1 then
        return v321, 0;
    else
        local v328 = 0;
        if v327 == "string" then
            v320 = v17(v320);
            if not v325.l then
                local v329 = 0;
                local v330 = table.create(3);
                local l_group_n_1 = v319.token.group_n;
                local v332 = {};
                while v329 < v320.n do
                    local l_v329_0 = v329;
                    while true do
                        l_v329_0 = l_v329_0 + 1;
                        if not ((v320[l_v329_0] and v320[l_v329_0] ~= 36) and v320[l_v329_0] ~= 92) or (not (v320[l_v329_0] ~= 58) or v320[l_v329_0] == 125) and v332[1] then
                            break;
                        end;
                    end;
                    v328 = v328 + ((l_v329_0 - v329) - 1);
                    if l_v329_0 - v329 > 1 then
                        table.insert(v330, table.move(v320, v329 + 1, l_v329_0 - 1, 1, table.create((l_v329_0 - v329) - 1)));
                    end;
                    if v320[l_v329_0] == 58 then
                        local v334 = v332[1];
                        if v334[2] then
                            error("malformed substitution pattern", 3);
                        end;
                        v334[2] = table.move(v330, v334[3], #v330, 1, table.create((#v330 + 1) - v334[3]));
                        for v335 = #v330, v334[3], -1 do
                            v330[v335] = nil;
                        end;
                    elseif v320[l_v329_0] == 125 then
                        local v336 = table.remove(v332, 1);
                        local v337 = table.move(v330, v336[3], #v330, 1, table.create((#v330 + 1) - v336[3]));
                        for v338 = #v330, v336[3], -1 do
                            v330[v338] = nil;
                        end;
                        local v339 = {};
                        local v340 = "condition";
                        local v341 = v336[1];
                        local v342 = false;
                        if v336[2] ~= true then
                            v342 = v336[2] or v337;
                        end;
                        local v343 = v336[2] and v337;
                        setlist { ['R018[1 to 4]'] = 'R019 to R022' };
                        table.insert(v330, v339);
                    elseif v320[l_v329_0] then
                        l_v329_0 = l_v329_0 + 1;
                        local v344 = v320[l_v329_0];
                        if v344 then
                            if v344 == 92 and v320[l_v329_0 - 1] == 36 then
                                local v345 = v330[#v330];
                                if type(v345) == "table" then
                                    table.insert(v345, 36);
                                else
                                    table.insert(v330, {
                                        36
                                    });
                                end;
                                l_v329_0 = l_v329_0 - 1;
                                v328 = v328 + 1;
                            elseif v344 == 48 then
                                table.insert(v330, 0);
                            elseif v344 > 48 and v344 <= 57 then
                                local _ = l_v329_0;
                                local v347 = v344 - 48;
                                while (v320[l_v329_0 + 1] and v320[l_v329_0 + 1] >= 48) and v320[l_v329_0 + 1] <= 57 do
                                    v347 = v347 .. v320[l_v329_0 + 1] - 48;
                                    l_v329_0 = l_v329_0 + 1;
                                end;
                                v347 = tonumber(v347);
                                if not v325.u and l_group_n_1 < v347 then
                                    error("reference to non-existent subpattern", 3);
                                end;
                                table.insert(v330, v347);
                            elseif v344 == 123 and v320[l_v329_0 - 1] == 36 then
                                l_v329_0 = l_v329_0 + 1;
                                local l_l_v329_0_1 = l_v329_0;
                                while v320[l_v329_0] and (not (((not (v320[l_v329_0] >= 48) or v320[l_v329_0] > 57) and (not (v320[l_v329_0] >= 65) or v320[l_v329_0] > 90)) and (not (v320[l_v329_0] >= 97) or v320[l_v329_0] > 122)) or v320[l_v329_0] == 95) do
                                    l_v329_0 = l_v329_0 + 1;
                                end;
                                if (not (v320[l_v329_0] ~= 125) or v320[l_v329_0] == 58 and (not (v320[l_v329_0 + 1] ~= 43) or v320[l_v329_0 + 1] == 45)) and l_v329_0 ~= l_l_v329_0_1 then
                                    local l_s_2 = v320.s;
                                    local v350 = utf8.offset(l_s_2, l_v329_0);
                                    local v351 = string.sub(l_s_2, utf8.offset(l_s_2, l_l_v329_0_1), v350 and v350 - 1);
                                    if v320[l_l_v329_0_1] >= 48 and v320[l_l_v329_0_1] <= 57 then
                                        v351 = tonumber(v351);
                                        if not v325.u and l_group_n_1 < v351 then
                                            error("reference to non-existent subpattern", 3);
                                        end;
                                    else
                                        v351 = v319.group_id[v351];
                                        if not v325.u and (not v351 or l_group_n_1 < v351) then
                                            error("reference to non-existent subpattern", 3);
                                        end;
                                    end;
                                    if v320[l_v329_0] == 58 then
                                        l_v329_0 = l_v329_0 + 1;
                                        table.insert(v332, {
                                            v351, 
                                            v320[l_v329_0] == 45, 
                                            #v330 + 1
                                        });
                                    else
                                        table.insert(v330, v351);
                                    end;
                                else
                                    error("malformed substitution pattern", 3);
                                end;
                            else
                                local v352 = nil;
                                if v320[l_v329_0 - 1] == 36 then
                                    if v344 ~= 36 then
                                        local v353 = v330[#v330];
                                        if type(v353) == "table" then
                                            table.insert(v353, 36);
                                        else
                                            table.insert(v330, {
                                                36
                                            });
                                        end;
                                    end;
                                else
                                    v352 = v30[v320[l_v329_0]];
                                    if type(v352) ~= "number" then
                                        v352 = nil;
                                    end;
                                end;
                                local v354 = v330[#v330];
                                if type(v354) == "table" then
                                    table.insert(v354, v352 or v320[l_v329_0]);
                                else
                                    table.insert(v330, {
                                        v352 or v320[l_v329_0]
                                    });
                                end;
                                v328 = v328 + 1;
                            end;
                        else
                            if v320[l_v329_0 - 1] == 92 then
                                error("replacement string must not end with a trailing backslash", 3);
                            end;
                            local v355 = v330[#v330];
                            if type(v355) == "table" then
                                table.insert(v355, v320[l_v329_0 - 1]);
                            else
                                table.insert(v330, {
                                    v320[l_v329_0 - 1]
                                });
                            end;
                        end;
                    end;
                    v329 = l_v329_0;
                end;
                if v332[1] then
                    error("malformed substitution pattern", 3);
                end;
                if (not v330[2] and type(v330[1]) == "table") and v330[1][1] ~= "condition" then
                    local v356 = v330[1];
                    v320.n = #v330[1];
                    v320 = v356;
                else
                    v320 = v330;
                    v327 = "subst_string";
                end;
            end;
        end;
        v321 = v17(v321);
        local v357 = 0;
        local v358 = 1;
        local v359 = 0;
        while v358 <= (v321.n + v357) + 1 do
            local v360 = v265(v319.token, v321, v358, v319.flags, v319.verb_flags, false);
            if v360 then
                local v361 = nil;
                if v327 == "string" then
                    v361 = v320;
                elseif v327 == "subst_string" then
                    v361 = v312(table.create(v328), v321, v360, v320);
                else
                    local v362 = nil;
                    local v363 = nil;
                    if v327 == "table" then
                        local l_s_3 = v321.s;
                        local v365 = v360[0][1];
                        local v366 = utf8.offset(l_s_3, v360[0][2]);
                        v362 = string.sub(l_s_3, utf8.offset(l_s_3, v365), v366 and v366 - 1);
                        v363 = v320[v362];
                    else
                        v362 = v69(v360, v319.group_id, v324, v321.s);
                        v363 = v320(v362);
                    end;
                    if v363 ~= v362 and (not v325.o or v363) then
                        if type(v363) == "string" then
                            v361 = v17(v363);
                        elseif type(v363) == "number" then
                            v361 = v17(v363 .. "");
                        elseif not v325.o then
                            v361 = {
                                n = 0
                            };
                        else
                            error(string.format("invalid replacement value (a %s)", (type(v363))), 3);
                        end;
                    else
                        local v367 = v360[0][2] - v360[0][1];
                        v361 = table.move(v321, v360[0][1], v360[0][2] - 1, 1, table.create(v367));
                        v361.n = v367;
                    end;
                end;
                local v368 = v360[0][2] - v360[0][1];
                local v369 = math.min(v361.n, v368);
                for v370 = 0, v369 - 1 do
                    v321[v360[0][1] + v370] = v361[v370 + 1];
                end;
                local v371 = v360[0][1] + v369;
                v358 = v360[0][2];
                if v361.n < v368 then
                    for _ = 1, v368 - v361.n do
                        table.remove(v321, v371);
                        v357 = v357 - 1;
                        v358 = v358 - 1;
                    end;
                elseif v368 < v361.n then
                    for v373 = 1, v361.n - v368 do
                        table.insert(v321, (v371 + v373) - 1, v361[v369 + v373]);
                        v357 = v357 + 1;
                        v358 = v358 + 1;
                    end;
                end;
                if v368 <= 0 then
                    v358 = v358 + 1;
                end;
                v359 = v359 + 1;
                if not (v322 >= v359 + 1) then
                    break;
                end;
            else
                break;
            end;
        end;
        return v23(v321), v359;
    end;
end;
local v374 = "sub";
local l_v374_0 = v374 --[[ copy: 33 -> 63 ]];
local l_v270_3 = v270 --[[ copy: 32 -> 64 ]];
v6.sub = function(...)
    local v377 = select("#", ...);
    if v377 < 1 then
        error("missing argument #1 (RegEx expected)", 2);
    elseif v377 < 2 then
        error("missing argument #2 (string expected)", 2);
    end;
    local v378, v379, v380, v381, v382, v383 = ...;
    if not v4[v378] or v4[v378].name ~= "RegEx" then
        if type(v378) ~= "string" and type(v378) ~= "number" then
            error(string.format("invalid argument #1 to %q (RegEx expected, got %s)", l_v374_0, (typeof(v378))), 2);
        end;
        v378 = v5.fromstring(v378);
    elseif l_v374_0 == "sub" then
        if type(v380) == "number" then
            v380 = v380 .. "";
        elseif type(v380) ~= "string" then
            error(string.format("invalid argument #3 to 'sub' (string expected, got %s)", (typeof(v380))), 2);
        end;
    elseif type(v379) == "number" then
        v379 = v379 .. "";
    elseif type(v379) ~= "string" then
        error(string.format("invalid argument #2 to %q (string expected, got %s)", l_v374_0, (typeof(v379))), 2);
    end;
    if l_v374_0 ~= "sub" and l_v374_0 ~= "split" then
        local v384 = typeof(v380);
        if v384 ~= "nil" then
            v380 = tonumber(v380);
            if v380 then
                v380 = if v380 < 0 then (#v379 + math.floor(v380 + 0.5)) + 1 else math.max(math.floor(v380 + 0.5), 1);
            else
                error(string.format("invalid argument #3 to %q (number expected, got %s)", l_v374_0, v384), 2);
            end;
        end;
    end;
    v378 = v4[v378];
    if not (l_v374_0 ~= "match") or l_v374_0 == "matchiter" then
        v381 = ...;
    elseif l_v374_0 == "sub" then
        v383 = ...;
    end;
    return l_v270_3(v378, v379, v380, v381, v382, v383);
end;
v270 = function(v385, v386, v387)
    if not tonumber(v387) then
        if v387 ~= nil then
            error(string.format("invalid argument #3 to 'split' (number expected, got %s)", (typeof(v387))), 3);
        else
            v387 = math.huge;
        end;
    else
        v387 = tonumber(v387);
        if not (v387 > -1) or v387 ~= v387 then
            v387 = math.huge;
        end;
    end;
    v386 = v17(v386);
    local v388 = 1;
    local v389 = 0;
    local v390 = {};
    local v391 = 0;
    while v388 <= v386.n + 1 do
        v389 = v389 + 1;
        local v392 = false;
        if v389 <= v387 then
            v392 = v265(v385.token, v386, v388, v385.flags, v385.verb_flags, false);
        end;
        if v392 then
            local l_s_4 = v386.s;
            local v394 = v388 - v391;
            local v395 = utf8.offset(l_s_4, v392[0][1]);
            table.insert(v390, (string.sub(l_s_4, utf8.offset(l_s_4, v394), v395 and v395 - 1)));
            v391 = v392[0][2] <= v392[0][1] and 1 or 0;
            v388 = v392[0][2] + v391;
        else
            break;
        end;
    end;
    table.insert(v390, (string.sub(v386.s, utf8.offset(v386.s, v388 - v391))));
    return v390;
end;
v374 = "split";
local l_v374_1 = v374 --[[ copy: 33 -> 65 ]];
local l_v270_4 = v270 --[[ copy: 32 -> 66 ]];
v6.split = function(...)
    local v398 = select("#", ...);
    if v398 < 1 then
        error("missing argument #1 (RegEx expected)", 2);
    elseif v398 < 2 then
        error("missing argument #2 (string expected)", 2);
    end;
    local v399, v400, v401, v402, v403, v404 = ...;
    if not v4[v399] or v4[v399].name ~= "RegEx" then
        if type(v399) ~= "string" and type(v399) ~= "number" then
            error(string.format("invalid argument #1 to %q (RegEx expected, got %s)", l_v374_1, (typeof(v399))), 2);
        end;
        v399 = v5.fromstring(v399);
    elseif l_v374_1 == "sub" then
        if type(v401) == "number" then
            v401 = v401 .. "";
        elseif type(v401) ~= "string" then
            error(string.format("invalid argument #3 to 'sub' (string expected, got %s)", (typeof(v401))), 2);
        end;
    elseif type(v400) == "number" then
        v400 = v400 .. "";
    elseif type(v400) ~= "string" then
        error(string.format("invalid argument #2 to %q (string expected, got %s)", l_v374_1, (typeof(v400))), 2);
    end;
    if l_v374_1 ~= "sub" and l_v374_1 ~= "split" then
        local v405 = typeof(v401);
        if v405 ~= "nil" then
            v401 = tonumber(v401);
            if v401 then
                v401 = if v401 < 0 then (#v400 + math.floor(v401 + 0.5)) + 1 else math.max(math.floor(v401 + 0.5), 1);
            else
                error(string.format("invalid argument #3 to %q (number expected, got %s)", l_v374_1, v405), 2);
            end;
        end;
    end;
    v399 = v4[v399];
    if not (l_v374_1 ~= "match") or l_v374_1 == "matchiter" then
        v402 = ...;
    elseif l_v374_1 == "sub" then
        v404 = ...;
    end;
    return l_v270_4(v399, v400, v401, v402, v403, v404);
end;
v269 = function(v406, v407)
    return v6[v407] or v4[v406].flags[v407];
end;
v270 = function(v408)
    return v4[v408].pattern_repr .. v4[v408].flag_repr;
end;
v374 = {
    [58] = true, 
    [33] = true, 
    [61] = true, 
    [62] = true, 
    [124] = true
};
local function v550(v409, v410)
    if not v410.unicode or v0.unicodeData then
        local v411 = 1;
        local l_n_0 = v409.n;
        local v413 = 0;
        local v414 = {};
        local v415 = {};
        local v416 = {
            newline = 1, 
            newline_seq = 1, 
            not_empty = 0
        };
        while v411 <= l_n_0 do
            local v417 = v409[v411];
            if v417 == 40 then
                local v418 = nil;
                if v409[v411 + 1] == 42 then
                    v411 = v411 + 2;
                    local l_v411_0 = v411;
                    while v409[v411] and (not ((((not (v409[v411] >= 48) or v409[v411] > 57) and (not (v409[v411] >= 65) or v409[v411] > 90)) and (not (v409[v411] >= 97) or v409[v411] > 122)) and v409[v411] ~= 95) or v409[v411] == 58) do
                        v411 = v411 + 1;
                    end;
                    if v409[v411] ~= 41 and v409[v411 - 1] ~= 58 then
                        return "quantifier doesn't follow a repeatable pattern";
                    else
                        local l_s_5 = v409.s;
                        local v421 = utf8.offset(l_s_5, v411);
                        local v422 = string.sub(l_s_5, utf8.offset(l_s_5, l_v411_0), v421 and v421 - 1);
                        if (((v422 ~= "positive_lookahead:" and v422 ~= "negative_lookhead:") and v422 ~= "positive_lookbehind:") and v422 ~= "negative_lookbehind:") and not v422:find("^[pn]l[ab]:$") then
                            if v422 == "atomic:" then
                                v418 = {
                                    40, 
                                    nil, 
                                    nil, 
                                    62, 
                                    nil
                                };
                            elseif not (((v422 ~= "ACCEPT" and v422 ~= "FAIL") and v422 ~= "F") and v422 ~= "PRUNE") or v422 == "SKIP" then
                                v418 = v422 == "F" and "FAIL" or v422;
                            else
                                if not v128[v422] then
                                    if not (v422 ~= "BSR_ANYCRLF") or v422 == "BSR_UNICODE" then
                                        v416.newline_seq = v422 == "BSR_UNICODE" and 1 or 0;
                                    elseif not (v422 ~= "NOTEMPTY") or v422 == "NOTEMPTY_ATSTART" then
                                        v416.not_empty = v422 == "NOTEMPTY" and 1 or 2;
                                    else
                                        return "unknown or malformed verb";
                                    end;
                                else
                                    v416.newline = v422;
                                end;
                                if v414[1] then
                                    return "this verb must be placed at the beginning of the regex";
                                end;
                            end;
                        else
                            v418 = {
                                40, 
                                nil, 
                                nil, 
                                not v422:find("^n") and 61 or 33, 
                                v422:find("b", 3, true) and 1
                            };
                        end;
                    end;
                elseif v409[v411 + 1] == 63 then
                    v411 = v411 + 2;
                    if v409[v411] == 35 then
                        v411 = table.find(v409, 41, v411);
                        if v411 then
                            v411 = v411 + 1;
                            continue;
                        else
                            return "unterminated parenthetical";
                        end;
                    elseif v409[v411] then
                        v418 = {
                            40, 
                            nil, 
                            nil, 
                            v409[v411], 
                            nil
                        };
                        if v409[v411] == 48 and v409[v411 + 1] == 41 then
                            local v423 = "recurmatch";
                            local v424 = 0;
                            local v425 = 0;
                            local v426 = nil;
                            v418[1] = v423;
                            v418[2] = v424;
                            v418[3] = v425;
                            v418[5] = v426;
                        elseif v409[v411] > 48 and v409[v411] <= 57 then
                            local l_v411_1 = v411;
                            v411 = v411 + 1;
                            while v409[v411] >= 48 and v409[v411] <= 48 do
                                v411 = v411 + 1;
                            end;
                            if v409[v411] ~= 41 then
                                return "invalid group structure";
                            else
                                local v428 = "recurmatch";
                                local l_s_6 = v409.s;
                                local v430 = utf8.offset(l_s_6, v411);
                                local v431 = tonumber((string.sub(l_s_6, utf8.offset(l_s_6, l_v411_1), v430 and v430 - 1)));
                                local v432 = nil;
                                v418[1] = v428;
                                v418[2] = v431;
                                v418[4] = v432;
                            end;
                        elseif not (not (v409[v411] == 60) or v409[v411 + 1] ~= 33) or v409[v411 + 1] == 61 then
                            v411 = v411 + 1;
                            local v433 = v409[v411];
                            local v434 = 1;
                            v418[4] = v433;
                            v418[5] = v434;
                        elseif v409[v411] == 124 then
                            v418[5] = v413;
                        elseif not (v409[v411] ~= 80 and v409[v411] ~= 60) or v409[v411] == 39 then
                            if v409[v411] == 80 then
                                v411 = v411 + 1;
                            end;
                            if v409[v411] == 61 then
                                local v435 = v411 + 1;
                                while v409[v411] and (not (((not (v409[v411] >= 48) or v409[v411] > 57) and (not (v409[v411] >= 65) or v409[v411] > 90)) and (not (v409[v411] >= 97) or v409[v411] > 122)) or v409[v411] == 95) do
                                    v411 = v411 + 1;
                                end;
                                if v409[v411] then
                                    if not (v409[v411] == 41) or v411 == v435 then
                                        return "invalid group structure";
                                    else
                                        local v436 = {};
                                        local v437 = "backref";
                                        local l_s_7 = v409.s;
                                        local v439 = utf8.offset(l_s_7, v411);
                                        local v440 = string.sub(l_s_7, utf8.offset(l_s_7, v435), v439 and v439 - 1);
                                        setlist { ['R011[1 to 2]'] = 'R012 to R013' };
                                        v418 = v436;
                                    end;
                                else
                                    return "unterminated parenthetical";
                                end;
                            elseif not (v409[v411] ~= 60) or v409[v411 - 1] ~= 80 and v409[v411] == 39 then
                                local v441 = v409[v411] == 39 and 39 or 62;
                                local v442 = v411 + 1;
                                v411 = v411 + 1;
                                if v409[v411] == 41 then
                                    return "missing character in subpattern";
                                elseif v409[v411] >= 48 and v409[v411] <= 57 then
                                    return "subpattern name must not begin with a digit";
                                elseif ((not (v409[v411] >= 65) or v409[v411] > 90) and (not (v409[v411] >= 97) or v409[v411] > 122)) and v409[v411] ~= 95 then
                                    return "invalid character in subpattern";
                                else
                                    v411 = v411 + 1;
                                    while v409[v411] and (not (((not (v409[v411] >= 48) or v409[v411] > 57) and (not (v409[v411] >= 65) or v409[v411] > 90)) and (not (v409[v411] >= 97) or v409[v411] > 122)) or v409[v411] == 95) do
                                        v411 = v411 + 1;
                                    end;
                                    if v409[v411] then
                                        if v409[v411] ~= v441 then
                                            return "invalid character in subpattern";
                                        else
                                            local l_s_8 = v409.s;
                                            local v444 = utf8.offset(l_s_8, v411);
                                            local v445 = string.sub(l_s_8, utf8.offset(l_s_8, v442), v444 and v444 - 1);
                                            v413 = v413 + 1;
                                            if (v415[v445] or v413) ~= v413 then
                                                return "subpattern name already exists";
                                            else
                                                for v446, v447 in pairs(v415) do
                                                    if v445 ~= v446 and v413 == v447 then
                                                        return "different names for subpatterns of the same number aren't permitted";
                                                    end;
                                                end;
                                                v415[v445] = v413;
                                                l_s_8 = nil;
                                                v418[2] = v413;
                                                v418[4] = l_s_8;
                                            end;
                                        end;
                                    else
                                        return "unterminated parenthetical";
                                    end;
                                end;
                            else
                                return "invalid group structure";
                            end;
                        elseif not v374[v409[v411]] then
                            return "invalid group structure";
                        end;
                    else
                        return "unterminated parenthetical";
                    end;
                else
                    v413 = v413 + 1;
                    v418 = {
                        40, 
                        v413, 
                        nil, 
                        nil
                    };
                end;
                if v418 then
                    table.insert(v414, v418);
                end;
            elseif v417 == 41 then
                local v448 = #v414 + 1;
                local v449 = -1;
                local v450 = 0;
                local v451 = 0;
                local v452 = 0;
                while true do
                    v448 = v448 - 1;
                    local v453 = v414[v448];
                    local v454 = type(v414[v448]) == "table";
                    if v454 and v453[1] == 40 then
                        v452 = v452 + 1;
                        if not (not v450 or not v453.count) then
                            v450 = v450 + v453.count;
                        end;
                        if not v453[3] then
                            if v453[4] == 124 then
                                v413 = v453[5] + math.max(v451, v452);
                            end;
                            v449 = if v450 ~= v449 and v449 ~= -1 then nil else v450;
                            break;
                        end;
                    elseif v453 == v37 then
                        if v450 ~= v449 and v449 ~= -1 then
                            v449 = nil;
                            v450 = nil;
                        else
                            v449 = v450;
                            v450 = 0;
                        end;
                        v451 = math.max(v451, v452);
                        v452 = 0;
                    elseif v450 then
                        v450 = if not not v454 and v453[1] == "quantifier" then if v453[2] == v453[3] then v450 + v453[2] else nil else v450 + 1;
                    end;
                    if not (v448 >= 1) then
                        break;
                    end;
                end;
                if v448 < 1 then
                    return "unmatched ) in regular expression";
                else
                    local v455 = v414[v448];
                    local v456 = #v414 + 1;
                    local v457 = {
                        41, 
                        v455[2], 
                        v448, 
                        v455[4], 
                        v455[5]; 
                        count = v449
                    };
                    if (not (not (v455[4] ~= 33) or v455[4] == 61) or not v455[5]) or v449 then
                        v455[3] = v456;
                        table.insert(v414, v457);
                    else
                        return "lookbehind assertion is not fixed width";
                    end;
                end;
            elseif v417 == 46 then
                table.insert(v414, v35);
            elseif v417 == 91 then
                local v458 = false;
                local v459 = nil;
                v411 = v411 + 1;
                local l_v411_2 = v411;
                if v409[v411] == 94 then
                    v458 = true;
                    v411 = v411 + 1;
                elseif not (v409[v411] ~= 46 and v409[v411] ~= 58) or v409[v411] == 61 then
                    v459 = v409[v411];
                end;
                local v461 = nil;
                if not (v409[v411] ~= 91) or v409[v411] == 92 then
                    v461 = {};
                else
                    v461 = {
                        v409[v411]
                    };
                    v411 = v411 + 1;
                end;
                while v409[v411] ~= 93 do
                    if v409[v411] then
                        if not (not (v409[v411] == 45) or not v461[1]) and type(v461[1]) == "number" then
                            if v409[v411 + 1] == 93 then
                                table.insert(v461, 1, 45);
                            else
                                v411 = v411 + 1;
                                local v462 = v409[v411];
                                if v462 == 91 then
                                    if not (v409[v411 + 1] ~= 46 and v409[v411 + 1] ~= 58) or v409[v411 + 1] == 61 then
                                        local v463 = v411 + 2;
                                        while true do
                                            v463 = table.find(v409, 93, v463);
                                            if not (v463 and v409[v463 - 1] == 92) then
                                                break;
                                            end;
                                        end;
                                        if v463 then
                                            if v409[v463 - 1] == v409[v411 + 1] and v463 - 1 ~= v411 + 1 then
                                                return "invalid range in character class";
                                            end;
                                        else
                                            return "unterminated character class";
                                        end;
                                    end;
                                    if v461[1] > 91 then
                                        return "invalid range in character class";
                                    end;
                                elseif v462 == 92 then
                                    v411 = v411 + 1;
                                    if v409[v411] == 120 then
                                        local v464 = nil;
                                        local v465 = nil;
                                        v411 = v411 + 1;
                                        if not ((not (v409[v411] and v409[v411] >= 48) or v409[v411] > 57) and (not (v409[v411] >= 65) or v409[v411] > 70)) or v409[v411] >= 97 and v409[v411] <= 102 then
                                            v464 = v409[v411] - ((v409[v411] >= 65 and v409[v411] <= 90) and 55 or ((v409[v411] >= 97 and v409[v411] <= 122) and 87 or 48));
                                            v411 = v411 + 1;
                                            if not ((not (v409[v411] and v409[v411] >= 48) or v409[v411] > 57) and (not (v409[v411] >= 65) or v409[v411] > 70)) or v409[v411] >= 97 and v409[v411] <= 102 then
                                                v465 = v409[v411] - ((v409[v411] >= 65 and v409[v411] <= 90) and 55 or ((v409[v411] >= 97 and v409[v411] <= 122) and 87 or 48));
                                            else
                                                v411 = v411 - 1;
                                            end;
                                        else
                                            v411 = v411 - 1;
                                        end;
                                        v462 = not not v464 and (v465 and 16 * v464 + v465 or v464) or 0;
                                    elseif v409[v411] >= 48 and v409[v411] <= 55 then
                                        local v466 = v409[v411] - 48;
                                        local v467 = nil;
                                        local v468 = nil;
                                        v411 = v411 + 1;
                                        if (v409[v411] and v409[v411] >= 48) and v409[v411] <= 55 then
                                            v467 = v409[v411] - 48;
                                            v411 = v411 + 1;
                                            if (v409[v411] and v409[v411] >= 48) and v409[v411] <= 55 then
                                                v468 = v409[v411] - 48;
                                            else
                                                v411 = v411 - 1;
                                            end;
                                        else
                                            v411 = v411 - 1;
                                        end;
                                        v462 = not not v467 and (v468 and (64 * v466 + 8 * v467) + v468 or 8 * v466 + v467) or v466;
                                    else
                                        v462 = v30[v409[v411]] or v409[v411];
                                        if type(v462) ~= "number" then
                                            return "invalid range in character class";
                                        end;
                                    end;
                                elseif v462 < v461[1] then
                                    return "invalid range in character class";
                                end;
                                v461[1] = {
                                    "range", 
                                    v461[1], 
                                    v462
                                };
                            end;
                        elseif v409[v411] == 91 then
                            if not (v409[v411 + 1] ~= 46 and v409[v411 + 1] ~= 58) or v409[v411 + 1] == 61 then
                                local v469 = v411 + 2;
                                while true do
                                    v469 = table.find(v409, 93, v469);
                                    if not (v469 and v409[v469 - 1] == 92) then
                                        break;
                                    end;
                                end;
                                if v469 then
                                    if not (v409[v469 - 1] == v409[v411 + 1]) or v469 - 1 == v411 + 1 then
                                        table.insert(v461, 1, 91);
                                    elseif not (v409[v469 - 1] ~= 46) or v409[v469 - 1] == 61 then
                                        return "POSIX collating elements aren't supported";
                                    elseif v409[v469 - 1] == 58 then
                                        local v470 = v409[v411 + 3] == 94;
                                        local l_s_9 = v409.s;
                                        local v472 = v411 + (not v470 and 2 or 3);
                                        local v473 = utf8.offset(l_s_9, v469 - 1);
                                        local v474 = string.sub(l_s_9, utf8.offset(l_s_9, v472), v473 and v473 - 1);
                                        if v29[v474] then
                                            table.insert(v461, 1, {
                                                "class", 
                                                v474, 
                                                v470
                                            });
                                            v411 = v469;
                                        else
                                            return "unknown POSIX class name";
                                        end;
                                    end;
                                else
                                    return "unterminated character class";
                                end;
                            else
                                table.insert(v461, 1, 91);
                            end;
                        elseif v409[v411] == 92 then
                            v411 = v411 + 1;
                            if v409[v411] == 120 then
                                local v475 = nil;
                                local v476 = nil;
                                v411 = v411 + 1;
                                if v409[v411] == 123 then
                                    v411 = v411 + 1;
                                    local l_v411_3 = v411;
                                    while v409[v411] and (not ((not (v409[v411] >= 48) or v409[v411] > 57) and (not (v409[v411] >= 65) or v409[v411] > 70)) or v409[v411] >= 97 and v409[v411] <= 102) do
                                        v411 = v411 + 1;
                                    end;
                                    if not (v409[v411] == 125) or v411 == l_v411_3 then
                                        return "malformed hexadecimal character";
                                    elseif v411 - l_v411_3 > 4 then
                                        return "character offset too large";
                                    else
                                        local l_v461_0 = v461;
                                        local v479 = 1;
                                        local l_s_10 = v409.s;
                                        local v481 = utf8.offset(l_s_10, v411);
                                        table.insert(l_v461_0, v479, (tonumber(string.sub(l_s_10, utf8.offset(l_s_10, l_v411_3), v481 and v481 - 1), 16)));
                                    end;
                                else
                                    if not ((not (v409[v411] and v409[v411] >= 48) or v409[v411] > 57) and (not (v409[v411] >= 65) or v409[v411] > 70)) or v409[v411] >= 97 and v409[v411] <= 102 then
                                        v475 = v409[v411] - ((v409[v411] >= 65 and v409[v411] <= 90) and 55 or ((v409[v411] >= 97 and v409[v411] <= 122) and 87 or 48));
                                        v411 = v411 + 1;
                                        if not ((not (v409[v411] and v409[v411] >= 48) or v409[v411] > 57) and (not (v409[v411] >= 65) or v409[v411] > 70)) or v409[v411] >= 97 and v409[v411] <= 102 then
                                            v476 = v409[v411] - ((v409[v411] >= 65 and v409[v411] <= 90) and 55 or ((v409[v411] >= 97 and v409[v411] <= 122) and 87 or 48));
                                        else
                                            v411 = v411 - 1;
                                        end;
                                    else
                                        v411 = v411 - 1;
                                    end;
                                    table.insert(v461, 1, not not v475 and (v476 and 16 * v475 + v476 or v475) or 0);
                                end;
                            elseif v409[v411] >= 48 and v409[v411] <= 55 then
                                local v482 = v409[v411] - 48;
                                local v483 = nil;
                                local v484 = nil;
                                v411 = v411 + 1;
                                if (v409[v411] and v409[v411] >= 48) and v409[v411] <= 55 then
                                    v483 = v409[v411] - 48;
                                    v411 = v411 + 1;
                                    if (v409[v411] and v409[v411] >= 48) and v409[v411] <= 55 then
                                        v484 = v409[v411] - 48;
                                    else
                                        v411 = v411 - 1;
                                    end;
                                else
                                    v411 = v411 - 1;
                                end;
                                table.insert(v461, 1, not not v483 and (v484 and (64 * v482 + 8 * v483) + v484 or 8 * v482 + v483) or v482);
                            elseif not (v409[v411] == 69) then
                                if v409[v411] == 81 then
                                    local v485 = v411 + 1;
                                    while true do
                                        v411 = table.find(v409, 92, v411 + 1);
                                        if not (v411 and v409[v411 + 1] ~= 69) then
                                            break;
                                        end;
                                    end;
                                    table.move(v409, v485, not not v411 and v411 - 1 or #v409, #v414 + 1, v414);
                                    if not v411 then
                                        break;
                                    else
                                        v411 = v411 + 1;
                                    end;
                                elseif v409[v411] == 78 then
                                    if not ((v409[v411 + 1] == 123 and v409[v411 + 2] == 85) and v409[v411 + 3] == 43) or not v410.unicode then
                                        return "invalid escape sequence";
                                    else
                                        v411 = v411 + 4;
                                        local l_v411_4 = v411;
                                        while v409[v411] and (not ((not (v409[v411] >= 48) or v409[v411] > 57) and (not (v409[v411] >= 65) or v409[v411] > 70)) or v409[v411] >= 97 and v409[v411] <= 102) do
                                            v411 = v411 + 1;
                                        end;
                                        if not (v409[v411] == 125) or v411 == l_v411_4 then
                                            return "malformed Unicode code point";
                                        else
                                            local l_s_11 = v409.s;
                                            local v488 = utf8.offset(l_s_11, v411);
                                            table.insert(v461, 1, (tonumber((string.sub(l_s_11, utf8.offset(l_s_11, l_v411_4), v488 and v488 - 1)))));
                                        end;
                                    end;
                                elseif not (v409[v411] ~= 80) or v409[v411] == 112 then
                                    if v0.unicodeData then
                                        v411 = v411 + 1;
                                        if v409[v411] ~= 123 then
                                            local v489 = utf8.char(v409[v411] or 0);
                                            if v32[v489] then
                                                table.insert(v461, 1, {
                                                    "category", 
                                                    false, 
                                                    v489
                                                });
                                            else
                                                return "unknown or malformed script name";
                                            end;
                                        else
                                            local v490 = v409[v411] == 80;
                                            v411 = v411 + 1;
                                            if v409[v411] == 94 then
                                                v411 = v411 + 1;
                                                v490 = not v490;
                                            end;
                                            local l_v411_5 = v411;
                                            while v409[v411] and (not (((not (v409[v411] >= 48) or v409[v411] > 57) and (not (v409[v411] >= 65) or v409[v411] > 90)) and (not (v409[v411] >= 97) or v409[v411] > 122)) or v409[v411] == 95) do
                                                v411 = v411 + 1;
                                            end;
                                            if v409[v411] ~= 125 then
                                                return "unknown or malformed script name";
                                            else
                                                local l_s_12 = v409.s;
                                                local v493 = utf8.offset(l_s_12, v411);
                                                local v494 = string.sub(l_s_12, utf8.offset(l_s_12, l_v411_5), v493 and v493 - 1);
                                                l_s_12 = v2[v494];
                                                if not l_s_12 then
                                                    if v32[v494] then
                                                        table.insert(v461, 1, {
                                                            "category", 
                                                            v490, 
                                                            v494
                                                        });
                                                    else
                                                        return "unknown or malformed script name";
                                                    end;
                                                else
                                                    table.insert(v461, 1, {
                                                        "charset", 
                                                        v490, 
                                                        l_s_12
                                                    });
                                                end;
                                            end;
                                        end;
                                    else
                                        return "options.unicodeData cannot be turned off when using \\p";
                                    end;
                                elseif v409[v411] == 111 then
                                    v411 = v411 + 1;
                                    if v409[v411] ~= 123 then
                                        return "malformed octal code";
                                    else
                                        v411 = v411 + 1;
                                        local l_v411_6 = v411;
                                        while (v409[v411] and v409[v411] >= 48) and v409[v411] <= 55 do
                                            v411 = v411 + 1;
                                        end;
                                        if not (v409[v411] == 125) or v411 == l_v411_6 then
                                            return "malformed octal code";
                                        else
                                            local l_s_13 = v409.s;
                                            local v497 = utf8.offset(l_s_13, v411);
                                            local v498 = tonumber(string.sub(l_s_13, utf8.offset(l_s_13, l_v411_6), v497 and v497 - 1), 8);
                                            if v498 > 65535 then
                                                return "character offset too large";
                                            else
                                                table.insert(v461, 1, v498);
                                            end;
                                        end;
                                    end;
                                else
                                    local v499 = v30[v409[v411]];
                                    table.insert(v461, 1, (type(v499) == "string" and {
                                        "class", 
                                        v499, 
                                        false
                                    } or v499) or v409[v411]);
                                end;
                            end;
                        elseif (v410.ignoreCase and v409[v411] >= 97) and v409[v411] <= 122 then
                            table.insert(v461, 1, v409[v411] - 32);
                        else
                            table.insert(v461, 1, v409[v411]);
                        end;
                        v411 = v411 + 1;
                    else
                        return "unterminated character class";
                    end;
                end;
                if v409[v411 - 1] == v459 and v411 - 1 ~= l_v411_2 then
                    if v459 == 58 then
                        return "POSIX named classes are only support within a character set";
                    else
                        return "POSIX collating elements aren't supported";
                    end;
                elseif v461[2] or v458 then
                    table.insert(v414, {
                        "charset", 
                        v458, 
                        v461
                    });
                else
                    table.insert(v414, v461[1]);
                end;
            elseif v417 == 92 then
                v411 = v411 + 1;
                local v500 = v409[v411];
                if v500 then
                    if v500 >= 48 and v500 <= 57 then
                        local l_v411_7 = v411;
                        while (v409[v411 + 1] and v409[v411 + 1] >= 48) and v409[v411 + 1] <= 57 do
                            v411 = v411 + 1;
                        end;
                        local l_s_14 = v409.s;
                        local v503 = utf8.offset(l_s_14, v411 + 1);
                        local v504 = tonumber((string.sub(l_s_14, utf8.offset(l_s_14, l_v411_7), v503 and v503 - 1)));
                        if v413 < v504 and v411 ~= l_v411_7 then
                            v411 = l_v411_7;
                            local v505 = nil;
                            l_s_14 = nil;
                            v503 = nil;
                            if v409[v411] <= 55 then
                                v505 = v409[v411] - 48;
                                v411 = v411 + 1;
                                if (v409[v411] and v409[v411] >= 48) and v409[v411] <= 55 then
                                    l_s_14 = v409[v411] - 48;
                                    v411 = v411 + 1;
                                    if (v409[v411] and v409[v411] >= 48) and v409[v411] <= 55 then
                                        v503 = v409[v411] - 48;
                                    else
                                        v411 = v411 - 1;
                                    end;
                                else
                                    v411 = v411 - 1;
                                end;
                            end;
                            table.insert(v414, not not v505 and (l_s_14 and (v503 and (64 * v505 + 8 * l_s_14) + v503 or 8 * v505 + l_s_14) or v505) or v409[l_v411_7]);
                        else
                            table.insert(v414, {
                                "backref", 
                                v504
                            });
                        end;
                    elseif not (v500 == 69) then
                        if v500 == 81 then
                            local v506 = v411 + 1;
                            while true do
                                v411 = table.find(v409, 92, v411 + 1);
                                if not (v411 and v409[v411 + 1] ~= 69) then
                                    break;
                                end;
                            end;
                            table.move(v409, v506, not not v411 and v411 - 1 or #v409, #v414 + 1, v414);
                            if not v411 then
                                break;
                            else
                                v411 = v411 + 1;
                            end;
                        elseif v500 == 78 then
                            if not ((v409[v411 + 1] == 123 and v409[v411 + 2] == 85) and v409[v411 + 3] == 43) or not v410.unicode then
                                table.insert(v414, v30[78]);
                            else
                                v411 = v411 + 4;
                                local l_v411_8 = v411;
                                while v409[v411] and (not ((not (v409[v411] >= 48) or v409[v411] > 57) and (not (v409[v411] >= 65) or v409[v411] > 70)) or v409[v411] >= 97 and v409[v411] <= 102) do
                                    v411 = v411 + 1;
                                end;
                                if not (v409[v411] == 125) or v411 == l_v411_8 then
                                    return "malformed Unicode code point";
                                else
                                    local l_s_15 = v409.s;
                                    local v509 = utf8.offset(l_s_15, v411);
                                    table.insert(v414, (tonumber((string.sub(l_s_15, utf8.offset(l_s_15, l_v411_8), v509 and v509 - 1)))));
                                end;
                            end;
                        elseif not (v500 ~= 80) or v500 == 112 then
                            if v0.unicodeData then
                                v411 = v411 + 1;
                                if v409[v411] ~= 123 then
                                    local v510 = utf8.char(v409[v411] or 0);
                                    if v32[v510] then
                                        table.insert(v414, {
                                            "category", 
                                            false, 
                                            v510
                                        });
                                    else
                                        return "unknown or malformed script name";
                                    end;
                                else
                                    local v511 = v500 == 80;
                                    v411 = v411 + 1;
                                    if v409[v411] == 94 then
                                        v411 = v411 + 1;
                                        v511 = not v511;
                                    end;
                                    local l_v411_9 = v411;
                                    while v409[v411] and (not (((not (v409[v411] >= 48) or v409[v411] > 57) and (not (v409[v411] >= 65) or v409[v411] > 90)) and (not (v409[v411] >= 97) or v409[v411] > 122)) or v409[v411] == 95) do
                                        v411 = v411 + 1;
                                    end;
                                    if v409[v411] ~= 125 then
                                        return "unknown or malformed script name";
                                    else
                                        local l_s_16 = v409.s;
                                        local v514 = utf8.offset(l_s_16, v411);
                                        local v515 = string.sub(l_s_16, utf8.offset(l_s_16, l_v411_9), v514 and v514 - 1);
                                        l_s_16 = v2[v515];
                                        if not l_s_16 then
                                            if v32[v515] then
                                                table.insert(v414, {
                                                    "category", 
                                                    v511, 
                                                    v515
                                                });
                                            else
                                                return "unknown or malformed script name";
                                            end;
                                        else
                                            table.insert(v414, {
                                                "charset", 
                                                v511, 
                                                l_s_16
                                            });
                                        end;
                                    end;
                                end;
                            else
                                return "options.unicodeData cannot be turned off when using \\p";
                            end;
                        elseif v500 == 103 and (not (v409[v411 + 1] ~= 123) or v409[v411 + 1] >= 48 and v409[v411 + 1] <= 57) then
                            local v516 = false;
                            v411 = v411 + 1;
                            if v409[v411] == 123 then
                                v411 = v411 + 1;
                                v516 = true;
                            elseif not (v409[v411] >= 48) or v409[v411] > 57 then
                                return "malformed reference code";
                            end;
                            local l_v411_10 = v411;
                            while v409[v411] and (not ((not (v409[v411] >= 48) or v409[v411] > 57) and (not (v409[v411] >= 65) or v409[v411] > 70)) or v409[v411] >= 97 and v409[v411] <= 102) do
                                v411 = v411 + 1;
                            end;
                            if v516 and v409[v411] ~= 125 then
                                return "malformed reference code";
                            else
                                local l_s_17 = v409.s;
                                local v519 = utf8.offset(l_s_17, v411 + (not v516 and 1 or 0));
                                table.insert(v414, {
                                    "backref", 
                                    (tonumber((string.sub(l_s_17, utf8.offset(l_s_17, l_v411_10), v519 and v519 - 1))))
                                });
                                if not v516 then
                                    v411 = v411 - 1;
                                end;
                            end;
                        elseif v500 == 111 then
                            v411 = v411 + 1;
                            if v409[v411 + 1] ~= 123 then
                                return "malformed octal code";
                            else
                                v411 = v411 + 1;
                                local l_v411_11 = v411;
                                while (v409[v411] and v409[v411] >= 48) and v409[v411] <= 55 do
                                    v411 = v411 + 1;
                                end;
                                if not (v409[v411] == 125) or v411 == l_v411_11 then
                                    return "malformed octal code";
                                else
                                    local l_s_18 = v409.s;
                                    local v522 = utf8.offset(l_s_18, v411);
                                    local v523 = tonumber(string.sub(l_s_18, utf8.offset(l_s_18, l_v411_11), v522 and v522 - 1), 8);
                                    if v523 > 65535 then
                                        return "character offset too large";
                                    else
                                        table.insert(v414, v523);
                                    end;
                                end;
                            end;
                        elseif v500 == 120 then
                            local v524 = nil;
                            local v525 = nil;
                            v411 = v411 + 1;
                            if v409[v411] == 123 then
                                v411 = v411 + 1;
                                local l_v411_12 = v411;
                                while v409[v411] and (not ((not (v409[v411] >= 48) or v409[v411] > 57) and (not (v409[v411] >= 65) or v409[v411] > 70)) or v409[v411] >= 97 and v409[v411] <= 102) do
                                    v411 = v411 + 1;
                                end;
                                if not (v409[v411] == 125) or v411 == l_v411_12 then
                                    return "malformed hexadecimal code";
                                elseif v411 - l_v411_12 > 4 then
                                    return "character offset too large";
                                else
                                    local l_s_19 = v409.s;
                                    local v528 = utf8.offset(l_s_19, v411);
                                    table.insert(v414, (tonumber(string.sub(l_s_19, utf8.offset(l_s_19, l_v411_12), v528 and v528 - 1), 16)));
                                end;
                            else
                                if v409[v411] and (not ((not (v409[v411] >= 48) or v409[v411] > 57) and (not (v409[v411] >= 65) or v409[v411] > 70)) or v409[v411] >= 97 and v409[v411] <= 102) then
                                    v524 = v409[v411] - ((v409[v411] >= 65 and v409[v411] <= 90) and 55 or ((v409[v411] >= 97 and v409[v411] <= 122) and 87 or 48));
                                    v411 = v411 + 1;
                                    if v409[v411] and (not ((not (v409[v411] >= 48) or v409[v411] > 57) and (not (v409[v411] >= 65) or v409[v411] > 70)) or v409[v411] >= 97 and v409[v411] <= 102) then
                                        v525 = v409[v411] - ((v409[v411] >= 65 and v409[v411] <= 90) and 55 or ((v409[v411] >= 97 and v409[v411] <= 122) and 87 or 48));
                                    else
                                        v411 = v411 - 1;
                                    end;
                                else
                                    v411 = v411 - 1;
                                end;
                                table.insert(v414, not not v524 and (v525 and 16 * v524 + v525 or v524) or 0);
                            end;
                        else
                            table.insert(v414, (v31[v500] or v30[v500]) or v500);
                        end;
                    end;
                else
                    return "pattern may not end with a trailing backslash";
                end;
            elseif not ((v417 ~= 42 and v417 ~= 43) and v417 ~= 63) or v417 == 123 then
                local v529 = nil;
                local v530 = nil;
                if v417 == 123 then
                    local v531 = v411 + 1;
                    local v532 = nil;
                    while v409[v411 + 1] and (not (not (v409[v411 + 1] >= 48) or v409[v411 + 1] > 57) or not (not (v409[v411 + 1] == 44) or v532) and v411 + 1 ~= v531) do
                        v411 = v411 + 1;
                        if v409[v411] == 44 then
                            v532 = v411;
                        end;
                    end;
                    if v409[v411 + 1] == 125 then
                        v411 = v411 + 1;
                        if v532 then
                            local l_s_20 = v409.s;
                            local v534 = utf8.offset(l_s_20, v532);
                            v529 = tonumber((string.sub(l_s_20, utf8.offset(l_s_20, v531), v534 and v534 - 1)));
                            local v535;
                            if v532 + 1 == v411 then
                                v535 = math.huge;
                            else
                                l_s_20 = v409.s;
                                v534 = v532 + 1;
                                local v536 = utf8.offset(l_s_20, v411);
                                v535 = tonumber((string.sub(l_s_20, utf8.offset(l_s_20, v534), v536 and v536 - 1)));
                            end;
                            v530 = v535;
                            if v530 < v529 then
                                return "numbers out of order in {} quantifier";
                            end;
                        else
                            local l_s_21 = v409.s;
                            local v538 = utf8.offset(l_s_21, v411);
                            v529 = tonumber((string.sub(l_s_21, utf8.offset(l_s_21, v531), v538 and v538 - 1)));
                            v530 = v529;
                        end;
                    else
                        table.move(v409, v531 - 1, v411, #v414 + 1, v414);
                    end;
                else
                    v529 = v417 == 43 and 1 or 0;
                    v530 = v417 == 63 and 1 or math.huge;
                end;
                if v529 then
                    local v539 = not v410.ungreedy and "greedy" or "lazy";
                    if not (v409[v411 + 1] ~= 43) or v409[v411 + 1] == 63 then
                        v411 = v411 + 1;
                        v539 = v409[v411] == 43 and "possessive" or (v410.ungreedy and "greedy" or "lazy");
                    end;
                    local v540 = #v414;
                    local v541 = v414[v540];
                    if (not v541 or type(v541) == "table" and (not (v541[1] ~= "quantifier" and v541[1] ~= 40) or v31[v541[1]])) or (not (v541 ~= v37) or type(v541) == "string") then
                        return "quantifier doesn't follow a repeatable pattern";
                    elseif v530 == 0 then
                        table.remove(v414);
                    elseif not (v529 == 1) or v530 ~= 1 then
                        if type(v541) == "table" and v541[1] == 41 then
                            v540 = v541[3];
                        end;
                        v414[v540] = {
                            "quantifier", 
                            v529, 
                            v530, 
                            v539, 
                            v414[v540]
                        };
                    end;
                end;
            elseif v417 == 124 then
                table.insert(v414, v37);
                local v542 = #v414;
                while true do
                    v542 = v542 - 1;
                    local v543 = v414[v542];
                    local v544 = type(v414[v542]) == "table";
                    if v544 and v543[1] == 41 then
                        v542 = v414[v542][3];
                    elseif v544 and v543[1] == 40 then
                        if v543[4] == 124 then
                            v413 = v543[5];
                            break;
                        else
                            break;
                        end;
                    end;
                    if not v543 then
                        break;
                    end;
                end;
            elseif not (v417 ~= 36) or v417 == 94 then
                table.insert(v414, v417 == 94 and v36 or v34);
            elseif (v410.ignoreCase and v417 >= 97) and v417 <= 122 then
                table.insert(v414, v417 - 32);
            elseif v410.extended and (not ((not (v417 >= 9) or v417 > 13) and v417 ~= 32) or v417 == 35) then
                if v417 == 35 then
                    while true do
                        v411 = v411 + 1;
                        if not ((v409[v411] and v409[v411] ~= 10) and v409[v411] ~= 13) then
                            break;
                        end;
                    end;
                end;
            else
                table.insert(v414, v417);
            end;
            v411 = v411 + 1;
        end;
        local v545 = 0;
        for _, v547 in ipairs(v414) do
            if type(v547) == "table" and (not (v547[1] ~= 40) or (v547[1] == "quantifier" and type(v547[5]) == "table") and v547[5][1] == 40) then
                if v547[1] == "quantifier" then
                    v547 = v547[5];
                end;
                if v547[3] then
                    if v547[2] then
                        v545 = math.max(v545, v547[2]);
                    end;
                else
                    return "unterminated parenthetical";
                end;
            elseif type(v547) == "table" and (not (v547[1] ~= "backref") or v547[1] == "recurmatch") then
                if not v415[v547[2]] and (not (type(v547[2]) == "number") or v413 < v547[2]) then
                    return "reference to a non-existent or invalid subpattern";
                elseif v547[1] == "recurmatch" and v547[2] ~= 0 then
                    for v548, v549 in ipairs(v414) do
                        if (type(v549) == "table" and v549[1] == 40) and v549[2] == v547[2] then
                            v547[3] = v548;
                            break;
                        end;
                    end;
                elseif type(v547[2]) == "string" then
                    v547[2] = v415[v547[2]];
                end;
            end;
        end;
        v414.group_n = v545;
        return v414, v415, v416;
    else
        return "options.unicodeData cannot be turned off while having unicode flag";
    end;
end;
if not tonumber(v0.cacheSize) then
    error(string.format("expected number for options.cacheSize, got %s", (typeof(v0.cacheSize))), 2);
end;
local v551 = false;
if math.floor(v0.cacheSize or 0) ~= 0 then
    v551 = tonumber(v0.cacheSize);
end;
local v552 = nil;
local v553 = nil;
if v551 then
    if not (v551 >= 0) or v551 ~= v551 then
        error("cache size cannot be a negative number or a NaN", 2);
    elseif v551 == math.huge then
        v552 = {
            nil
        };
        v553 = {
            nil
        };
    elseif v551 >= 4294967296 then
        error("cache size too large", 2);
    else
        v552 = table.create(v0.cacheSize);
        v553 = table.create(v0.cacheSize);
    end;
end;
if v551 then
    v5.pruge = function()
        table.clear(v553);
        table.clear(v552);
    end;
end;
local function v571(v554, v555, v556, v557)
    local v558 = nil;
    local v559 = nil;
    local v560 = nil;
    local v561 = v551 and string.format("%s|%s", v554.s, v556);
    local v562 = v551 and v552[table.find(v553, v561)];
    if not v562 then
        local v563, v564, v565 = v550(v554, v555);
        v558 = v563;
        v559 = v564;
        v560 = v565;
        if type(v558) == "string" then
            error(v558, 2);
        end;
        if not (not v551 or not v558[1]) then
            table.insert(v553, 1, v561);
            table.insert(v552, 1, {
                v558, 
                v559, 
                v560
            });
            if v551 ~= math.huge then
                table.remove(v553, v551 + 1);
                table.remove(v552, v551 + 1);
            end;
        end;
    else
        local v566, v567, v568 = table.unpack(v562, 1, 3);
        v558 = v566;
        v559 = v567;
        v560 = v568;
    end;
    local v569 = newproxy(true);
    v4[v569] = {
        name = "RegEx", 
        flags = v555, 
        flag_repr = v556, 
        pattern_repr = v557, 
        token = v558, 
        group_id = v559, 
        verb_flags = v560
    };
    local v570 = getmetatable(v569);
    v570.__index = setmetatable(v555, v6);
    v570.__tostring = v270;
    v570.__metatable = v8;
    return v569;
end;
local function v573(v572)
    return (#v572 % 2 == 0 and "\\" or "") .. v572 .. ".";
end;
local function v576(v574, v575)
    return v574:lower() < v575:lower();
end;
v5.new = function(...)
    if select("#", ...) == 0 then
        error("missing argument #1 (string expected)", 2);
    end;
    local v577, v578 = ...;
    if type(v577) == "number" then
        v577 = v577 .. "";
    elseif type(v577) ~= "string" then
        error(string.format("invalid argument #1 (string expected, got %s)", (typeof(v577))), 2);
    end;
    if (type(v578) ~= "string" and type(v578) ~= "number") and v578 ~= nil then
        error(string.format("invalid argument #2 (string expected, got %s)", (typeof(v578))), 2);
    end;
    local v579 = {
        anchored = false, 
        caseless = false, 
        multiline = false, 
        dotall = false, 
        unicode = false, 
        ungreedy = false, 
        extended = false
    };
    local v580 = {};
    for v581 in string.gmatch(v578 or "", utf8.charpattern) do
        if v579[v28[v581]] ~= false then
            error("invalid regular expression flag " .. v581, 3);
        end;
        v579[v28[v581]] = true;
        table.insert(v580, v581);
    end;
    table.sort(v580, v576);
    return (v571(v17(v577), v579, table.concat(v580), string.format("/%s/", v577:gsub("(\\*)/", v573))));
end;
v5.fromstring = function(...)
    if select("#", ...) == 0 then
        error("missing argument #1 (string expected)", 2);
    end;
    local v582 = ...;
    if type(v582) == "number" then
        v582 = v582 .. "";
    elseif type(v582) ~= "string" then
        error(string.format("invalid argument #1 (string expected, got %s)", typeof(v582), 2));
    end;
    local v583 = v17(v582);
    local v584 = v583[1];
    if v584 then
        if not ((v584 ~= 92 and (not (v584 >= 48) or v584 > 57)) and (not (v584 >= 65) or v584 > 90)) or v584 >= 97 and v584 <= 122 then
            error("delimiter must not be alphanumeric or a backslash", 2);
        end;
    else
        error("empty regex", 2);
    end;
    local v585 = 1;
    while true do
        v585 = table.find(v583, v584, v585 + 1);
        if not v585 then
            error(string.format("no ending delimiter ('%s') found", utf8.char(v584)), 2);
        end;
        local v586 = 1;
        while v583[v585 - v586] == 92 do
            v586 = v586 + 1;
        end;
        if not (v586 % 2 ~= 1) then
            break;
        end;
    end;
    local v587 = {
        anchored = false, 
        caseless = false, 
        multiline = false, 
        dotall = false, 
        unicode = false, 
        ungreedy = false, 
        extended = false
    };
    local v588 = {};
    while v585 < v583.n do
        local v589 = utf8.char(table.remove(v583));
        v583.n = v583.n - 1;
        if v587[v28[v589]] ~= false then
            error("invalid regular expression flag " .. v589, 3);
        end;
        v587[v28[v589]] = true;
        table.insert(v588, v589);
    end;
    table.sort(v588, v576);
    v588 = table.concat(v588);
    table.remove(v583, 1);
    table.remove(v583);
    v583.n = v583.n - 2;
    v583.s = string.sub(v583.s, 2, 1 + v583.n);
    return (v571(v583, v587, v588, (string.sub(v582, 1, 2 + v583.n))));
end;
local v590 = {
    ["\000"] = "\\x00", 
    ["\n"] = "\\n", 
    ["\t"] = "\\t", 
    ["\r"] = "\\r", 
    ["\f"] = "\\f"
};
v5.escape = function(...)
    if select("#", ...) == 0 then
        error("missing argument #1 (string expected)", 2);
    end;
    local v591, v592, v593 = ...;
    if type(v591) == "number" then
        v591 = v591 .. "";
    elseif type(v591) ~= "string" then
        error(string.format("invalid argument #1 to 'escape' (string expected, got %s)", (typeof(v591))), 2);
    end;
    if v593 == nil then
        v593 = "";
    elseif type(v593) == "number" then
        v593 = v593 .. "";
    elseif type(v593) ~= "string" then
        error(string.format("invalid argument #3 to 'escape' (string expected, got %s)", (typeof(v593))), 2);
    end;
    if not (utf8.len(v593) <= 1 and not v593:match("^[%a\\]$")) then
        error("delimiter have not be alphanumeric", 2);
    end;
    return (string.gsub(v591, "[\000\f\n\r\t]", v590):gsub(string.format("[\\%s#()%%%%*+.?[%%]^{|%s]", not v592 and "" or "%s", (not v593:find("^[%%%]]$") and "" or "%") .. v593), "\\%1"));
end;
v5.type = function(...)
    if select("#", ...) == 0 then
        error("missing argument #1", 2);
    end;
    return v4[...] and v4[...].name;
end;
for v594, v595 in pairs(v6) do
    v5[v594] = v595;
end;
v6 = {
    __index = v6
};
v8 = v5.fromstring("/The\\s*metatable\\s*is\\s*(?:locked|inaccessible)(?#Nice try :])/i");
getmetatable(v8).__metatable = v8;
local function v596()
    error("Attempt to modify a readonly table", 2);
end;
v7 = {
    __index = v7, 
    __metatable = v8, 
    __newindex = v596
};
v5.Match = setmetatable({}, v7);
return (setmetatable({}, {
    __index = v5, 
    __metatable = v8, 
    __newindex = v596
}));
