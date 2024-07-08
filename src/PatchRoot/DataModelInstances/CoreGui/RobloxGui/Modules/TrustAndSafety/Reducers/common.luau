local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Cryo);
return require(l_CorePackages_0.Rodux).createReducer({
    toastTitle = nil, 
    toastSubtitle = nil
}, {
    [require(script.Parent.Parent.Actions.ShowToast).name] = function(v2, v3)
        return v1.Dictionary.join(v2, {
            toastTitle = v3.toastTitle, 
            toastSubtitle = v3.toastSubtitle
        });
    end
});
