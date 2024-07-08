local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfileQRCode");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(script.Parent.ProfileQRCodePage);
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.RoactRodux);
local v5 = require(l_script_FirstAncestor_0.TestHelpers.mockStore);
local v6 = require(l_script_FirstAncestor_0.TestHelpers.mockState);
local v7 = require(l_Parent_0.Dash);
local v8 = require(l_script_FirstAncestor_0.Common.Constants);
local v9 = require(l_script_FirstAncestor_0.TestHelpers.createMockRobloxEventReceiver);
local v10 = require(l_Parent_0.Dev.FormFactor);
return {
    default = function(v11)
        return v3.createElement(v4.StoreProvider, {
            store = v5(v6({
                LocalUserId = "156", 
                FormFactor = v10.Enums.FormFactor.WIDE
            }))
        }, {
            AvatarBackground = v3.createElement("Frame", {
                Size = UDim2.new(0, 1200, 0, 800), 
                BackgroundColor3 = Color3.new(1, 0, 1)
            }, {
                ProfileQRCodePage = v3.createElement(v2, {
                    profileQRCodeFriendRequestAlertsEnabled = if not v11.profileQRCodeFriendRequestAlertsEnabled then nil else v11.profileQRCodeFriendRequestAlertsEnabled, 
                    onClose = if not not v11 and v11.onClose then v11.onClose else v7.noop, 
                    openQrCodeScanner = if not not v11 and v11.openQrCodeScanner then v11.openQrCodeScanner else v7.noop, 
                    robloxEventReceiver = if not v11.robloxEventReceiver then v9().mockEventReceiver else v11.robloxEventReceiver
                })
            })
        });
    end, 
    loading = function(v12)
        return v3.createElement(v4.StoreProvider, {
            store = v5(v6({
                LocalUserId = "156", 
                FormFactor = v10.Enums.FormFactor.WIDE, 
                [v8.RODUX_KEY] = {
                    Users = {}, 
                    NetworkStatus = {}
                }
            }))
        }, {
            AvatarBackground = v3.createElement("Frame", {
                Size = UDim2.new(0, 1200, 0, 800), 
                BackgroundColor3 = Color3.new(1, 0, 1)
            }, {
                ProfileQRCodePage = v3.createElement(v2, {
                    profileQRCodeFriendRequestAlertsEnabled = true, 
                    onClose = if not not v12 and v12.onClose then v12.onClose else v7.noop, 
                    openQrCodeScanner = if not not v12 and v12.openQrCodeScanner then v12.openQrCodeScanner else v7.noop, 
                    robloxEventReceiver = v9().mockEventReceiver
                })
            })
        });
    end
};
