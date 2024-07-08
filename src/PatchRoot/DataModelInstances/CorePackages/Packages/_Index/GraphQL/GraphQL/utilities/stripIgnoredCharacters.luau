local l_Parent_0 = script.Parent.Parent;
local l_language_0 = l_Parent_0.language;
local l_String_0 = require(l_Parent_0.Parent.LuauPolyfill).String;
local v3 = require(l_language_0.source);
local l_Source_0 = v3.Source;
local l_isSource_0 = v3.isSource;
local l_TokenKind_0 = require(l_language_0.tokenKind).TokenKind;
local v7 = require(l_language_0.lexer);
local l_Lexer_0 = v7.Lexer;
local l_isPunctuatorTokenKind_0 = v7.isPunctuatorTokenKind;
local v10 = require(l_language_0.blockString);
local l_dedentBlockStringValue_0 = v10.dedentBlockStringValue;
local l_getBlockStringIndentation_0 = v10.getBlockStringIndentation;
local v13 = nil;
local function v24(v14)
    local v15 = if not l_isSource_0(v14) then l_Source_0.new(v14) else v14;
    local l_body_0 = v15.body;
    local v17 = l_Lexer_0.new(v15);
    local v18 = "";
    local v19 = false;
    while v17:advance().kind ~= l_TokenKind_0.EOF do
        local l_token_0 = v17.token;
        local l_kind_0 = l_token_0.kind;
        local v22 = not l_isPunctuatorTokenKind_0(l_token_0.kind);
        if v19 and (v22 or l_token_0.kind == l_TokenKind_0.SPREAD) then
            v18 = v18 .. " ";
        end;
        local v23 = l_String_0.slice(l_body_0, l_token_0.start, l_token_0._end);
        v18 = if l_kind_0 == l_TokenKind_0.BLOCK_STRING then v18 .. v13(v23) else v18 .. v23;
        v19 = v22;
    end;
    return v18;
end;
v13 = function(v25)
    local v26 = l_dedentBlockStringValue_0((l_String_0.slice(v25, 4, -3)));
    if l_getBlockStringIndentation_0(v26) > 0 then
        v26 = "\n" .. v26;
    end;
    local v27 = utf8.len(v26);
    assert(v27 ~= nil, "invalid utf8 detected: " .. v26);
    local v28 = l_String_0.slice(v26, v27);
    local v29 = false;
    if v28 == "\"" then
        v29 = l_String_0.slice(v26, -4) ~= "\\\"\"\"";
    end;
    if v29 or v28 == "\\" then
        v26 = v26 .. "\n";
    end;
    return "\"\"\"" .. v26 .. "\"\"\"";
end;
return {
    stripIgnoredCharacters = v24
};
