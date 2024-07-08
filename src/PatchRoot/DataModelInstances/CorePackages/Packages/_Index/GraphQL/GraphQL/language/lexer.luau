local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.Parent.LuauPolyfill);
local l_Number_0 = v2.Number;
local l_String_0 = v2.String;
local l_isNaN_0 = l_Number_0.isNaN;
local l_HttpService_0 = game:GetService("HttpService");
local l_syntaxError_0 = require(l_Parent_1.error.syntaxError).syntaxError;
local _ = require(script.Parent.source);
local v9 = require(l_Parent_0.tokenKind);
local l_Token_0 = require(l_Parent_0.ast).Token;
local l_TokenKind_0 = v9.TokenKind;
local v12 = require(l_Parent_1.luaUtils.toUnicodeString);
local l_dedentBlockStringValue_0 = require(l_Parent_0.blockString).dedentBlockStringValue;
local v14 = nil;
local v15 = nil;
local v16 = nil;
local v17 = nil;
v16 = function(v18, v19, v20, v21)
    local v22 = v17(v18);
    local v23 = v17(v19);
    local v24 = v17(v20);
    local v25 = v17(v21);
    if not ((v22 >= 0 and v23 >= 0) and v24 >= 0) or v25 < 0 then
        return -1;
    else
        return (bit32.bor(bit32.lshift(v22, 12), bit32.lshift(v23, 8), bit32.lshift(v24, 4), v25));
    end;
end;
v17 = function(v26)
    if v26 >= 48 and v26 <= 57 then
        return v26 - 48;
    elseif v26 >= 65 and v26 <= 70 then
        return v26 - 55;
    elseif v26 >= 97 and v26 <= 102 then
        return v26 - 87;
    else
        return -1;
    end;
end;
local function v48(v27, v28, v29, v30, v31)
    local l_body_0 = v27.body;
    local v33 = string.len(l_body_0);
    local v34 = v28 + 1;
    local v35 = 0;
    local function _()
        return v34 ~= v33 + 1;
    end;
    local function _()
        v35 = l_String_0.charCodeAt(l_body_0, v34);
        return not l_isNaN_0(v35);
    end;
    local function _()
        return v35 == 95;
    end;
    local function _()
        local v39 = false;
        if v35 >= 48 then
            v39 = v35 <= 57;
        end;
        return v39;
    end;
    local function _()
        local v41 = false;
        if v35 >= 65 then
            v41 = v35 <= 90;
        end;
        return v41;
    end;
    local function _()
        local v43 = false;
        if v35 >= 97 then
            v43 = v35 <= 122;
        end;
        return v43;
    end;
    local function _()
        local v45 = v35 == 95;
        if not v45 then
            v45 = false;
            if v35 >= 48 then
                v45 = v35 <= 57;
            end;
            if not v45 then
                v45 = false;
                if v35 >= 65 then
                    v45 = v35 <= 90;
                end;
                if not v45 then
                    v45 = false;
                    if v35 >= 97 then
                        v45 = v35 <= 122;
                    end;
                end;
            end;
        end;
        return v45;
    end;
    while v34 ~= v33 + 1 do
        v35 = l_String_0.charCodeAt(l_body_0, v34);
        if not l_isNaN_0(v35) then
            local v47 = v35 == 95;
            if not v47 then
                v47 = false;
                if v35 >= 48 then
                    v47 = v35 <= 57;
                end;
                if not v47 then
                    v47 = false;
                    if v35 >= 65 then
                        v47 = v35 <= 90;
                    end;
                    if not v47 then
                        v47 = false;
                        if v35 >= 97 then
                            v47 = v35 <= 122;
                        end;
                    end;
                end;
            end;
            if v47 then
                v34 = v34 + 1;
            else
                break;
            end;
        else
            break;
        end;
    end;
    return l_Token_0.new(l_TokenKind_0.NAME, v28, v34, v29, v30, v31, l_String_0.slice(l_body_0, v28, v34));
end;
local function v57(v49, v50, v51, v52, v53)
    local l_body_1 = v49.body;
    local v55 = nil;
    local l_v50_0 = v50;
    while true do
        l_v50_0 = l_v50_0 + 1;
        v55 = l_String_0.charCodeAt(l_body_1, l_v50_0);
        if not (not l_isNaN_0(v55) and (not (v55 <= 31) or v55 == 9)) then
            break;
        end;
    end;
    return l_Token_0.new(l_TokenKind_0.COMMENT, v50, l_v50_0, v51, v52, v53, l_String_0.slice(l_body_1, v50 + 1, l_v50_0));
