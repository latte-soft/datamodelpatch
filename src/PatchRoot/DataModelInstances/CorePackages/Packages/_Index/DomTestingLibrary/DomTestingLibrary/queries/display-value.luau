local l_Array_0 = require(script.Parent.Parent.Parent.LuauPolyfill).Array;
local l_querySelectorAll_0 = require(script.Parent.Parent.jsHelpers.querySelectors).querySelectorAll;
local v2 = {};
local l_wrapAllByQueryWithSuggestion_0 = require(script.Parent.Parent["query-helpers"]).wrapAllByQueryWithSuggestion;
local l_checkContainerType_0 = require(script.Parent.Parent.helpers).checkContainerType;
local _ = require(script.Parent.Parent.types);
local v6 = require(script.Parent["all-utils"]);
local _ = v6.getNodeText;
local l_matches_0 = v6.matches;
local l_fuzzyMatches_0 = v6.fuzzyMatches;
local l_makeNormalizer_0 = v6.makeNormalizer;
local l_buildQueries_0 = v6.buildQueries;
local v12 = nil;
v12 = function(v13, v14, v15)
    local v16 = if v15 == nil then {} else v15;
    local v17 = v16.exact == nil and true or v16.exact;
    local l_collapseWhitespace_0 = v16.collapseWhitespace;
    local l_trim_0 = v16.trim;
    local l_normalizer_0 = v16.normalizer;
    l_checkContainerType_0(v13);
    local v21 = if not v17 then l_fuzzyMatches_0 else l_matches_0;
    local v22 = l_makeNormalizer_0({
        collapseWhitespace = l_collapseWhitespace_0, 
        trim = l_trim_0, 
        normalizer = l_normalizer_0
    });
    return l_Array_0.filter(l_querySelectorAll_0(v13, {
        "TextBox"
    }), function(v23)
        return v21(v23.Text, v23, v14, v22);
    end);
end;
local v24 = nil;
v24 = function(_, v26)
    return ("Found multiple elements with the display value: %s."):format((tostring(v26)));
end;
local v27 = nil;
v27 = function(_, v29)
    return ("Unable to find an element with the display value: %s."):format((tostring(v29)));
end;
local v30 = l_wrapAllByQueryWithSuggestion_0(v12, debug.info(v12, "n"), "queryAll");
local v31, v32, v33, v34, v35 = l_buildQueries_0(v12, v24, v27);
v2.queryByDisplayValue = v31;
v2.queryAllByDisplayValue = v30;
v2.getByDisplayValue = v33;
v2.getAllByDisplayValue = v32;
v2.findAllByDisplayValue = v34;
v2.findByDisplayValue = v35;
return v2;
