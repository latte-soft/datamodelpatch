local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Cryo);
return require(l_CorePackages_0.Rodux).createReducer({
    isOpen = false, 
    title = "", 
    bodyText = "", 
    dismissCallback = nil
}, {
    [require(script.Parent.Parent.Actions.OpenOrUpdateDialog).name] = function(v2, v3)
        return v1.Dictionary.join(v2, {
            isOpen = true, 
            title = v3.title, 
            bodyText = v3.bodyText, 
            dismissCallback = v3.dismissCallback
        });
    end, 
    [require(script.Parent.Parent.Actions.CloseDialog).name] = function(v4, _)
        return v1.Dictionary.join(v4, {
            isOpen = false, 
            title = "", 
            bodyText = "", 
            dismissCallback = v1.None
        });
    end
});
