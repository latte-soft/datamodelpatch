local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Cryo);
return require(l_CorePackages_0.Rodux).createReducer({
    isOpen = false, 
    friend = {
        userId = nil, 
        combinedName = "", 
        userName = ""
    }
}, {
    [require(script.Parent.Parent.Actions.OpenOrUpdateCFM).name] = function(v2, v3)
        if not v3.friend or not v3.friend.combinedName then
            return {
                isOpen = false, 
                friend = {
                    userId = nil, 
                    combinedName = "", 
                    userName = ""
                }
            };
        else
            return v1.Dictionary.join(v2, {
                isOpen = true, 
                friend = v3.friend
            });
        end;
    end, 
    [require(script.Parent.Parent.Actions.CloseCFM).name] = function(_, _)
        return {
            isOpen = false, 
            friend = {
                userId = nil, 
                combinedName = "", 
                userName = ""
            }
        };
    end
});