end;
printCharCode = function(v58)
    if not l_isNaN_0(v58) then
        if v58 < 127 then
            return l_HttpService_0:JSONEncode((string.char(v58)));
        else
            return v12(v58);
        end;
    else
        return l_TokenKind_0.EOF;
    end;
end;
readDigits = function(v59, v60, v61)
    local l_body_2 = v59.body;
    local l_v60_0 = v60;
    local l_v61_0 = v61;
    if l_v61_0 >= 48 and l_v61_0 <= 57 then
        while true do
            l_v60_0 = l_v60_0 + 1;
            l_v61_0 = l_String_0.charCodeAt(l_body_2, l_v60_0);
            if not (l_v61_0 >= 48 and l_v61_0 <= 57) then
                break;
            end;
        end;
        return l_v60_0;
    else
        error(l_syntaxError_0(v59, l_v60_0, "Invalid number, expected digit but got: " .. printCharCode(l_v61_0) .. "."));
        return ;
    end;
end;
unexpectedCharacterMessage = function(v65)
    if ((v65 < 32 and v65 ~= 9) and v65 ~= 10) and v65 ~= 13 then
        return "Cannot contain the invalid character " .. printCharCode(v65) .. ".";
    elseif v65 == 39 then
        return "Unexpected single quote character ('), did you mean to use a double quote (\")?";
    else
        return "Cannot parse the unexpected character " .. printCharCode(v65) .. ".";
    end;
end;
isNameStart = function(v66)
    local v67 = v66 == 95;
    local v68 = false;
    if v66 >= 65 then
        v68 = v66 <= 90;
    end;
    local v69 = false;
    if v66 >= 97 then
        v69 = v66 <= 122;
    end;
    return (v67 or v68) or v69;
end;
readNumber = function(v70, v71, v72, v73, v74, v75)
    local l_body_3 = v70.body;
    local l_v72_0 = v72;
    local l_v71_0 = v71;
    local v79 = false;
    if l_v72_0 == 45 then
        l_v71_0 = l_v71_0 + 1;
        l_v72_0 = l_String_0.charCodeAt(l_body_3, l_v71_0);
    end;
    if l_v72_0 == 48 then
        l_v71_0 = l_v71_0 + 1;
        l_v72_0 = l_String_0.charCodeAt(l_body_3, l_v71_0);
        if l_v72_0 >= 48 and l_v72_0 <= 57 then
            error(l_syntaxError_0(v70, l_v71_0, "Invalid number, unexpected digit after 0: " .. printCharCode(l_v72_0) .. "."));
        end;
    else
        l_v71_0 = readDigits(v70, l_v71_0, l_v72_0);
        l_v72_0 = l_String_0.charCodeAt(l_body_3, l_v71_0);
    end;
    if l_v72_0 == 46 then
        v79 = true;
        l_v71_0 = l_v71_0 + 1;
        l_v71_0 = readDigits(v70, l_v71_0, (l_String_0.charCodeAt(l_body_3, l_v71_0)));
        l_v72_0 = l_String_0.charCodeAt(l_body_3, l_v71_0);
    end;
    if not (l_v72_0 ~= 69) or l_v72_0 == 101 then
        v79 = true;
        l_v71_0 = l_v71_0 + 1;
        l_v72_0 = l_String_0.charCodeAt(l_body_3, l_v71_0);
        if not (l_v72_0 ~= 43) or l_v72_0 == 45 then
            l_v71_0 = l_v71_0 + 1;
            l_v72_0 = l_String_0.charCodeAt(l_body_3, l_v71_0);
        end;
        l_v71_0 = readDigits(v70, l_v71_0, l_v72_0);
        l_v72_0 = l_String_0.charCodeAt(l_body_3, l_v71_0);
    end;
    if not (l_v72_0 ~= 46 and not isNameStart(l_v72_0)) then
        error(l_syntaxError_0(v70, l_v71_0, "Invalid number, expected digit but got: " .. printCharCode(l_v72_0) .. "."));
    end;
    return l_Token_0.new(not not v79 and l_TokenKind_0.FLOAT or l_TokenKind_0.INT, v71, l_v71_0, v73, v74, v75, l_String_0.slice(l_body_3, v71, l_v71_0));
