local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.LuauPolyfill);
local l_Array_0 = v2.Array;
local l_Boolean_0 = v2.Boolean;
local l_Error_0 = v2.Error;
local l_Object_0 = v2.Object;
local l_String_0 = v2.String;
local l_stringReplace_0 = require(l_Parent_0.stringUtils).stringReplace;
local v9 = require(l_Parent_1.RegExp);
local v10 = require(l_Parent_0.constants);
local v11 = require(l_Parent_0.utils);
local l_MAX_LENGTH_0 = v10.MAX_LENGTH;
local l_POSIX_REGEX_SOURCE_0 = v10.POSIX_REGEX_SOURCE;
local l_REGEX_NON_SPECIAL_CHARS_0 = v10.REGEX_NON_SPECIAL_CHARS;
local l_REGEX_SPECIAL_CHARS_BACKREF_0 = v10.REGEX_SPECIAL_CHARS_BACKREF;
local l_REPLACEMENTS_0 = v10.REPLACEMENTS;
local function v21(v17, v18)
    if typeof(v18.expandRange) == "function" then
        return v18.expandRange(table.unpack(v17), v18);
    else
        l_Array_0.sort(v17);
        local v19 = ("[%s]"):format(l_Array_0.join(v17, "-"));
        if pcall(function()
            v9(v19);
        end) then
            return v19;
        else
            return l_Array_0.join(l_Array_0.map(v17, function(v20)
                return v11.escapeRegex(v20);
            end), "..");
        end;
    end;
end;
local function _(v22, v23)
    return ("Missing %s: \"%s\" - use \"\\%s\" to match literal characters"):format(v22, v23, v23);
