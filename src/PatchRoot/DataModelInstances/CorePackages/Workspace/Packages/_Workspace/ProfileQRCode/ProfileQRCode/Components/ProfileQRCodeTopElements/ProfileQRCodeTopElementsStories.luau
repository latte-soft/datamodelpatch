local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfileQRCode");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(script.Parent);
local v3 = require(l_Parent_0.Dash);
local v4 = require(l_Parent_0.React);
local v5 = require(l_Parent_0.RoactRodux);
local v6 = require(l_script_FirstAncestor_0.TestHelpers.createMockAppStorageService);
local v7 = require(l_script_FirstAncestor_0.TestHelpers.createMockRobloxEventReceiver);
local v8 = require(l_script_FirstAncestor_0.TestHelpers.mockState);
local v9 = require(l_script_FirstAncestor_0.TestHelpers.mockStore);
local v10 = v6();
return {
    default = function(v11)
        return v4.createElement(v5.StoreProvider, {
            store = v9(v8({
                LocalUserId = "156"
            }))
        }, {
            Wrapper = v4.createElement("Frame", {
                BackgroundTransparency = 0, 
                Size = UDim2.fromOffset(400, 500), 
                BorderSizePixel = 0
            }, {
                ProfileQRCodeTopElements = v4.createElement(v2, {
                    appStorageService = if not v11.appStorageService then v10 else v11.appStorageService, 
                    onClose = if not v11.onClose then v3.noop else v11.onClose, 
                    openQrCodeScanner = if not v11.openQrCodeScanner then v3.noop else v11.openQrCodeScanner, 
                    profileQRCodeFriendRequestAlertsEnabled = if not v11.profileQRCodeFriendRequestAlertsEnabled then nil else v11.profileQRCodeFriendRequestAlertsEnabled, 
                    robloxEventReceiver = if not v11.robloxEventReceiver then v7().mockEventReceiver else v11.robloxEventReceiver
                })
            })
        });
    end
};