end;
local function v89(v80, v81)
    local l_source_0 = v80.source;
    local l_body_4 = l_source_0.body;
    local v84 = utf8.len(l_body_4);
    assert(v84 ~= nil, "invalid utf8 supplied for token");
    local l__end_0 = v81._end;
    while true do
        if l__end_0 <= v84 then
            local v86 = l_String_0.charCodeAt(l_body_4, l__end_0);
            local l_line_0 = v80.line;
            local v88 = l__end_0 - v80.lineStart;
            if not ((v86 ~= 65279 and v86 ~= 9) and v86 ~= 32) or v86 == 44 then
                l__end_0 = l__end_0 + 1;
            elseif v86 == 10 then
                l__end_0 = l__end_0 + 1;
                v80.line = v80.line + 1;
                v80.lineStart = l__end_0 - 1;
            elseif v86 == 13 then
                l__end_0 = if l_String_0.charCodeAt(l_body_4, l__end_0 + 1) == 10 then l__end_0 + 2 else l__end_0 + 1;
                v80.line = v80.line + 1;
                v80.lineStart = l__end_0 - 1;
            elseif v86 == 33 then
                return l_Token_0.new(l_TokenKind_0.BANG, l__end_0, l__end_0 + 1, l_line_0, v88, v81);
            elseif v86 == 35 then
                return v57(l_source_0, l__end_0, l_line_0, v88, v81);
            elseif v86 == 36 then
                return l_Token_0.new(l_TokenKind_0.DOLLAR, l__end_0, l__end_0 + 1, l_line_0, v88, v81);
            elseif v86 == 38 then
                return l_Token_0.new(l_TokenKind_0.AMP, l__end_0, l__end_0 + 1, l_line_0, v88, v81);
            elseif v86 == 40 then
                return l_Token_0.new(l_TokenKind_0.PAREN_L, l__end_0, l__end_0 + 1, l_line_0, v88, v81);
            elseif v86 == 41 then
                return l_Token_0.new(l_TokenKind_0.PAREN_R, l__end_0, l__end_0 + 1, l_line_0, v88, v81);
            else
                if v86 == 46 then
                    if l_String_0.charCodeAt(l_body_4, l__end_0 + 1) == 46 and l_String_0.charCodeAt(l_body_4, l__end_0 + 2) == 46 then
                        return l_Token_0.new(l_TokenKind_0.SPREAD, l__end_0, l__end_0 + 3, l_line_0, v88, v81);
                    end;
                elseif v86 == 58 then
                    return l_Token_0.new(l_TokenKind_0.COLON, l__end_0, l__end_0 + 1, l_line_0, v88, v81);
                elseif v86 == 61 then
                    return l_Token_0.new(l_TokenKind_0.EQUALS, l__end_0, l__end_0 + 1, l_line_0, v88, v81);
                elseif v86 == 64 then
                    return l_Token_0.new(l_TokenKind_0.AT, l__end_0, l__end_0 + 1, l_line_0, v88, v81);
                elseif v86 == 91 then
                    return l_Token_0.new(l_TokenKind_0.BRACKET_L, l__end_0, l__end_0 + 1, l_line_0, v88, v81);
                elseif v86 == 93 then
                    return l_Token_0.new(l_TokenKind_0.BRACKET_R, l__end_0, l__end_0 + 1, l_line_0, v88, v81);
                elseif v86 == 123 then
                    return l_Token_0.new(l_TokenKind_0.BRACE_L, l__end_0, l__end_0 + 1, l_line_0, v88, v81);
                elseif v86 == 124 then
                    return l_Token_0.new(l_TokenKind_0.PIPE, l__end_0, l__end_0 + 1, l_line_0, v88, v81);
                elseif v86 == 125 then
                    return l_Token_0.new(l_TokenKind_0.BRACE_R, l__end_0, l__end_0 + 1, l_line_0, v88, v81);
                elseif v86 == 34 then
                    if l_String_0.charCodeAt(l_body_4, l__end_0 + 1) == 34 and l_String_0.charCodeAt(l_body_4, l__end_0 + 2) == 34 then
                        return v14(l_source_0, l__end_0, l_line_0, v88, v81, v80);
                    else
                        return v15(l_source_0, l__end_0, l_line_0, v88, v81);
                    end;
                elseif not (((((((((v86 ~= 45 and v86 ~= 48) and v86 ~= 49) and v86 ~= 50) and v86 ~= 51) and v86 ~= 52) and v86 ~= 53) and v86 ~= 54) and v86 ~= 55) and v86 ~= 56) or v86 == 57 then
                    return readNumber(l_source_0, l__end_0, v86, l_line_0, v88, v81);
                elseif not (((((((((((((((((((((((((((((((((((((((((((((((((((v86 ~= 65 and v86 ~= 66) and v86 ~= 67) and v86 ~= 68) and v86 ~= 69) and v86 ~= 70) and v86 ~= 71) and v86 ~= 72) and v86 ~= 73) and v86 ~= 74) and v86 ~= 75) and v86 ~= 76) and v86 ~= 77) and v86 ~= 78) and v86 ~= 79) and v86 ~= 80) and v86 ~= 81) and v86 ~= 82) and v86 ~= 83) and v86 ~= 84) and v86 ~= 85) and v86 ~= 86) and v86 ~= 87) and v86 ~= 88) and v86 ~= 89) and v86 ~= 90) and v86 ~= 95) and v86 ~= 97) and v86 ~= 98) and v86 ~= 99) and v86 ~= 100) and v86 ~= 101) and v86 ~= 102) and v86 ~= 103) and v86 ~= 104) and v86 ~= 105) and v86 ~= 106) and v86 ~= 107) and v86 ~= 108) and v86 ~= 109) and v86 ~= 110) and v86 ~= 111) and v86 ~= 112) and v86 ~= 113) and v86 ~= 114) and v86 ~= 115) and v86 ~= 116) and v86 ~= 117) and v86 ~= 118) and v86 ~= 119) and v86 ~= 120) and v86 ~= 121) or v86 == 122 then
                    return v48(l_source_0, l__end_0, l_line_0, v88, v81);
                end;
                error(l_syntaxError_0(l_source_0, l__end_0, unexpectedCharacterMessage(v86)));
            end;
        else
            return l_Token_0.new(l_TokenKind_0.EOF, v84 + 1, v84 + 1, v80.line, l__end_0 - v80.lineStart, v81);
        end;
    end;
