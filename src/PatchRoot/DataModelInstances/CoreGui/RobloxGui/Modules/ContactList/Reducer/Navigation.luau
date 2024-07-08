local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Cryo);
local v2 = require(l_CorePackages_0.Rodux);
local _ = require(script.Parent.Parent.Enums.Pages);
return v2.createReducer({
    currentPage = nil, 
    currentTag = ""
}, {
    [require(script.Parent.Parent.Actions.SetCurrentPage).name] = function(v4, v5)
        return v1.Dictionary.join(v4, {
            currentPage = if v5.page == nil then v1.None else v5.page
        });
    end, 
    [require(script.Parent.Parent.Actions.SetCurrentTag).name] = function(v6, v7)
        return v1.Dictionary.join(v6, {
            currentTag = v7.tag
        });
    end
});
