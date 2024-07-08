local l_Parent_0 = script:FindFirstAncestor("SocialContextToasts").Parent;
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local v2 = require(l_Parent_0.React);
local l_DeeplinkConfirmationModal_0 = require(l_Parent_0.NotificationsCommon).DeeplinkConfirmationModal;
return function()
    local v5 = l_useSelector_0(function(v4)
        return v4.ConfirmationModal;
    end);
    return {
        DeeplinkConfirmationModal = (v5 and v5.isOpen) and v2.createElement(l_DeeplinkConfirmationModal_0, {
            closeCallback = v5.closeCallback
        })
    };
end;
