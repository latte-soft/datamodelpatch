local l_Parent_0 = script.Parent;
local v1 = require(l_Parent_0.Parent.LuauPolyfill);
local l_Boolean_0 = v1.Boolean;
local l_String_0 = v1.String;
local v4 = require(l_Parent_0.utils);
local v5 = require(l_Parent_0.constants);
local l_CHAR_ASTERISK_0 = v5.CHAR_ASTERISK;
local l_CHAR_AT_0 = v5.CHAR_AT;
local l_CHAR_BACKWARD_SLASH_0 = v5.CHAR_BACKWARD_SLASH;
local l_CHAR_COMMA_0 = v5.CHAR_COMMA;
local l_CHAR_DOT_0 = v5.CHAR_DOT;
local l_CHAR_EXCLAMATION_MARK_0 = v5.CHAR_EXCLAMATION_MARK;
local l_CHAR_FORWARD_SLASH_0 = v5.CHAR_FORWARD_SLASH;
local l_CHAR_LEFT_CURLY_BRACE_0 = v5.CHAR_LEFT_CURLY_BRACE;
local l_CHAR_LEFT_PARENTHESES_0 = v5.CHAR_LEFT_PARENTHESES;
local l_CHAR_LEFT_SQUARE_BRACKET_0 = v5.CHAR_LEFT_SQUARE_BRACKET;
local l_CHAR_PLUS_0 = v5.CHAR_PLUS;
local l_CHAR_QUESTION_MARK_0 = v5.CHAR_QUESTION_MARK;
local l_CHAR_RIGHT_CURLY_BRACE_0 = v5.CHAR_RIGHT_CURLY_BRACE;
local l_CHAR_RIGHT_PARENTHESES_0 = v5.CHAR_RIGHT_PARENTHESES;
local l_CHAR_RIGHT_SQUARE_BRACKET_0 = v5.CHAR_RIGHT_SQUARE_BRACKET;
local function _(v21)
    local v22 = true;
    if v21 ~= l_CHAR_FORWARD_SLASH_0 then
        v22 = v21 == l_CHAR_BACKWARD_SLASH_0;
    end;
    return v22;
end;
local function _(v24)
    if v24.isPrefix ~= true then
        v24.depth = not l_Boolean_0.toJSBoolean(v24.isGlobstar) and 1 or math.huge;
    end;
