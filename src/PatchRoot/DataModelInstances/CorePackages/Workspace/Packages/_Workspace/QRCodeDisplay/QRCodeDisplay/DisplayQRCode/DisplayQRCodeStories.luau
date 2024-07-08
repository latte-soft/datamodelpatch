local l_script_FirstAncestor_0 = script:FindFirstAncestor("QRCodeDisplay");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(script.Parent.DisplayQRCode);
local v3 = require(l_Parent_0.React);
local v4 = require(l_script_FirstAncestor_0.Common.ECLevels);
return {
    SimpleMatrix = function()
        return v3.createElement(v2, {
            ecLevel = v4.EC_LEVEL_1, 
            sideLength = 100, 
            toEncode = "https://www.bbc.com/news"
        });
    end, 
    LoadingMatrix = function()
        return v3.createElement(v2, {
            ecLevel = v4.EC_LEVEL_1, 
            isLoading = true, 
            sideLength = 200, 
            toEncode = ""
        });
    end, 
    SuperComplexMatrix = function()
        return v3.createElement(v2, {
            ecLevel = v4.EC_LEVEL_4, 
            sideLength = 400, 
            toEncode = "https://ro.blox.com/Ebh5?pid=share&is_retargeting=true&af_dp=roblox%3A%2F%2Fnavigation%2Fshare_links%3Fcode%3D6e5de960f12ec44797d1d974c76605ff%26type%3DFriendInvite&af_web_dp=https%3A%2F%2Fwww.roblox.com%2Fshare-links%3Fcode%3D6e5de960f12ec44797d1d974c76605ff%26type%3DFriendInvite"
        });
    end
};
