local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(l_CorePackages_0.Cryo);
local v4 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
local v5 = require(l_Modules_0.AvatarExperience.Common.isComponent);
local _ = require(l_CorePackages_0.Packages.Dash);
local v7 = {
    forwardRef = true, 
    required = true
};
return function(v8, v9, v10, v11)
    v4.assert(v5(v8), "withContextValue must be called with a Roact component (stateful or functional)");
    v4.assert(v5(v9), "withContextValue must be called with a Roact component for contextConsumer");
    v4.isType(v10, "string", "withContextValue propName");
    local v12 = v3.Dictionary.join(v7, v11 or {});
    return function(v13)
        local v14 = v13[v10];
        return v2.createElement(v9, {
            render = function(v15)
                local v16 = v14 or v15;
                if v12.required then
                    v4.assert(v16, string.format("withContextValue can only be used within the context provider " .. "hierarchy. The wrapped component %q is unable to get " .. "access to %q from props or context.", tostring(v8), v10));
                end;
                return v2.createElement(v8, v3.Dictionary.join(v13, {
                    [v10] = v16, 
                    [v2.Ref] = not not v12.forwardRef and v13[v2.Ref] or nil
                }));
            end
        });
    end;
end;
