local l_script_FirstAncestor_0 = script:FindFirstAncestor("RoduxShareLinks");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Cryo);
local v3 = require(l_Parent_0.Rodux);
local l_Actions_0 = l_script_FirstAncestor_0.Actions;
local v5 = require(l_Actions_0.SetShareInviteLink);
local v6 = require(l_Actions_0.ClearShareInviteLink);
local v7 = {};
return function(v8)
    return v3.createReducer(v7, {
        [v8.shareLinksNetworking.GenerateLink.Succeeded.name] = function(v9, v10)
            return v2.Dictionary.join(v9, {
                ShareInviteLink = v10.responseBody
            });
        end, 
        [v5.name] = function(v11, v12)
            return v2.Dictionary.join(v11, {
                ShareInviteLink = v12.shareInviteLink
            });
        end, 
        [v6.name] = function(v13, _)
            return v2.Dictionary.join(v13, {
                ShareInviteLink = v2.None
            });
        end
    });
end;
