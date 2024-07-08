local l_Dash_0 = require(script:FindFirstAncestor("Profile").dependencies).Dash;
local v1 = {
    TimmyTwoTests = "1906324463", 
    RadioNoggin = "1672130865", 
    KillerRoomba = "1820084975"
};
return {
    controls = {
        userName = l_Dash_0.keys(v1)
    }, 
    getUserId = function(v2)
        return v1[v2.controls.userName];
    end
};