end;
local v90 = {};
v90.__index = v90;
v90.new = function(v91)
    local v92 = l_Token_0.new(l_TokenKind_0.SOF, 1, 1, 0, 0, nil);
    return (setmetatable({
        source = v91, 
        lastToken = v92, 
        token = v92, 
        line = 1, 
        lineStart = 0
    }, v90));
end;
v90.advance = function(v93)
    v93.lastToken = v93.token;
    v93.token = v93:lookahead();
    return v93.token;
end;
v90.lookahead = function(v94)
    local l_token_0 = v94.token;
    if l_token_0.kind ~= l_TokenKind_0.EOF then
        while true do
            if not l_token_0.next then
                local v96 = v89(v94, l_token_0);
                l_token_0.next = v96;
                v96.prev = l_token_0;
                l_token_0 = v96;
            else
                l_token_0 = l_token_0.next;
            end;
            if not (l_token_0.kind == l_TokenKind_0.COMMENT) then
                break;
            end;
        end;
    end;
    return l_token_0;
end;
local function v99(v97)
    local v98 = true;
    if v97 ~= l_TokenKind_0.BANG then
        v98 = true;
        if v97 ~= l_TokenKind_0.DOLLAR then
            v98 = true;
            if v97 ~= l_TokenKind_0.AMP then
                v98 = true;
                if v97 ~= l_TokenKind_0.PAREN_L then
                    v98 = true;
                    if v97 ~= l_TokenKind_0.PAREN_R then
                        v98 = true;
                        if v97 ~= l_TokenKind_0.SPREAD then
                            v98 = true;
                            if v97 ~= l_TokenKind_0.COLON then
                                v98 = true;
                                if v97 ~= l_TokenKind_0.EQUALS then
                                    v98 = true;
                                    if v97 ~= l_TokenKind_0.AT then
                                        v98 = true;
                                        if v97 ~= l_TokenKind_0.BRACKET_L then
                                            v98 = true;
                                            if v97 ~= l_TokenKind_0.BRACKET_R then
                                                v98 = true;
                                                if v97 ~= l_TokenKind_0.BRACE_L then
                                                    v98 = true;
                                                    if v97 ~= l_TokenKind_0.PIPE then
                                                        v98 = v97 == l_TokenKind_0.BRACE_R;
                                                    end;
                                                end;
                                            end;
                                        end;
                                    end;
                                end;
                            end;
                        end;
                    end;
                end;
            end;
        end;
    end;
    return v98;
