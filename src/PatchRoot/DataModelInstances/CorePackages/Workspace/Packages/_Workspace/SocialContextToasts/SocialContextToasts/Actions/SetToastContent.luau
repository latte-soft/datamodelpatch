local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialContextToasts");
local v1 = require(l_script_FirstAncestor_0.Parent.Rodux);
local _ = require(l_script_FirstAncestor_0.ToastRoot);
return v1.makeActionCreator(script.Name, function(v3)
    return {
        toastContent = v3
    };
end);
