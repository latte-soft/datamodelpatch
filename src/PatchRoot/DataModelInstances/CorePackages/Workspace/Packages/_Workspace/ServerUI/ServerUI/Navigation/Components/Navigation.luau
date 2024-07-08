local l_script_FirstAncestor_0 = script:FindFirstAncestor("ServerUI");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Cryo);
local v4 = require(l_script_FirstAncestor_0.Navigation.NavigationContext);
return function(v5)
    local v6, v7 = v2.useState({});
    local v8 = v2.useMemo(function()
        return not not v6 and v6[#v6] or nil;
    end);
    return v2.createElement(v4.Provider, {
        value = {
            stack = v6, 
            setStack = v7, 
            currentRoute = v8, 
            reset = function(v9, v10, v11)
                v7({
                    {
                        componentRefs = v9, 
                        params = v10, 
                        templateName = v11
                    }
                });
            end, 
            push = function(v12, v13, v14)
                if not (not v14 and (not v8 or not v8.templateName)) then
                    v7(v3.List.join(v6, {
                        {
                            componentRefs = v12, 
                            params = v13, 
                            templateName = v14 or v8.templateName
                        }
                    }));
                end;
            end, 
            pushParams = function(v15)
                if v8 then
                    v7(v3.List.join(v6, {
                        {
                            componentRefs = v8.componentRefs, 
                            params = v15, 
                            templateName = v8.templateName
                        }
                    }));
                end;
            end
        }
    }, v5.children);
end;
