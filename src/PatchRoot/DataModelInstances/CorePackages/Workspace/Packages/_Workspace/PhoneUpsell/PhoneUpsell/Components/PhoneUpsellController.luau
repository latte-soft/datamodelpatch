local l_script_FirstAncestor_0 = script:FindFirstAncestor("PhoneUpsell");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Cryo);
local l_OpenModal_0 = require(l_Parent_0.NotificationModalsManager).OpenModal;
local l_CloseModal_0 = require(l_Parent_0.NotificationModalsManager).CloseModal;
local v5 = require(l_script_FirstAncestor_0.Components.InGameContainer);
return {
    openPhoneUpsell = function(v6)
        l_OpenModal_0("PHONE_UPSELL_KEY", v5, {
            Props = v2.Dictionary.join(v6, {
                closeUpsell = function()
                    l_CloseModal_0("PHONE_UPSELL_KEY");
                end
            })
        });
    end
};