end;
v14 = function(v100, v101, v102, v103, v104, v105)
    local l_body_5 = v100.body;
    local v107 = v101 + 3;
    local l_v107_0 = v107;
    local v109 = 0;
    local v110 = "";
    while true do
        if not (v107 <= string.len(l_body_5)) or l_isNaN_0(l_String_0.charCodeAt(l_body_5, v107)) then
            error(l_syntaxError_0(v100, v107, "Unterminated string."));
            return ;
        else
            v109 = l_String_0.charCodeAt(l_body_5, v107);
            if (v109 == 34 and l_String_0.charCodeAt(l_body_5, v107 + 1) == 34) and l_String_0.charCodeAt(l_body_5, v107 + 2) == 34 then
                return l_Token_0.new(l_TokenKind_0.BLOCK_STRING, v101, v107 + 3, v102, v103, v104, l_dedentBlockStringValue_0(v110 .. l_String_0.slice(l_body_5, l_v107_0, v107)));
            else
                if ((v109 < 32 and v109 ~= 9) and v109 ~= 10) and v109 ~= 13 then
                    error(l_syntaxError_0(v100, v107, "Invalid character within String: " .. printCharCode(v109) .. "."));
                end;
                if v109 == 10 then
                    v107 = v107 + 1;
                    v105.line = v105.line + 1;
                    v105.lineStart = v107 - 1;
                elseif v109 == 13 then
                    v107 = if l_String_0.charCodeAt(l_body_5, v107 + 1) == 10 then v107 + 2 else v107 + 1;
                    v105.line = v105.line + 1;
                    v105.lineStart = v107 - 1;
                elseif ((v109 == 92 and l_String_0.charCodeAt(l_body_5, v107 + 1) == 34) and l_String_0.charCodeAt(l_body_5, v107 + 2) == 34) and l_String_0.charCodeAt(l_body_5, v107 + 3) == 34 then
                    v110 = v110 .. l_String_0.slice(l_body_5, l_v107_0, v107) .. "\"\"\"";
                    v107 = v107 + 4;
                    l_v107_0 = v107;
                else
                    v107 = v107 + 1;
                end;
            end;
        end;
    end;
end;
v15 = function(v111, v112, v113, v114, v115)
    local l_body_6 = v111.body;
    local v117 = utf8.len(l_body_6);
    assert(v117 ~= nil, "invalid utf8 sequence detected");
    local v118 = v112 + 1;
    local l_v118_0 = v118;
    local v120 = "";
    while v118 <= v117 do
        local v121 = l_String_0.charCodeAt(l_body_6, v118);
        if l_isNaN_0(v121) then
            break;
        elseif v121 == 34 then
            return l_Token_0.new(l_TokenKind_0.STRING, v112, v118 + 1, v113, v114, v115, v120 .. l_String_0.slice(l_body_6, l_v118_0, v118));
        elseif v121 ~= 10 and v121 ~= 13 then
            if v121 < 32 and v121 ~= 9 then
                error(l_syntaxError_0(v111, v118, "Invalid character within String: " .. printCharCode(v121) .. "."));
            end;
            v118 = v118 + 1;
            if v121 == 92 then
                v120 = v120 .. l_String_0.slice(l_body_6, l_v118_0, v118 - 1);
                v121 = l_String_0.charCodeAt(l_body_6, v118);
                if v121 == 34 then
                    v120 = v120 .. "\"";
                elseif v121 == 47 then
                    v120 = v120 .. "/";
                elseif v121 == 92 then
                    v120 = v120 .. "\\";
                elseif v121 == 98 then
                    v120 = v120 .. "\b";
                elseif v121 == 102 then
                    v120 = v120 .. "\f";
                elseif v121 == 110 then
                    v120 = v120 .. "\n";
                elseif v121 == 114 then
                    v120 = v120 .. "\r";
                elseif v121 == 116 then
                    v120 = v120 .. "\t";
                elseif v121 == 117 then
                    local v122 = v16(l_String_0.charCodeAt(l_body_6, v118 + 1), l_String_0.charCodeAt(l_body_6, v118 + 2), l_String_0.charCodeAt(l_body_6, v118 + 3), l_String_0.charCodeAt(l_body_6, v118 + 4));
                    if v122 < 0 then
                        error(l_syntaxError_0(v111, v118, "Invalid character escape sequence: \\u" .. l_String_0.slice(l_body_6, v118 + 1, v118 + 5) .. "."));
                    end;
                    v120 = v120 .. utf8.char(v122);
                    v118 = v118 + 4;
                else
                    error(l_syntaxError_0(v111, v118, "Invalid character escape sequence: \\" .. utf8.char(v121) .. "."));
                end;
                v118 = v118 + 1;
                l_v118_0 = v118;
            end;
        else
            break;
        end;
    end;
    error(l_syntaxError_0(v111, v118, "Unterminated string."));
end;
return {
    Lexer = v90, 
    isPunctuatorTokenKind = v99
};