end;
return function(v26, v27)
    local v28 = v27 or {};
    local v29 = #v26 + 1;
    local v30 = true;
    if v28.parts ~= true then
        v30 = v28.scanToEnd == true;
    end;
    local v31 = {};
    local v32 = {};
    local v33 = {};
    local l_v26_0 = v26;
    local v35 = 0;
    local v36 = 1;
    local v37 = 1;
    local v38 = false;
    local v39 = false;
    local v40 = false;
    local v41 = false;
    local v42 = false;
    local v43 = false;
    local v44 = false;
    local v45 = false;
    local v46 = false;
    local v47 = false;
    local v48 = 0;
    local v49 = nil;
    local v50 = nil;
    local v51 = {
        value = "", 
        depth = 0, 
        isGlob = false
    };
    local function _()
        return v29 <= v35;
    end;
    local function _()
        return l_String_0.charCodeAt(l_v26_0, v35 + 1);
    end;
    local function _()
        v49 = v50;
        v35 = v35 + 1;
        return l_String_0.charCodeAt(l_v26_0, v35);
    end;
    while v35 < v29 do
        v49 = v50;
        v35 = v35 + 1;
        v50 = l_String_0.charCodeAt(l_v26_0, v35);
        local v55 = nil;
        if v50 == l_CHAR_BACKWARD_SLASH_0 then
            v51.backslashes = true;
            v44 = v51.backslashes;
            v49 = v50;
            v35 = v35 + 1;
            v50 = l_String_0.charCodeAt(l_v26_0, v35);
            if v50 == l_CHAR_LEFT_CURLY_BRACE_0 then
                v43 = true;
            end;
            --[[ close >= 29 ]]
        elseif not (v43 ~= true) or v50 == l_CHAR_LEFT_CURLY_BRACE_0 then
            v48 = v48 + 1;
            while (v29 <= v35) ~= true do
                local l_toJSBoolean_0 = l_Boolean_0.toJSBoolean;
                v49 = v50;
                v35 = v35 + 1;
                v50 = l_String_0.charCodeAt(l_v26_0, v35);
                if l_toJSBoolean_0(v50) then
                    if v50 == l_CHAR_BACKWARD_SLASH_0 then
                        v51.backslashes = true;
                        v44 = v51.backslashes;
                        v49 = v50;
                        v35 = v35 + 1;
                        l_toJSBoolean_0 = l_String_0.charCodeAt(l_v26_0, v35);
                    elseif v50 == l_CHAR_LEFT_CURLY_BRACE_0 then
                        v48 = v48 + 1;
                    else
                        if v43 ~= true and v50 == l_CHAR_DOT_0 then
                            v49 = v50;
                            v35 = v35 + 1;
                            v50 = l_String_0.charCodeAt(l_v26_0, v35);
                            if v50 == l_CHAR_DOT_0 then
                                v51.isBrace = true;
                                v38 = v51.isBrace;
                                v51.isGlob = true;
                                v40 = v51.isGlob;
                                v47 = true;
                                if not (v30 ~= true) then
                                    continue;
                                else
                                    break;
                                end;
                            end;
                        end;
                        if v43 ~= true and v50 == l_CHAR_COMMA_0 then
                            v51.isBrace = true;
                            v38 = v51.isBrace;
                            v51.isGlob = true;
                            v40 = v51.isGlob;
                            v47 = true;
                            if v30 ~= true then
                                break;
                            end;
                        elseif v50 == l_CHAR_RIGHT_CURLY_BRACE_0 then
                            v48 = v48 - 1;
                            if v48 == 0 then
                                v43 = false;
                                v51.isBrace = true;
                                v38 = v51.isBrace;
                                v47 = true;
                                break;
                            end;
                        end;
                    end;
                else
                    break;
                end;
            end;
            if v30 == true then
                --[[ close >= 29 ]]
            else
                --[[ close >= 29 ]]
                break;
            end;
        elseif v50 == l_CHAR_FORWARD_SLASH_0 then
            table.insert(v31, v35);
            table.insert(v32, v51);
            v51 = {
                value = "", 
                depth = 0, 
                isGlob = false
            };
            if v47 == true then
                --[[ close >= 29 ]]
            elseif v49 == l_CHAR_DOT_0 and v35 == v36 + 1 then
                v36 = v36 + 2;
                --[[ close >= 29 ]]
            else
                v37 = v35 + 1;
                --[[ close >= 29 ]]
            end;
        else
            if v28.noext ~= true then
                local v57 = true;
                if v50 ~= l_CHAR_PLUS_0 then
                    v57 = true;
                    if v50 ~= l_CHAR_AT_0 then
                        v57 = true;
                        if v50 ~= l_CHAR_ASTERISK_0 then
                            v57 = true;
                            if v50 ~= l_CHAR_QUESTION_MARK_0 then
                                v57 = v50 == l_CHAR_EXCLAMATION_MARK_0;
                            end;
                        end;
                    end;
                end;
                if v57 == true and l_String_0.charCodeAt(l_v26_0, v35 + 1) == l_CHAR_LEFT_PARENTHESES_0 then
                    v51.isGlob = true;
                    v40 = v51.isGlob;
                    v51.isExtglob = true;
                    v41 = v51.isExtglob;
                    v47 = true;
                    if v50 == l_CHAR_EXCLAMATION_MARK_0 and v35 == v36 then
                        v46 = true;
                    end;
                    if v30 == true then
                        while (v29 <= v35) ~= true do
                            local l_toJSBoolean_1 = l_Boolean_0.toJSBoolean;
                            v49 = v50;
                            v35 = v35 + 1;
                            v50 = l_String_0.charCodeAt(l_v26_0, v35);
                            if l_toJSBoolean_1(v50) then
                                if v50 == l_CHAR_BACKWARD_SLASH_0 then
                                    v51.backslashes = true;
                                    v44 = v51.backslashes;
                                    v49 = v50;
                                    v35 = v35 + 1;
                                    v50 = l_String_0.charCodeAt(l_v26_0, v35);
                                elseif v50 == l_CHAR_RIGHT_PARENTHESES_0 then
                                    v51.isGlob = true;
                                    v40 = v51.isGlob;
                                    v47 = true;
                                    break;
                                end;
                            else
                                break;
                            end;
                        end;
                        --[[ close >= 29 ]]
                        continue;
                    else
                        --[[ close >= 29 ]]
                        break;
                    end;
                end;
            end;
            if v50 == l_CHAR_ASTERISK_0 then
                if v49 == l_CHAR_ASTERISK_0 then
                    v51.isGlobstar = true;
                    v42 = v51.isGlobstar;
                end;
                v51.isGlob = true;
                v40 = v51.isGlob;
                v47 = true;
                if v30 == true then
                    --[[ close >= 29 ]]
                else
                    --[[ close >= 29 ]]
                    break;
                end;
            elseif v50 == l_CHAR_QUESTION_MARK_0 then
                v51.isGlob = true;
                v40 = v51.isGlob;
                v47 = true;
                if v30 == true then
                    --[[ close >= 29 ]]
                else
                    --[[ close >= 29 ]]
                    break;
                end;
            elseif v50 == l_CHAR_LEFT_SQUARE_BRACKET_0 then
                while (v29 <= v35) ~= true do
                    local l_toJSBoolean_2 = l_Boolean_0.toJSBoolean;
                    v49 = v50;
                    v35 = v35 + 1;
                    v55 = l_String_0.charCodeAt(l_v26_0, v35);
                    if l_toJSBoolean_2(v55) then
                        if v55 == l_CHAR_BACKWARD_SLASH_0 then
                            v51.backslashes = true;
                            v44 = v51.backslashes;
                            v49 = v50;
                            v35 = v35 + 1;
                            l_toJSBoolean_2 = l_String_0.charCodeAt(l_v26_0, v35);
                        elseif v55 == l_CHAR_RIGHT_SQUARE_BRACKET_0 then
                            v51.isBracket = true;
                            v39 = v51.isBracket;
                            v51.isGlob = true;
                            v40 = v51.isGlob;
                            v47 = true;
                            break;
                        end;
                    else
                        break;
                    end;
                end;
                if v30 == true then
                    --[[ close >= 29 ]]
                else
                    --[[ close >= 29 ]]
                    break;
                end;
            elseif (v28.nonegate ~= true and v50 == l_CHAR_EXCLAMATION_MARK_0) and v35 == v36 then
                v51.negated = true;
                v45 = v51.negated;
                v36 = v36 + 1;
                --[[ close >= 29 ]]
            elseif v28.noparen ~= true and v50 == l_CHAR_LEFT_PARENTHESES_0 then
                v51.isGlob = true;
                v40 = v51.isGlob;
                if v30 == true then
                    while (v29 <= v35) ~= true do
                        local l_toJSBoolean_3 = l_Boolean_0.toJSBoolean;
                        v49 = v50;
                        v35 = v35 + 1;
                        v50 = l_String_0.charCodeAt(l_v26_0, v35);
                        if l_toJSBoolean_3(v50) then
                            if v50 == l_CHAR_LEFT_PARENTHESES_0 then
                                v51.backslashes = true;
                                v44 = v51.backslashes;
                                v49 = v50;
                                v35 = v35 + 1;
                                v50 = l_String_0.charCodeAt(l_v26_0, v35);
                            elseif v50 == l_CHAR_RIGHT_PARENTHESES_0 then
                                v47 = true;
                                break;
                            end;
                        else
                            break;
                        end;
                    end;
                    --[[ close >= 29 ]]
                else
                    --[[ close >= 29 ]]
                    break;
                end;
            elseif v40 == true then
                v47 = true;
                if v30 == true then
                    --[[ close >= 29 ]]
                else
                    --[[ close >= 29 ]]
                    break;
                end;
            else
                --[[ close >= 29 ]]
            end;
        end;
    end;
    if v28.noext == true then
        v41 = false;
        v40 = false;
    end;
    local l_l_v26_0_0 = l_v26_0;
    local v62 = "";
    local v63 = "";
    if v36 > 1 then
        v62 = l_String_0.slice(l_v26_0, 1, v36);
        l_v26_0 = l_String_0.slice(l_v26_0, v36);
        v37 = v37 - v36;
    end;
    if (l_Boolean_0.toJSBoolean(l_l_v26_0_0) and v40 == true) and v37 > 1 then
        l_l_v26_0_0 = l_String_0.slice(l_v26_0, 1, v37);
        v63 = l_String_0.slice(l_v26_0, v37);
    elseif v40 == true then
        l_l_v26_0_0 = "";
        v63 = l_v26_0;
    else
        l_l_v26_0_0 = l_v26_0;
    end;
    if ((l_Boolean_0.toJSBoolean(l_l_v26_0_0) and l_l_v26_0_0 ~= "") and l_l_v26_0_0 ~= "/") and l_l_v26_0_0 ~= l_v26_0 then
        local v64 = l_String_0.charCodeAt(l_l_v26_0_0, #l_l_v26_0_0);
        local v65 = true;
        if v64 ~= l_CHAR_FORWARD_SLASH_0 then
            v65 = v64 == l_CHAR_BACKWARD_SLASH_0;
        end;
        if v65 then
            l_l_v26_0_0 = l_String_0.slice(l_l_v26_0_0, 1, -1);
        end;
    end;
    if v28.unescape == true then
        if l_Boolean_0.toJSBoolean(v63) then
            v63 = v4.removeBackslashes(v63);
        end;
        if l_Boolean_0.toJSBoolean(l_l_v26_0_0) and v44 == true then
            l_l_v26_0_0 = v4.removeBackslashes(l_l_v26_0_0);
        end;
    end;
    local v66 = {
        prefix = v62, 
        input = v26, 
        start = v36, 
        base = l_l_v26_0_0, 
        glob = v63, 
        isBrace = v38, 
        isBracket = v39, 
        isGlob = v40, 
        isExtglob = v41, 
        isGlobstar = v42, 
        negated = v45, 
        negatedExtglob = v46
    };
    if v28.tokens == true then
        v66.maxDepth = 0;
        local l_v50_0 = v50;
        local v68 = true;
        if l_v50_0 ~= l_CHAR_FORWARD_SLASH_0 then
            v68 = l_v50_0 == l_CHAR_BACKWARD_SLASH_0;
        end;
        if not v68 then
            table.insert(v32, v51);
        end;
        v66.tokens = v32;
    end;
    if not (v28.parts ~= true) or v28.tokens == true then
        local v69 = nil;
        for v70 = 1, #v31 do
            local v71 = if not l_Boolean_0.toJSBoolean(v69) then v36 else v69 + 1;
            local v72 = v31[v70];
            local v73 = l_String_0.slice(v26, v71, v72);
            if l_Boolean_0.toJSBoolean(v28.tokens) then
                if v70 == 1 and v36 ~= 1 then
                    v32[v70].isPrefix = true;
                    v32[v70].value = v62;
                else
                    v32[v70].value = v73;
                end;
                local v74 = v32[v70];
                if v74.isPrefix ~= true then
                    v74.depth = not l_Boolean_0.toJSBoolean(v74.isGlobstar) and 1 or math.huge;
                end;
                v66.maxDepth = v66.maxDepth + v32[v70].depth;
            end;
            if not (v70 == 1) or v73 ~= "" then
                table.insert(v33, v73);
            end;
            v69 = v72;
        end;
        if l_Boolean_0.toJSBoolean(v69) and v69 + 1 < #v26 then
            local v75 = l_String_0.slice(v26, v69 + 1);
            table.insert(v33, v75);
            if l_Boolean_0.toJSBoolean(v28.tokens) then
                v32[#v32].value = v75;
                local v76 = v32[#v32];
                if v76.isPrefix ~= true then
                    v76.depth = not l_Boolean_0.toJSBoolean(v76.isGlobstar) and 1 or math.huge;
                end;
                v66.maxDepth = v66.maxDepth + v32[#v32].depth;
            end;
        end;
        v66.slashes = v31;
        v66.parts = v33;
    end;
    return v66;
end;
