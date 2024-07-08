local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfileQRCode");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_script_FirstAncestor_0.Networking.useGetProfileShareUrl);
local v4 = require(l_script_FirstAncestor_0.Analytics.useAnalytics);
local v5 = require(l_script_FirstAncestor_0.Rodux.useShortUrl);
local v6 = require(script.Parent.useHasLoadedSuccessfully);
local v7 = require(l_script_FirstAncestor_0.Networking.useLoadingState);
local l_NetworkStatus_0 = require(l_script_FirstAncestor_0.Networking.configuredRoduxNetworking).Enum.NetworkStatus;
local v9 = require(script.Parent.QRCodeFailedView);
local v10 = require(script.Parent.QRCodeSucceededView);
local v11 = require(script.Parent.QRCodeLoadingView);
local l_useEffectOnce_0 = require(l_Parent_0.RoactUtils).Hooks.useEffectOnce;
local v13 = require(script.Parent.useHasFailedToLoad);
return function(v14)
    local v15 = v4();
    local v16 = v7();
    local v17 = v3();
    local v18 = v5();
    local v19 = v18 ~= nil;
    local v20 = v16 == l_NetworkStatus_0.Failed;
    l_useEffectOnce_0(v17, not v19);
    v6(v15, v19);
    v13(v15, v20);
    local v21 = nil;
    v21 = if not v19 then if v20 then v2.createElement(v9, {
        onActivated = v17, 
        padding = 24
    }) else v2.createElement(v11) else v2.createElement(v10, {
        url = v18, 
        qrCodeLength = 200, 
        padding = 24, 
        isSmallScreen = v14.isSmallScreen
    });
    local _ = 304;
    return v2.createElement("Frame", {
        Size = UDim2.new(0, 304, 0, not v14.isSmallScreen and 304 or 280), 
        LayoutOrder = v14.layoutOrder, 
        BackgroundTransparency = 1
    }, {
        View = v21
    });
end;
