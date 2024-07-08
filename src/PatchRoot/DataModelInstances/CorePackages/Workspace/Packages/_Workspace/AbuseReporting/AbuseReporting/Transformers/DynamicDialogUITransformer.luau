local l_Parent_0 = script:FindFirstAncestor("AbuseReporting").Parent;
local v1 = require(l_Parent_0.ServerUI);
local v2 = require(l_Parent_0.Cryo);
local l_Constants_0 = v1.Constants;
local v4 = {};
v4.__index = v4;
v4.new = function(v5)
    local v6 = {
        templateMap = v5.templateMap, 
        componentMap = v5.componentMap, 
        defaultTemplateName = v5.defaultTemplateName or l_Constants_0.DEFAULT_TEMPLATE_NAME
    };
    setmetatable(v6, v4);
    return v6;
end;
v4.transform = function(v7, v8)
    local v9 = {
        name = not not v7.templateMap[v7.defaultTemplateName] and v7.templateMap[v7.defaultTemplateName].name or v7.defaultTemplateName, 
        component = v7.templateMap[v7.defaultTemplateName].component, 
        props = {}, 
        children = {}
    };
    local v10 = {
        templates = {
            [v9.name] = v9
        }, 
        components = {}
    };
    if not (not v8.dialog or not v8.dialog.componentRefs) then
        for _, v12 in ipairs(v8.dialog.componentRefs) do
            if v7.componentMap[v12] then
                table.insert(v9.children, v12);
            end;
        end;
    end;
    if v8.components then
        if v8.components.title then
            v9.props.title = v8.components.title.text;
        end;
        if v8.components.subtitle then
            v9.props.subtitle = v8.components.subtitle.text;
        end;
        if v8.components.artifacts then
            v9.props.artifacts = v8.components.artifacts;
        end;
        for v13, v14 in v7.componentMap, nil, nil do
            local v15 = v8.components[v13];
            if v15 then
                local v16 = v14.name or v13;
                v10.components[v16] = {
                    name = v16, 
                    component = v14.component, 
                    props = v2.Dictionary.join({
                        params = v15
                    }, v14.props or {})
                };
            end;
        end;
    end;
    return v10;
end;
return v4;
