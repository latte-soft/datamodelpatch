local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfileQRCode");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(script.Parent);
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.RoactRodux);
local v5 = require(l_script_FirstAncestor_0.TestHelpers.mockStore);
local v6 = require(l_script_FirstAncestor_0.TestHelpers.mockState);
local v7 = require(l_Parent_0.Dash);
local v8 = require(l_script_FirstAncestor_0.TestHelpers.DefaultTestUserId);
return {
    default = function(v9)
        return v3.createElement(v4.StoreProvider, {
            store = v5(v6())
        }, {
            QRCodeFriendRequestNotificationElement = v3.createElement(v2, {
                notificationQueueSize = 1, 
                onClose = if not v9.onClose then v7.noop else v9.onClose, 
                onAccept = if not v9.onAccept then v7.noop else v9.onAccept, 
                userId = if not v9.userId then v8 else v9.userId
            })
        });
    end
};
