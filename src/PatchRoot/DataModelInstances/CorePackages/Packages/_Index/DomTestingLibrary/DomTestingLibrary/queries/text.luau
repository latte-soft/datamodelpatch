local l_Array_0 = require(script.Parent.Parent.Parent.LuauPolyfill).Array;
local v1 = require(script.Parent.Parent.jsHelpers.querySelectors);
local l_matches_0 = v1.matches;
local l_querySelectorAll_0 = v1.querySelectorAll;
local v4 = {};
local l_wrapAllByQueryWithSuggestion_0 = require(script.Parent.Parent["query-helpers"]).wrapAllByQueryWithSuggestion;
local l_checkContainerType_0 = require(script.Parent.Parent.helpers).checkContainerType;
local _ = require(script.Parent.Parent.types);
local v8 = require(script.Parent["all-utils"]);
local l_fuzzyMatches_0 = v8.fuzzyMatches;
local l_matches_1 = v8.matches;
local l_makeNormalizer_0 = v8.makeNormalizer;
local l_getNodeText_0 = v8.getNodeText;
local l_buildQueries_0 = v8.buildQueries;
local l_getConfig_0 = v8.getConfig;
local v15 = nil;
v15 = function(v16, v17, v18)
    local v19 = if v18 == nil then {} else v18;
    local v20 = if v19.selector == nil then {
        "."
    } else v19.selector;
    local v21 = v19.exact == nil and true or v19.exact;
    local l_collapseWhitespace_0 = v19.collapseWhitespace;
    local l_trim_0 = v19.trim;
    local v24 = if v19.ignore == nil then l_getConfig_0().defaultIgnore else v19.ignore;
    local l_normalizer_0 = v19.normalizer;
    l_checkContainerType_0(v16);
    local v26 = if not v21 then l_fuzzyMatches_0 else l_matches_1;
    local v27 = l_makeNormalizer_0({
        collapseWhitespace = l_collapseWhitespace_0, 
        trim = l_trim_0, 
        normalizer = l_normalizer_0
    });
    local v28 = {};
    if l_matches_0(v16, v20) then
        v28 = {
            v16
        };
    end;
    return l_Array_0.filter(l_Array_0.filter(l_Array_0.concat({}, v28, l_querySelectorAll_0(v16, v20)), function(v29)
        return not (#v24 > 0) or not l_matches_0(v29, v24);
    end), function(v30)
        return v26(l_getNodeText_0(v30), v30, v17, v27);
    end);
end;
local v31 = nil;
v31 = function(_, v33)
    return ("Found multiple elements with the text: %s"):format((tostring(v33)));
end;
local v34 = nil;
v34 = function(_, v36, v37)
    local v38 = if v37 == nil then {} else v37;
    local v39 = l_makeNormalizer_0({
        collapseWhitespace = v38.collapseWhitespace, 
        trim = v38.trim, 
        normalizer = v38.normalizer
    })((tostring(v36)));
    return ("Unable to find an element with the text: %s. This could be because the text is broken up by multiple elements. In this case, you can provide a function for your text matcher to make your matcher more flexible."):format((tostring(if not (v39 ~= tostring(v36)) then v36 else ("%s (normalized from '%s')"):format(v39, (tostring(v36))))));
end;
local v40 = l_wrapAllByQueryWithSuggestion_0(v15, debug.info(v15, "n"), "queryAll");
local v41, v42, v43, v44, v45 = l_buildQueries_0(v15, v31, v34);
v4.queryByText = v41;
v4.queryAllByText = v40;
v4.getByText = v43;
v4.getAllByText = v42;
v4.findAllByText = v44;
v4.findByText = v45;
return v4;