end;
local v25 = nil;
local v29 = setmetatable({}, {
    __call = function(_, v27, v28)
        return v25(v27, v28);
    end
});
v25 = function(v30, v31)
    if typeof(v30) ~= "string" then
        error(l_Error_0.new("TypeError: Expected a string"));
    end;
    v30 = l_REPLACEMENTS_0[v30] or v30;
    local v32 = l_Object_0.assign({}, v31);
    local v33 = if typeof(v32.maxLength) == "number" then math.min(l_MAX_LENGTH_0, v32.maxLength) else l_MAX_LENGTH_0;
    local v34 = #v30;
    if v33 < v34 then
        error(l_Error_0.new(("SyntaxError: Input length: %s, exceeds maximum allowed length: %s"):format(tostring(v34), (tostring(v33)))));
    end;
    local v35 = {
        type = "bos", 
        value = "", 
        output = v32.prepend or ""
    };
    local v36 = {
        v35
    };
    local v37 = not l_Boolean_0.toJSBoolean(v32.capture) and "?:" or "";
    local v38 = v10.globChars((v11.isWindows(v31)));
    local v39 = v10.extglobChars(v38);
    local l_DOT_LITERAL_0 = v38.DOT_LITERAL;
    local l_PLUS_LITERAL_0 = v38.PLUS_LITERAL;
    local l_SLASH_LITERAL_0 = v38.SLASH_LITERAL;
    local l_ONE_CHAR_0 = v38.ONE_CHAR;
    local l_DOTS_SLASH_0 = v38.DOTS_SLASH;
    local l_NO_DOT_0 = v38.NO_DOT;
    local l_NO_DOT_SLASH_0 = v38.NO_DOT_SLASH;
    local l_NO_DOTS_SLASH_0 = v38.NO_DOTS_SLASH;
    local l_QMARK_0 = v38.QMARK;
    local l_QMARK_NO_DOT_0 = v38.QMARK_NO_DOT;
    local l_STAR_0 = v38.STAR;
    local l_START_ANCHOR_0 = v38.START_ANCHOR;
    local function _(v52)
        return ("(%s(?:(?format(v37, l_START_ANCHOR_0, if not l_Boolean_0.toJSBoolean(v52.dot) then l_DOT_LITERAL_0 else l_DOTS_SLASH_0);
    end;
    local v54 = if not l_Boolean_0.toJSBoolean(v32.dot) then l_NO_DOT_0 else "";
    local v55 = if not l_Boolean_0.toJSBoolean(v32.dot) then l_QMARK_NO_DOT_0 else l_QMARK_0;
    local v56 = if v32.bash == true then ("(%s(?:(?format(v37, l_START_ANCHOR_0, if not l_Boolean_0.toJSBoolean(v32.dot) then l_DOT_LITERAL_0 else l_DOTS_SLASH_0) else l_STAR_0;
    if l_Boolean_0.toJSBoolean(v32.capture) then
        v56 = ("(%s)"):format(v56);
    end;
    if typeof(v32.noext) == "boolean" then
        v32.noextglob = v32.noext;
    end;
    local v57 = {
        input = v30, 
        index = 0, 
        start = 1, 
        dot = v32.dot == true, 
        consumed = "", 
        output = "", 
        prefix = "", 
        backtrack = false, 
        negated = false, 
        brackets = 0, 
        braces = 0, 
        parens = 0, 
        quotes = 0, 
        globstar = false, 
        tokens = v36
    };
    v30 = v11.removePrefix(v30, v57);
    v34 = #v30;
    local v58 = {};
    local v59 = {};
    local v60 = {};
    local l_v35_0 = v35;
    local v62 = nil;
    local function _()
        return v57.index == v34;
    end;
    v57.peek = function(v64)
        local v65 = if v64 ~= nil then v64 else 1;
        return (string.sub(v30, v57.index + v65, v57.index + v65));
    end;
    local l_peek_0 = v57.peek;
    v57.advance = function()
        local l_v57_0 = v57;
        l_v57_0.index = l_v57_0.index + 1;
        return string.sub(v30, v57.index, v57.index) or "";
    end;
    local l_advance_0 = v57.advance;
    local function _()
        return (string.sub(v30, v57.index + 1));
    end;
    local function _(v70, v71)
        local v72 = v70 or "";
        local v73 = v71 or 0;
        local l_v57_1 = v57;
        l_v57_1.consumed = l_v57_1.consumed .. v72;
        l_v57_1 = v57;
        l_v57_1.index = l_v57_1.index + v73;
    end;
    local function _(v76)
        local l_v57_2 = v57;
        l_v57_2.output = l_v57_2.output .. if v76.output ~= nil then v76.output else v76.value;
        local v78 = v76.value or "";
        local l_v57_3 = v57;
        l_v57_3.consumed = l_v57_3.consumed .. v78;
        l_v57_3 = v57;
        l_v57_3.index = l_v57_3.index + 0;
    end;
    local function v84()
        local v81 = 1;
        while l_peek_0() == "" and (not (l_peek_0(2) == "(") or l_peek_0(3) == "?") do
            l_advance_0();
            local l_v57_4 = v57;
            l_v57_4.start = l_v57_4.start + 1;
            v81 = v81 + 1;
        end;
        if v81 % 2 == 0 then
            return false;
        else
            v57.negated = true;
            local l_v57_5 = v57;
            l_v57_5.start = l_v57_5.start + 1;
            return true;
        end;
    end;
    local function _(v85)
        local l_v57_6 = v57;
        l_v57_6[v85] = l_v57_6[v85] + 1;
        table.insert(v60, v85);
    end;
    local function _(v88)
        local l_v57_7 = v57;
        l_v57_7[v88] = l_v57_7[v88] - 1;
        table.remove(v60);
    end;
    local function v100(v91)
        if l_v35_0.type == "globstar" then
            local v92 = false;
            if v57.braces > 0 then
                v92 = true;
                if v91.type ~= "comma" then
                    v92 = v91.type == "brace";
                end;
            end;
            local v93 = true;
            if v91.extglob ~= true then
                if #v58 ~= 0 then
                    v93 = true;
                    if v91.type ~= "pipe" then
                        v93 = v91.type == "paren";
                    end;
                else
                    v93 = #v58;
                end;
            end;
            if not ((not (v91.type ~= "slash" and v91.type ~= "paren") or v92) or v93) then
                v57.output = l_String_0.slice(v57.output, 0, -#l_v35_0.output);
                l_v35_0.type = "star";
                l_v35_0.value = "*";
                l_v35_0.output = v56;
                local l_v57_8 = v57;
                l_v57_8.output = l_v57_8.output .. l_v35_0.output;
            end;
        end;
        if #v58 ~= 0 and v91.type ~= "paren" then
            local v95 = v58[#v58];
            v95.inner = v95.inner .. v91.value;
        end;
        if not (not l_Boolean_0.toJSBoolean(v91.value) and not l_Boolean_0.toJSBoolean(v91.output)) then
            local l_v57_9 = v57;
            l_v57_9.output = l_v57_9.output .. if v91.output ~= nil then v91.output else v91.value;
            local v97 = v91.value or "";
            local l_v57_10 = v57;
            l_v57_10.consumed = l_v57_10.consumed .. v97;
            l_v57_10 = v57;
            l_v57_10.index = l_v57_10.index + 0;
        end;
        if (l_v35_0 ~= nil and l_v35_0.type == "text") and v91.type == "text" then
            local l_l_v35_0_0 = l_v35_0;
            l_l_v35_0_0.value = l_l_v35_0_0.value .. v91.value;
            l_v35_0.output = (l_v35_0.output or "") .. v91.value;
            return ;
        else
            v91.prev = l_v35_0;
            table.insert(v36, v91);
            l_v35_0 = v91;
            return ;
        end;
    end;
    local function v106(v101, v102)
        local v103 = l_Object_0.assign({}, v39[v102], {
            conditions = 1, 
            inner = ""
        });
        v103.prev = l_v35_0;
        v103.parens = v57.parens;
        v103.output = v57.output;
        local v104 = (not l_Boolean_0.toJSBoolean(v32.capture) and "" or "(") .. v103.open;
        local l_v57_11 = v57;
        l_v57_11.parens = l_v57_11.parens + 1;
        table.insert(v60, "parens");
        v100({
            type = v101, 
            value = v102, 
            output = if not l_Boolean_0.toJSBoolean(v57.output) then l_ONE_CHAR_0 else ""
        });
        v100({
            type = "paren", 
            extglob = true, 
            value = l_advance_0(), 
            output = v104
        });
        table.insert(v58, v103);
    end;
    local function v112(v107)
        local v108 = v107.close .. (not l_Boolean_0.toJSBoolean(v32.capture) and "" or ")");
        local v109 = nil;
        if v107.type == "negate" then
            local l_v56_0 = v56;
            if (v107.inner ~= nil and #v107.inner > 1) and v107.inner:find("/", 1, true) ~= nil then
                l_v56_0 = ("(%s(?:(?format(v37, l_START_ANCHOR_0, if not l_Boolean_0.toJSBoolean(v32.dot) then l_DOT_LITERAL_0 else l_DOTS_SLASH_0);
            end;
            if not (not (not (l_v56_0 == v56) or v57.index == v34) and not v9("^\\)+$"):test((string.sub(v30, v57.index + 1)))) then
                v107.close = (")$))%s"):format(l_v56_0);
                v108 = v107.close;
            end;
            if v107.inner:find("*", 1, true) ~= nil then
                v109 = string.sub(v30, v57.index + 1);
                if not (not v109 or not v9("^\\.[^\\\\/.]+$"):test(v109)) then
                    v107.close = (")%s)%s)"):format(v29(v109, l_Object_0.assign({}, v31, {
                        fastpaths = false
                    })).output, l_v56_0);
                    v108 = v107.close;
                end;
            end;
            if v107.prev.type == "bos" then
                v57.negatedExtglob = true;
            end;
        end;
        v100({
            type = "paren", 
            extglob = true, 
            value = v62, 
            output = v108
        });
        local l_v57_12 = v57;
        l_v57_12.parens = l_v57_12.parens - 1;
        table.remove(v60);
    end;
    if not (v32.fastpaths ~= false) or v9("([*test(v30) then
        while not (v57.index == v34) do
            v62 = l_advance_0();
            if v62 ~= "\000" then
                if v62 == "\\" then
                    local v113 = l_peek_0();
                    if ((not (v113 == "/") or v32.bash == true) and v113 ~= ".") and v113 ~= ";" then
                        if l_Boolean_0.toJSBoolean(v113) then
                            local v114 = v9("^\\\\+"):exec((string.sub(v30, v57.index + 1)));
                            local v115 = 0;
                            if v114 ~= nil and #v114[1] > 2 then
                                v115 = #v114[1];
                                v57.index = v57.index + v115;
                                if v115 % 2 ~= 0 then
                                    v62 = v62 .. "\\";
                                end;
                            end;
                            v62 = if v32.unescape == true then l_advance_0() else v62 .. l_advance_0();
                            if v57.brackets == 0 then
                                v100({
                                    type = "text", 
                                    value = v62
                                });
                                continue;
                            end;
                        else
                            v62 = v62 .. "\\";
                            v100({
                                type = "text", 
                                value = v62
                            });
                            continue;
                        end;
                    else
                        continue;
                    end;
                end;
                if v57.brackets > 0 and (not (v62 == "]" and l_v35_0.value ~= "[") or l_v35_0.value == "[^") then
                    if v32.posix ~= false and v62 == ":" then
                        local v116 = l_String_0.slice(l_v35_0.value, 1);
                        if v116:find("[", 1, true) ~= nil then
                            l_v35_0.posix = true;
                            if v116:find(":", 1, true) ~= nil then
                                local v117 = l_String_0.lastIndexOf(l_v35_0.value, "[");
                                local v118 = l_String_0.slice(l_v35_0.value, 1, v117);
                                local v119 = l_POSIX_REGEX_SOURCE_0[l_String_0.slice(l_v35_0.value, v117 + 2)];
                                if v119 then
                                    l_v35_0.value = v118 .. v119;
                                    v57.backtrack = true;
                                    l_advance_0();
                                    if not l_Boolean_0.toJSBoolean(v35.output) and l_Array_0.indexOf(v36, l_v35_0) == 2 then
                                        v35.output = l_ONE_CHAR_0;
                                        continue;
                                    else
                                        continue;
                                    end;
                                end;
                            end;
                        end;
                    end;
                    if not (not (v62 == "[") or l_peek_0() == ":") or v62 == "-" and l_peek_0() == "]" then
                        v62 = ("\\%s"):format(v62);
                    end;
                    if v62 == "]" and (not (l_v35_0.value ~= "[") or l_v35_0.value == "[^") then
                        v62 = ("\\%s"):format(v62);
                    end;
                    if (v32.posix == true and v62 == "") and l_v35_0.value == "[" then
                        v62 = "^";
                    end;
                    l_v35_0.value = l_v35_0.value .. v62;
                    local v120 = {
                        value = v62
                    };
                    v57.output = v57.output .. if v120.output ~= nil then v120.output else v120.value;
                    v57.consumed = v57.consumed .. (v120.value or "");
                    v57.index = v57.index + 0;
                elseif v57.quotes == 1 and v62 ~= "\"" then
                    v62 = v11.escapeRegex(v62);
                    l_v35_0.value = l_v35_0.value .. v62;
                    local v121 = {
                        value = v62
                    };
                    v57.output = v57.output .. if v121.output ~= nil then v121.output else v121.value;
                    v57.consumed = v57.consumed .. (v121.value or "");
                    v57.index = v57.index + 0;
                elseif v62 == "\"" then
                    v57.quotes = v57.quotes == 1 and 0 or 1;
                    if v32.keepQuotes == true then
                        v100({
                            type = "text", 
                            value = v62
                        });
                    end;
                elseif v62 == "(" then
                    v57.parens = v57.parens + 1;
                    table.insert(v60, "parens");
                    v100({
                        type = "paren", 
                        value = v62
                    });
                elseif v62 == ")" then
                    if v57.parens == 0 and v32.strictBrackets == true then
                        error(l_Error_0.new("SyntaxError: " .. ("Missing %s: \"%s\" - use \"\\%s\" to match literal characters"):format("opening", "(", "(")));
                    end;
                    local v122 = v58[#v58];
                    if v122 ~= nil and v57.parens == v122.parens + 1 then
                        v112((table.remove(v58)));
                    else
                        v100({
                            type = "paren", 
                            value = v62, 
                            output = not l_Boolean_0.toJSBoolean(v57.parens) and "\\)" or ")"
                        });
                        v57.parens = v57.parens - 1;
                        table.remove(v60);
                    end;
                elseif v62 == "[" then
                    if not (v32.nobracket ~= true) or string.sub(v30, v57.index + 1):find("]", 1, true) == nil then
                        if v32.nobracket ~= true and v32.strictBrackets == true then
                            error(l_Error_0.new("SyntaxError: " .. ("Missing %s: \"%s\" - use \"\\%s\" to match literal characters"):format("closing", "]", "]")));
                        end;
                        v62 = ("\\%s"):format(v62);
                    else
                        v57.brackets = v57.brackets + 1;
                        table.insert(v60, "brackets");
                    end;
                    v100({
                        type = "bracket", 
                        value = v62
                    });
                elseif v62 == "]" then
                    if not (v32.nobracket ~= true) or (l_v35_0 ~= nil and l_v35_0.type == "bracket") and #l_v35_0.value == 1 then
                        v100({
                            type = "text", 
                            value = v62, 
                            output = ("\\%s"):format(v62)
                        });
                    elseif v57.brackets == 0 then
                        if v32.strictBrackets == true then
                            error(l_Error_0.new("SyntaxError: " .. ("Missing %s: \"%s\" - use \"\\%s\" to match literal characters"):format("opening", "[", "[")));
                        end;
                        v100({
                            type = "text", 
                            value = v62, 
                            output = ("\\%s"):format(v62)
                        });
                    else
                        v57.brackets = v57.brackets - 1;
                        table.remove(v60);
                        local v123 = l_String_0.slice(l_v35_0.value, 2);
                        if (l_v35_0.posix ~= true and v123:sub(1, 1) == "^") and v123:find("/", 1, true) == nil then
                            v62 = ("/%s"):format(v62);
                        end;
                        l_v35_0.value = l_v35_0.value .. v62;
                        local v124 = {
                            value = v62
                        };
                        v57.output = v57.output .. if v124.output ~= nil then v124.output else v124.value;
                        v57.consumed = v57.consumed .. (v124.value or "");
                        v57.index = v57.index + 0;
                        if not (not (v32.literalBrackets ~= false) or v11.hasRegexChars(v123)) then
                            v124 = v11.escapeRegex(l_v35_0.value);
                            v57.output = l_String_0.slice(v57.output, 1, -#l_v35_0.value);
                            if v32.literalBrackets == true then
                                v57.output = v57.output .. v124;
                                l_v35_0.value = v124;
                            else
                                l_v35_0.value = ("(%s%s|%s)"):format(v37, v124, l_v35_0.value);
                                v57.output = v57.output .. l_v35_0.value;
                            end;
                        end;
                    end;
                elseif v62 == "{" and v32.nobrace ~= true then
                    v57.braces = v57.braces + 1;
                    table.insert(v60, "braces");
                    local v125 = {
                        type = "brace", 
                        value = v62, 
                        output = "(", 
                        outputIndex = #v57.output, 
                        tokensIndex = #v57.tokens
                    };
                    table.insert(v59, v125);
                    v100(v125);
                elseif v62 == "}" then
                    local v126 = v59[#v59];
                    if v32.nobrace ~= true and l_Boolean_0.toJSBoolean(v126) then
                        local v127 = ")";
                        if v126.dots == true then
                            local v128 = l_Array_0.slice(v36);
                            local v129 = {};
                            for v130 = #v128, 1, -1 do
                                table.remove(v36);
                                if v128[v130].type ~= "brace" then
                                    if v128[v130].type ~= "dots" then
                                        table.insert(v129, 1, v128[v130].value);
                                    end;
                                else
                                    break;
                                end;
                            end;
                            v127 = v21(v129, v32);
                            v57.backtrack = true;
                        end;
                        if v126.comma ~= true and v126.dots ~= true then
                            local v131 = l_String_0.slice(v57.output, 1, v126.outputIndex);
                            local v132 = l_Array_0.slice(v57.tokens, v126.tokensIndex);
                            v126.output = "\\{";
                            v126.value = v126.output;
                            v127 = "\\}";
                            v62 = v127;
                            v57.output = v131;
                            for _, v134 in ipairs(v132) do
                                v57.output = v57.output .. if not l_Boolean_0.toJSBoolean(v134.output) then v134.value else v134.output;
                            end;
                        end;
                        v100({
                            type = "brace", 
                            value = v62, 
                            output = v127
                        });
                        v57.braces = v57.braces - 1;
                        table.remove(v60);
                        table.remove(v59);
                    else
                        v100({
                            type = "text", 
                            value = v62, 
                            output = v62
                        });
                    end;
                elseif v62 == "|" then
                    if #v58 > 0 then
                        local v135 = v58[#v58];
                        v135.conditions = v135.conditions + 1;
                    end;
                    v100({
                        type = "text", 
                        value = v62
                    });
                elseif v62 == "," then
                    local l_v62_0 = v62;
                    local v137 = v59[#v59];
                    if l_Boolean_0.toJSBoolean(v137) and v60[#v60] == "braces" then
                        v137.comma = true;
                        l_v62_0 = "|";
                    end;
                    v100({
                        type = "comma", 
                        value = v62, 
                        output = l_v62_0
                    });
                elseif v62 == "/" then
                    if l_v35_0.type == "dot" and v57.index == v57.start + 1 then
                        v57.start = v57.index + 1;
                        v57.consumed = "";
                        v57.output = "";
                        table.remove(v36);
                        l_v35_0 = v35;
                    else
                        v100({
                            type = "slash", 
                            value = v62, 
                            output = l_SLASH_LITERAL_0
                        });
                    end;
                elseif v62 == "." then
                    if v57.braces > 0 and l_v35_0.type == "dot" then
                        if l_v35_0.value == "." then
                            l_v35_0.output = l_DOT_LITERAL_0;
                        end;
                        local v138 = v59[#v59];
                        l_v35_0.type = "dots";
                        l_v35_0.output = l_v35_0.output .. v62;
                        l_v35_0.value = l_v35_0.value .. v62;
                        v138.dots = true;
                    elseif (v57.braces + v57.parens == 0 and l_v35_0.type ~= "bos") and l_v35_0.type ~= "slash" then
                        v100({
                            type = "text", 
                            value = v62, 
                            output = l_DOT_LITERAL_0
                        });
                    else
                        v100({
                            type = "dot", 
                            value = v62, 
                            output = l_DOT_LITERAL_0
                        });
                    end;
                elseif v62 == "?" then
                    if ((not (l_Boolean_0.toJSBoolean(l_v35_0) and l_v35_0.value == "(") and v32.noextglob ~= true) and l_peek_0() == "(") and l_peek_0(2) ~= "?" then
                        v106("qmark", v62);
                    elseif l_Boolean_0.toJSBoolean(l_v35_0) and l_v35_0.type == "paren" then
                        local v139 = l_peek_0();
                        local l_v62_1 = v62;
                        if not (not (v139 == "<") or v11.supportsLookbehinds()) then
                            error(l_Error_0.new("Node.js v10 or higher is required for regex lookbehinds"));
                        end;
                        if not (not (l_v35_0.value == "(" and not v9("[]"):test(v139)) and (not (v139 == "<") or v9("<([test((string.sub(v30, v57.index + 1))))) then
                            l_v62_1 = ("\\%s"):format(v62);
                        end;
                        v100({
                            type = "text", 
                            value = v62, 
                            output = l_v62_1
                        });
                    elseif v32.dot ~= true and (not (l_v35_0.type ~= "slash") or l_v35_0.type == "bos") then
                        v100({
                            type = "qmark", 
                            value = v62, 
                            output = l_QMARK_NO_DOT_0
                        });
                    else
                        v100({
                            type = "qmark", 
                            value = v62, 
                            output = l_QMARK_0
                        });
                    end;
                else
                    if v62 == "" then
                        if not (v32.noextglob ~= true and l_peek_0() == "(") or l_peek_0(2) == "?" and v9("[]"):test(l_peek_0(3)) then
                            if v32.nonegate ~= true and v57.index == 1 then
                                v84();
                                continue;
                            end;
                        else
                            v106("negate", v62);
                            continue;
                        end;
                    end;
                    if v62 == "+" then
                        if (v32.noextglob ~= true and l_peek_0() == "(") and l_peek_0(2) ~= "?" then
                            v106("plus", v62);
                        elseif not (not (l_v35_0 ~= nil) or l_v35_0.value ~= "(") or v32.regex == false then
                            v100({
                                type = "plus", 
                                value = v62, 
                                output = l_PLUS_LITERAL_0
                            });
                        elseif not (not (l_v35_0 ~= nil) or (l_v35_0.type ~= "bracket" and l_v35_0.type ~= "paren") and l_v35_0.type ~= "brace") or v57.parens > 0 then
                            v100({
                                type = "plus", 
                                value = v62
                            });
                        else
                            v100({
                                type = "plus", 
                                value = l_PLUS_LITERAL_0
                            });
                        end;
                    elseif v62 == "@" then
                        if (v32.noextglob ~= true and l_peek_0() == "(") and l_peek_0(2) ~= "?" then
                            v100({
                                type = "at", 
                                extglob = true, 
                                value = v62, 
                                output = ""
                            });
                        else
                            v100({
                                type = "text", 
                                value = v62
                            });
                        end;
                    elseif v62 ~= "*" then
                        if not (v62 ~= "$") or v62 == "^" then
                            v62 = ("\\%s"):format(v62);
                        end;
                        local v141 = string.match(string.sub(v30, v57.index + 1), l_REGEX_NON_SPECIAL_CHARS_0);
                        if v141 ~= nil then
                            v62 = v62 .. v141;
                            v57.index = v57.index + #v141;
                        end;
                        v100({
                            type = "text", 
                            value = v62
                        });
                    elseif l_v35_0 ~= nil and (not (l_v35_0.type ~= "globstar") or l_v35_0.star == true) then
                        l_v35_0.type = "star";
                        l_v35_0.star = true;
                        l_v35_0.value = l_v35_0.value .. v62;
                        l_v35_0.output = v56;
                        v57.backtrack = true;
                        v57.globstar = true;
                        v57.consumed = v57.consumed .. (v62 or "");
                        v57.index = v57.index + 0;
                    else
                        local v142 = string.sub(v30, v57.index + 1);
                        local l_toJSBoolean_0 = l_Boolean_0.toJSBoolean;
                        local v144 = false;
                        if v32.noextglob ~= true then
                            v144 = v9("^\\([^?]"):test(v142);
                        end;
                        if not l_toJSBoolean_0(v144) then
                            if l_v35_0.type == "star" then
                                if v32.noglobstar == true then
                                    v57.consumed = v57.consumed .. (v62 or "");
                                    v57.index = v57.index + 0;
                                else
                                    l_toJSBoolean_0 = l_v35_0.prev;
                                    v144 = l_toJSBoolean_0.prev;
                                    local v145 = true;
                                    if l_toJSBoolean_0.type ~= "slash" then
                                        v145 = l_toJSBoolean_0.type == "bos";
                                    end;
                                    local v146;
                                    if not l_Boolean_0.toJSBoolean(v144) then
                                        v146 = v144;
                                    else
                                        v146 = true;
                                        if v144.type ~= "star" then
                                            v146 = v144.type == "globstar";
                                        end;
                                    end;
                                    if v32.bash == true and (not v145 or v142:sub(1, 1) ~= nil and v142:sub(1, 1) ~= "/") then
                                        v100({
                                            type = "star", 
                                            value = v62, 
                                            output = ""
                                        });
                                    else
                                        local v147 = false;
                                        if v57.braces > 0 then
                                            v147 = true;
                                            if l_toJSBoolean_0.type ~= "comma" then
                                                v147 = l_toJSBoolean_0.type == "brace";
                                            end;
                                        end;
                                        local v148 = false;
                                        if #v58 > 0 then
                                            v148 = true;
                                            if l_toJSBoolean_0.type ~= "pipe" then
                                                v148 = l_toJSBoolean_0.type == "paren";
                                            end;
                                        end;
                                        if (not (not v145 and l_toJSBoolean_0.type ~= "paren") or v147) or v148 then
                                            while l_String_0.slice(v142, 1, 4) == "/**" do
                                                local v149 = v30:sub(v57.index + 4, v57.index + 4);
                                                if not l_Boolean_0.toJSBoolean(v149) or v149 == "/" then
                                                    v142 = l_String_0.slice(v142, 4);
                                                    v57.consumed = v57.consumed .. "/**";
                                                    v57.index = v57.index + 3;
                                                else
                                                    break;
                                                end;
                                            end;
                                            if not (l_toJSBoolean_0.type == "bos") or not (v57.index == v34) then
                                                if (not (l_toJSBoolean_0.type == "slash" and l_toJSBoolean_0.prev.type ~= "bos") or l_Boolean_0.toJSBoolean(v146)) or not (v57.index == v34) then
                                                    if (l_toJSBoolean_0.type == "slash" and l_toJSBoolean_0.prev.type ~= "bos") and v142:sub(1, 1) == "/" then
                                                        local v150 = v142:sub(2, 2) ~= nil and "|$" or "";
                                                        v57.output = l_String_0.slice(v57.output, 1, -#(l_toJSBoolean_0.output .. l_v35_0.output));
                                                        l_toJSBoolean_0.output = ("(?:%s"):format(l_toJSBoolean_0.output);
                                                        l_v35_0.type = "globstar";
                                                        l_v35_0.output = ("%s%s|%s%s)"):format(("(%s(?:(?format(v37, l_START_ANCHOR_0, if not l_Boolean_0.toJSBoolean(v32.dot) then l_DOT_LITERAL_0 else l_DOTS_SLASH_0), l_SLASH_LITERAL_0, l_SLASH_LITERAL_0, v150);
                                                        l_v35_0.value = l_v35_0.value .. v62;
                                                        v57.output = v57.output .. l_toJSBoolean_0.output .. l_v35_0.output;
                                                        v57.globstar = true;
                                                        v57.consumed = v57.consumed .. (v62 .. l_advance_0() or "");
                                                        v57.index = v57.index + 0;
                                                        v100({
                                                            type = "slash", 
                                                            value = "/", 
                                                            output = ""
                                                        });
                                                    elseif l_toJSBoolean_0.type == "bos" and v142:sub(1, 1) == "/" then
                                                        l_v35_0.type = "globstar";
                                                        l_v35_0.value = l_v35_0.value .. v62;
                                                        l_v35_0.output = ("(?:|%s|%s%s)"):format(l_SLASH_LITERAL_0, ("(%s(?:(?format(v37, l_START_ANCHOR_0, if not l_Boolean_0.toJSBoolean(v32.dot) then l_DOT_LITERAL_0 else l_DOTS_SLASH_0), l_SLASH_LITERAL_0);
                                                        v57.output = l_v35_0.output;
                                                        v57.globstar = true;
                                                        v57.consumed = v57.consumed .. (v62 .. l_advance_0() or "");
                                                        v57.index = v57.index + 0;
                                                        v100({
                                                            type = "slash", 
                                                            value = "/", 
                                                            output = ""
                                                        });
                                                    else
                                                        v57.output = l_String_0.slice(v57.output, 1, -#l_v35_0.output);
                                                        l_v35_0.type = "globstar";
                                                        l_v35_0.output = ("(%s(?:(?format(v37, l_START_ANCHOR_0, if not l_Boolean_0.toJSBoolean(v32.dot) then l_DOT_LITERAL_0 else l_DOTS_SLASH_0);
                                                        l_v35_0.value = l_v35_0.value .. v62;
                                                        v57.output = v57.output .. l_v35_0.output;
                                                        v57.globstar = true;
                                                        v57.consumed = v57.consumed .. (v62 or "");
                                                        v57.index = v57.index + 0;
                                                    end;
                                                else
                                                    v57.output = l_String_0.slice(v57.output, 1, -#(l_toJSBoolean_0.output .. l_v35_0.output));
                                                    l_toJSBoolean_0.output = ("(?:%s"):format(l_toJSBoolean_0.output);
                                                    l_v35_0.type = "globstar";
                                                    l_v35_0.output = ("(%s(?:(?format(v37, l_START_ANCHOR_0, if not l_Boolean_0.toJSBoolean(v32.dot) then l_DOT_LITERAL_0 else l_DOTS_SLASH_0) .. (not v32.strictSlashes and "|$)" or ")");
                                                    l_v35_0.value = l_v35_0.value .. v62;
                                                    v57.globstar = true;
                                                    v57.output = v57.output .. l_toJSBoolean_0.output .. l_v35_0.output;
                                                    v57.consumed = v57.consumed .. (v62 or "");
                                                    v57.index = v57.index + 0;
                                                end;
                                            else
                                                l_v35_0.type = "globstar";
                                                l_v35_0.value = l_v35_0.value .. v62;
                                                l_v35_0.output = ("(%s(?:(?format(v37, l_START_ANCHOR_0, if not l_Boolean_0.toJSBoolean(v32.dot) then l_DOT_LITERAL_0 else l_DOTS_SLASH_0);
                                                v57.output = l_v35_0.output;
                                                v57.globstar = true;
                                                v57.consumed = v57.consumed .. (v62 or "");
                                                v57.index = v57.index + 0;
                                            end;
                                        else
                                            v100({
                                                type = "star", 
                                                value = v62, 
                                                output = ""
                                            });
                                        end;
                                    end;
                                end;
                            else
                                l_toJSBoolean_0 = {
                                    type = "star", 
                                    value = v62, 
                                    output = v56
                                };
                                if v32.bash == true then
                                    l_toJSBoolean_0.output = ".*?";
                                    if not (l_v35_0.type ~= "bos") or l_v35_0.type == "slash" then
                                        l_toJSBoolean_0.output = v54 .. l_toJSBoolean_0.output;
                                    end;
                                    v100(l_toJSBoolean_0);
                                elseif (l_v35_0 ~= nil and (not (l_v35_0.type ~= "bracket") or l_v35_0.type == "paren")) and v32.regex == true then
                                    l_toJSBoolean_0.output = v62;
                                    v100(l_toJSBoolean_0);
                                else
                                    if not (v57.index ~= v57.start and l_v35_0.type ~= "slash") or l_v35_0.type == "dot" then
                                        if l_v35_0.type == "dot" then
                                            v57.output = v57.output .. l_NO_DOT_SLASH_0;
                                            l_v35_0.output = l_v35_0.output .. l_NO_DOT_SLASH_0;
                                        elseif v32.dot == true then
                                            v57.output = v57.output .. l_NO_DOTS_SLASH_0;
                                            l_v35_0.output = l_v35_0.output .. l_NO_DOTS_SLASH_0;
                                        else
                                            v57.output = v57.output .. v54;
                                            l_v35_0.output = l_v35_0.output .. v54;
                                        end;
                                        if l_peek_0() ~= "*" then
                                            v57.output = v57.output .. l_ONE_CHAR_0;
                                            l_v35_0.output = l_v35_0.output .. l_ONE_CHAR_0;
                                        end;
                                    end;
                                    v100(l_toJSBoolean_0);
                                end;
                            end;
                        else
                            v106("star", v62);
                        end;
                    end;
                end;
            end;
        end;
        while v57.brackets > 0 do
            if v32.strictBrackets == true then
                error(l_Error_0.new("SyntaxError: " .. ("Missing %s: \"%s\" - use \"\\%s\" to match literal characters"):format("closing", "]", "]")));
            end;
            v57.output = v11.escapeLast(v57.output, "[");
            v57.brackets = v57.brackets - 1;
            table.remove(v60);
        end;
        while v57.parens > 0 do
            if v32.strictBrackets == true then
                error(l_Error_0.new("SyntaxError: " .. ("Missing %s: \"%s\" - use \"\\%s\" to match literal characters"):format("closing", ")", ")")));
            end;
            v57.output = v11.escapeLast(v57.output, "(");
            v57.parens = v57.parens - 1;
            table.remove(v60);
        end;
        while v57.braces > 0 do
            if v32.strictBrackets == true then
                error(l_Error_0.new("SyntaxError: " .. ("Missing %s: \"%s\" - use \"\\%s\" to match literal characters"):format("closing", "}", "}")));
            end;
            v57.output = v11.escapeLast(v57.output, "{");
            v57.braces = v57.braces - 1;
            table.remove(v60);
        end;
        if v32.strictSlashes ~= true and (not (l_v35_0.type ~= "star") or l_v35_0.type == "bracket") then
            v100({
                type = "maybe_slash", 
                value = "", 
                output = ("%s?"):format(l_SLASH_LITERAL_0)
            });
        end;
        if v57.backtrack == true then
            v57.output = "";
            for _, v152 in ipairs(v57.tokens) do
                v57.output = v57.output .. if v152.output ~= nil then v152.output else v152.value;
                if v152.suffix then
                    v57.output = v57.output .. v152.suffix;
                end;
            end;
        end;
        return v57;
    else
        local v153 = false;
        local v160 = l_stringReplace_0(v30, l_REGEX_SPECIAL_CHARS_BACKREF_0, function(v154, v155, v156, v157, v158, v159)
            if v157 == "\\" then
                v153 = true;
                return v154;
            elseif v157 == "?" then
                if not l_Boolean_0.toJSBoolean(v155) then
                    if v159 == 0 then
                        return v55 .. if v158 ~= nil then string.rep(l_QMARK_0, #v158) else "";
                    else
                        return string.rep(l_QMARK_0, #v156);
                    end;
                else
                    return v155 .. v157 .. if v158 ~= nil then string.rep(l_QMARK_0, #v158) else "";
                end;
            elseif v157 == "." then
                return string.rep(l_DOT_LITERAL_0, #v156);
            elseif v157 == "*" then
                if not l_Boolean_0.toJSBoolean(v155) then
                    return v56;
                else
                    return v155 .. v157 .. if v158 ~= nil then v56 else "";
                end;
            elseif not l_Boolean_0.toJSBoolean(v155) then
                return (("\\%s"):format(v154));
            else
                return v154;
            end;
        end);
        if v153 == true then
            if v32.unescape == true then
                error("not implemented");
            else
                error("not implemented");
            end;
        end;
        if v160 == v30 and v32.contains == true then
            v57.output = v30;
            return v57;
        else
            v57.output = v11.wrapOutput(v160, v57, v31);
            return v57;
        end;
    end;
end;
v29.fastpaths = function(v161, v162)
    local v163 = l_Object_0.assign({}, v162);
    local v164 = if typeof(v163.maxLength) == "number" then math.min(l_MAX_LENGTH_0, v163.maxLength) else l_MAX_LENGTH_0;
    local v165 = #v161;
    if v164 < v165 then
        error(l_Error_0.new(("SyntaxError: Input length: %s, exceeds maximum allowed length: %s"):format(tostring(v165), (tostring(v164)))));
    end;
    v161 = not not l_Boolean_0.toJSBoolean(l_REPLACEMENTS_0[v161]) and l_REPLACEMENTS_0[v161] or v161;
    local v166 = v10.globChars((v11.isWindows(v162)));
    local l_DOT_LITERAL_1 = v166.DOT_LITERAL;
    local l_SLASH_LITERAL_1 = v166.SLASH_LITERAL;
    local l_ONE_CHAR_1 = v166.ONE_CHAR;
    local l_DOTS_SLASH_1 = v166.DOTS_SLASH;
    local l_NO_DOT_1 = v166.NO_DOT;
    local l_NO_DOTS_0 = v166.NO_DOTS;
    local l_NO_DOTS_SLASH_1 = v166.NO_DOTS_SLASH;
    local l_STAR_1 = v166.STAR;
    local l_START_ANCHOR_1 = v166.START_ANCHOR;
    local v176 = if not l_Boolean_0.toJSBoolean(v163.dot) then l_NO_DOT_1 else l_NO_DOTS_0;
    local v177 = if not l_Boolean_0.toJSBoolean(v163.dot) then l_NO_DOT_1 else l_NO_DOTS_SLASH_1;
    local v178 = not l_Boolean_0.toJSBoolean(v163.capture) and "?:" or "";
    local v179 = {
        negated = false, 
        prefix = ""
    };
    local v180 = v163.bash == true and ".*?" or l_STAR_1;
    if l_Boolean_0.toJSBoolean(v163.capture) then
        v180 = ("(%s)"):format(v180);
    end;
    local function _(v181)
        if v181.noglobstar == true then
            return v180;
        else
            return ("(%s(?:(?format(v178, l_START_ANCHOR_1, if not l_Boolean_0.toJSBoolean(v181.dot) then l_DOT_LITERAL_1 else l_DOTS_SLASH_1);
        end;
    end;
    local function v183(v184)
        if v184 == "*" then
            return ("%s%s%s"):format(v176, l_ONE_CHAR_1, v180);
        elseif v184 == ".*" then
            return ("%s%s%s"):format(l_DOT_LITERAL_1, l_ONE_CHAR_1, v180);
        elseif v184 == "*.*" then
            return ("%s%s%s%s%s"):format(v176, v180, l_DOT_LITERAL_1, l_ONE_CHAR_1, v180);
        elseif v184 == "*/*" then
            return ("%s%s%s%s%s%s"):format(v176, v180, l_SLASH_LITERAL_1, l_ONE_CHAR_1, v177, v180);
        elseif v184 == "**" then
            local l_v176_0 = v176;
            local l_v163_0 = v163;
            return l_v176_0 .. if l_v163_0.noglobstar == true then v180 else ("(%s(?:(?format(v178, l_START_ANCHOR_1, if not l_Boolean_0.toJSBoolean(l_v163_0.dot) then l_DOT_LITERAL_1 else l_DOTS_SLASH_1);
        elseif v184 == "**/*" then
            local v187 = "(?:%s%s%s)?%s%s%s";
            local l_v176_1 = v176;
            local l_v163_1 = v163;
            return v187:format(l_v176_1, if l_v163_1.noglobstar == true then v180 else ("(%s(?:(?format(v178, l_START_ANCHOR_1, if not l_Boolean_0.toJSBoolean(l_v163_1.dot) then l_DOT_LITERAL_1 else l_DOTS_SLASH_1), l_SLASH_LITERAL_1, v177, l_ONE_CHAR_1, v180);
        elseif v184 == "**/*.*" then
            local v190 = "(?:%s%s%s)?%s%s%s%s%s";
            local l_v176_2 = v176;
            local l_v163_2 = v163;
            return v190:format(l_v176_2, if l_v163_2.noglobstar == true then v180 else ("(%s(?:(?format(v178, l_START_ANCHOR_1, if not l_Boolean_0.toJSBoolean(l_v163_2.dot) then l_DOT_LITERAL_1 else l_DOTS_SLASH_1), l_SLASH_LITERAL_1, v177, v180, l_DOT_LITERAL_1, l_ONE_CHAR_1, v180);
        elseif v184 == "**/.*" then
            local v193 = "(?:%s%s%s)?%s%s%s";
            local l_v176_3 = v176;
            local l_v163_3 = v163;
            return v193:format(l_v176_3, if l_v163_3.noglobstar == true then v180 else ("(%s(?:(?format(v178, l_START_ANCHOR_1, if not l_Boolean_0.toJSBoolean(l_v163_3.dot) then l_DOT_LITERAL_1 else l_DOTS_SLASH_1), l_SLASH_LITERAL_1, l_DOT_LITERAL_1, l_ONE_CHAR_1, v180);
        else
            local v196 = v9("^(.*?)\\.(\\w+)$"):exec(v184);
            if l_Boolean_0.toJSBoolean(v196) then
                local v197 = v183(v196[2]);
                if l_Boolean_0.toJSBoolean(v197) then
                    return v197 .. l_DOT_LITERAL_1 .. v196[3];
                else
                    return nil;
                end;
            else
                return nil;
            end;
        end;
    end;
    local v198 = v183((v11.removePrefix(v161, v179)));
    if not (not (v198 ~= nil) or not l_Boolean_0.toJSBoolean(v198)) and v163.strictSlashes ~= true then
        v198 = v198 .. ("%s?"):format(l_SLASH_LITERAL_1);
    end;
    return v198;
end;
return v29;
