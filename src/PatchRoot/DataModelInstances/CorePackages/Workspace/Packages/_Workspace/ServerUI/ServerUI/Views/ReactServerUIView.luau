local l_script_FirstAncestor_0 = script:FindFirstAncestor("ServerUI");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Cryo);
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local v5 = require(l_script_FirstAncestor_0.Components.UIConfiguration);
local _ = require(l_script_FirstAncestor_0.Types);
local l_useState_0 = v2.useState;
local v8 = require(l_script_FirstAncestor_0.Constants);
local v9 = require(l_script_FirstAncestor_0.Navigation.Hooks.useNavigator);
local v10 = {
    maxRetryCount = 1, 
    enableLogging = false
};
local v30 = v2.forwardRef(function(v11, v12)
    local v13 = v11.defaultTemplateName or v8.DEFAULT_TEMPLATE_NAME;
    local l_uiDefinition_0 = v11.uiDefinition;
    local v15 = v9();
    local v16 = not not v15.currentRoute and v15.currentRoute.templateName or v13;
    v2.useEffect(function()
        if l_uiDefinition_0 then
            local v17 = l_uiDefinition_0.templates[v16];
            v15.reset(v17.children, {}, v17.name);
        end;
    end, {
        l_uiDefinition_0
    });
    local function v20(v18)
        local l_props_0 = v18.props;
        if v11.mapComponentPropsFromState then
            l_props_0 = v3.Dictionary.join(l_props_0, v11.mapComponentPropsFromState(v18));
        end;
        if not (not v15.currentRoute or not v15.currentRoute.params) and #v3.Dictionary.keys(v15.currentRoute.params) > 0 then
            l_props_0 = v3.Dictionary.join(l_props_0, {
                params = v15.currentRoute.params
            });
        end;
        return v2.createElement(v18.component, l_props_0, v18.children);
    end;
    local function v28(v21, v22)
        local v23 = {};
        if not (not v15.currentRoute or not v15.currentRoute.componentRefs) then
            for _, v25 in ipairs(v15.currentRoute.componentRefs) do
                local v26 = v22.components[v25];
                if v26 then
                    local v27 = v20(v26);
                    if v27 then
                        v23[v26.name] = v27;
                    end;
                end;
            end;
        end;
        v21.props = v3.Dictionary.join({
            ref = v12
        }, v21.props or {});
        return v2.createElement(v21.component, v21.props, v23);
    end;
    local v29 = l_uiDefinition_0 and l_uiDefinition_0.templates[not not v15.currentRoute and v15.currentRoute.templateName or v13];
    return not not v29 and v28(v29, l_uiDefinition_0) or nil;
end);
return (v2.forwardRef(function(v31, v32)
    local v33 = v31.uiConfigurationConfig or v10;
    local v34 = l_useDispatch_0();
    local v35, v36 = l_useState_0(nil);
    v2.useEffect(function()
        v34(v5.new(v33):fetch(v31.url, v31.queryArgs)):andThen(function(v37)
            local l_responseBody_0 = v37.responseBody;
            local l_status_0, l_result_0 = pcall(function()
                return v31.transform(l_responseBody_0);
            end);
            if not l_status_0 or not l_result_0 then
                v31.onError({
                    type = v8.CONFIGURATION_VIEW_ERROR.RENDER_TRANSFORM_ERROR
                });
                return ;
            else
                v36(l_result_0);
                return ;
            end;
        end):catch(function()
            v31.onError({
                type = v8.CONFIGURATION_VIEW_ERROR.NETWORK_FETCH_ERROR
            });
        end);
    end, {});
    return v2.createElement(v30, {
        uiDefinition = v35, 
        defaultTemplateName = v31.defaultTemplateName, 
        mapComponentPropsFromState = v31.mapComponentPropsFromState, 
        ref = v32
    });
end));
