local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfileQRCode");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.Common.Constants);
local v3 = require(l_Parent_0.Dash);
local v4 = require(script.Parent.DefaultTestUserId);
local v5 = require(script.Parent.FirstFriendRequesterUserId);
local v6 = require(script.Parent.SecondFriendRequesterUserId);
return function(v7)
    return v3.join({
        LocalUserId = "123", 
        ScreenSize = Vector2.new(1000, 500), 
        [v2.RODUX_KEY] = {
            Users = {
                byUserId = {
                    [v4] = {
                        displayName = "bigMalc", 
                        username = "malcolmtucker"
                    }, 
                    [v5] = {
                        displayName = "Apollo", 
                        username = "captapollo"
                    }, 
                    [v6] = {
                        displayName = "Starbuck", 
                        username = "ltstarbuck"
                    }
                }
            }, 
            NetworkStatus = {}, 
            ShareUrl = {
                shortUrl = "www.bbc.co.uk", 
                linkId = "123456"
            }
        }
    }, v7);
end;
