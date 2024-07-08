local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfileQRCode");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(script.Parent.ProfileQRCodeTopBar);
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.Dash);
local v5 = require(l_Parent_0.RoactRodux);
local v6 = require(l_script_FirstAncestor_0.TestHelpers.createMockAppStorageService);
local v7 = require(l_script_FirstAncestor_0.TestHelpers.mockStore);
local v8 = require(l_script_FirstAncestor_0.TestHelpers.mockState);
local v9 = v6();
return {
    default = function(v10)
        return v3.createElement(v5.StoreProvider, {
            store = v7(v8())
        }, {
            ProfileQRCodeTopBar = v3.createElement(v2, {
                appStorageService = if not v10.appStorageService then v9 else v10.appStorageService, 
                layoutOrder = 1, 
                onClose = if not v10.onClose then v4.noop else v10.onClose, 
                openQrCodeScanner = if not v10.openQrCodeScanner then v4.noop else v10.openQrCodeScanner
            })
        });
    end
};
