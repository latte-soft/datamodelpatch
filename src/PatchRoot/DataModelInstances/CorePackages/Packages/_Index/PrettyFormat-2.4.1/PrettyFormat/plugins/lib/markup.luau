local v0 = require(script.Parent.Parent.Parent.Parent.LuauPolyfill);
local l_Array_0 = v0.Array;
local l_Boolean_0 = v0.Boolean;
local v3 = {};
local _ = nil;
local _ = nil;
local v6 = nil;
local _ = nil;
local _ = nil;
local _ = nil;
local _ = require(script.Parent.Parent.Parent.Types);
local l_default_0 = require(script.Parent.escapeHTML).default;
local v12 = {
    comment = {
        close = "", 
        open = ""
    }, 
    content = {
        close = "", 
        open = ""
    }, 
    prop = {
        close = "", 
        open = ""
    }, 
    tag = {
        close = "", 
        open = ""
    }, 
    value = {
        close = "", 
        open = ""
    }
};
v3.printProps = function(v13, v14, v15, v16, v17, v18, v19)
    local v20 = v16 .. v15.indent;
    local v21 = v15.colors or v12;
    return l_Array_0.join(l_Array_0.map(v13, function(v22)
        local v23 = v14[v22];
        local v24 = v19(v23, v15, v20, v17, v18);
        if typeof(v23) ~= "string" then
            if string.find(v24, "\n") ~= nil then
                v24 = v15.spacingOuter .. v20 .. v24 .. v15.spacingOuter .. v16;
            end;
            v24 = "{" .. v24 .. "}";
        end;
        return v15.spacingInner .. v16 .. v21.prop.open .. v21.prop.open .. if typeof(v22) == "table" then if v22.name then v22.name else v19(v22, v15, v20, v17, v18) else v22 .. v21.prop.close .. "=" .. v21.value.open .. v24 .. v21.value.close .. v21.value.close;
    end), "");
end;
v3.printChildren = function(v25, v26, v27, v28, v29, v30)
    return l_Array_0.join(l_Array_0.map(v25, function(v31)
        return v26.spacingOuter .. v27 .. if typeof(v31) == "string" then v6(v31, v26) else v30(v31, v26, v27, v28, v29);
    end), "");
end;
v6 = function(v32, v33)
    local l_content_0 = (v33.colors or v12).content;
    return l_content_0.open .. l_default_0(v32) .. l_content_0.close;
end;
v3.printText = v6;
v3.printComment = function(v35, v36)
    local l_comment_0 = (v36.colors or v12).comment;
    return l_comment_0.open .. "<--" .. l_default_0(v35) .. "-->" .. l_comment_0.close;
end;
v3.printElement = function(v38, v39, v40, v41, v42)
    local l_tag_0 = (v41.colors or v12).tag;
    return l_tag_0.open .. "<" .. v38 .. if not l_Boolean_0.toJSBoolean(v39) then v39 else l_tag_0.close .. v39 .. v41.spacingOuter .. v42 .. l_tag_0.open .. if not l_Boolean_0.toJSBoolean(v40) then ((not l_Boolean_0.toJSBoolean(v39) or l_Boolean_0.toJSBoolean(v41.min)) and " " or "") .. "/" else ">" .. l_tag_0.close .. v40 .. v41.spacingOuter .. v42 .. l_tag_0.open .. "</" .. v38 .. ">" .. l_tag_0.close;
end;
v3.printElementAsLeaf = function(v44, v45)
    local l_tag_1 = (v45.colors or v12).tag;
    return l_tag_1.open .. "<" .. v44 .. l_tag_1.close .. " \226\128\166" .. l_tag_1.open .. " />" .. l_tag_1.close;
end;
return v3;
