local l_Parent_0 = script:FindFirstAncestor("QRCodeDisplay").Parent;
local v1 = require(script.Parent.DisplayQRCodeFromMatrix);
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.QRCode);
return {
    SimpleMatrix = function()
        return v2.createElement(v1, {
            qrCodeMatrix = {
                {
                    1, 
                    0
                }, 
                {
                    1, 
                    0
                }
            }, 
            sideLength = 100
        });
    end, 
    ComplexMatrix = function()
        local _, v5 = v3.qrcode("https://www.bbc.com/news", 4);
        return v2.createElement(v1, {
            qrCodeMatrix = v5, 
            sideLength = 200
        });
    end, 
    SuperComplexMatrix = function()
        local _, v7 = v3.qrcode("https://ro.blox.com/Ebh5?pid=share&is_retargeting=true&af_dp=roblox%3A%2F%2Fnavigation%2Fshare_links%3Fcode%3D6e5de960f12ec44797d1d974c76605ff%26type%3DFriendInvite&af_web_dp=https%3A%2F%2Fwww.roblox.com%2Fshare-links%3Fcode%3D6e5de960f12ec44797d1d974c76605ff%26type%3DFriendInvite", 2);
        return v2.createElement(v1, {
            qrCodeMatrix = v7, 
            sideLength = 400
        });
    end, 
    CustomisedMatrix = function()
        local _, v9 = v3.qrcode("https://ro.blox.com/Ebh5?pid=share&is_retargeting=true&af_dp=roblox%3A%2F%2Fnavigation%2Fshare_links%3Fcode%3D6e5de960f12ec44797d1d974c76605ff%26type%3DFriendInvite&af_web_dp=https%3A%2F%2Fwww.roblox.com%2Fshare-links%3Fcode%3D6e5de960f12ec44797d1d974c76605ff%26type%3DFriendInvite", 4);
        return v2.createElement(v1, {
            qrCodeMatrix = v9, 
            sideLength = 200, 
            pixelColor3 = Color3.new(1, 0, 1), 
            backgroundColor3 = Color3.new(0, 1, 0)
        });
    end, 
    ReallySmallSideLength = function()
        local _, v11 = v3.qrcode("https://ro.blox.com/Ebh5?pid=share&is_retargeting=true&af_dp=roblox%3A%2F%2Fnavigation%2Fshare_links%3Fcode%3D6e5de960f12ec44797d1d974c76605ff%26type%3DFriendInvite&af_web_dp=https%3A%2F%2Fwww.roblox.com%2Fshare-links%3Fcode%3D6e5de960f12ec44797d1d974c76605ff%26type%3DFriendInvite", 4);
        return v2.createElement(v1, {
            qrCodeMatrix = v11, 
            sideLength = 1
        });
    end
};
