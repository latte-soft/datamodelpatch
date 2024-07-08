local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfileQRCode");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(script.Parent.QRCodeView);
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.RoactRodux);
local v5 = require(l_script_FirstAncestor_0.TestHelpers.mockStore);
local v6 = require(l_script_FirstAncestor_0.TestHelpers.mockState);
local v7 = require(l_script_FirstAncestor_0.Common.Constants);
local l_NetworkStatus_0 = require(l_script_FirstAncestor_0.Networking.configuredRoduxNetworking).Enum.NetworkStatus;
return {
    default = function()
        return v3.createElement(v4.StoreProvider, {
            store = v5(v6({
                LocalUserId = "156"
            }))
        }, {
            QRCodeView = v3.createElement(v2, {
                layoutOrder = 1
            })
        });
    end, 
    loading = function()
        return v3.createElement(v4.StoreProvider, {
            store = v5(v6({
                LocalUserId = "156", 
                [v7.RODUX_KEY] = {
                    Users = {}, 
                    NetworkStatus = {}, 
                    ShareUrl = {}
                }
            }))
        }, {
            QRCodeView = v3.createElement(v2, {
                layoutOrder = 1
            })
        });
    end, 
    failed = function()
        return v3.createElement(v4.StoreProvider, {
            store = v5(v6({
                LocalUserId = "156", 
                [v7.RODUX_KEY] = {
                    Users = {}, 
                    NetworkStatus = {
                        ["https://apis.roblox.com/sharelinks/v1/get-or-create-link"] = l_NetworkStatus_0.Failed
                    }, 
                    ShareUrl = {}
                }
            }))
        }, {
            QRCodeView = v3.createElement(v2, {
                layoutOrder = 1
            })
        });
    end
};
