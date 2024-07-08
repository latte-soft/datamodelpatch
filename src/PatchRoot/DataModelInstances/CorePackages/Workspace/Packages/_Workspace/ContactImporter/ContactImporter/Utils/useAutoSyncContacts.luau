local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_0.dependencies);
local l_ContactsProtocol_0 = require(l_Parent_1.ContactsProtocol).ContactsProtocol;
local l_AppStorageService_0 = game:GetService("AppStorageService");
local l_useSelector_0 = v2.useSelector;
local l_useDispatch_0 = v2.useDispatch;
local l_useEffectOnce_0 = v2.useEffectOnce;
local v8 = require(l_Parent_0.Networking.AutoSyncContacts);
local v9 = require(l_Parent_0.Utils.getContactImporterParams);
local v10 = require(script.Parent.Parent.Flags.FFlagDisablePhoneVerificationForCI);
local v11 = require(script.Parent.Parent.Flags.DisablePhoneVerificationForCIIXP);
return function(v12)
    local v13 = l_useDispatch_0();
    local v15 = l_useSelector_0(function(v14)
        return v14.LocalUserId;
    end);
    local v16 = v11.useIsPVRequired({
        isExposureEnabled = true
    });
    local v17 = l_useSelector_0(v9);
    local _ = nil;
    l_useEffectOnce_0(v12 or function()
        v13(v8(v15, l_ContactsProtocol_0.default, l_AppStorageService_0));
    end, if not v10 or v16 then not not v17.canUploadContacts and (v17.isPhoneVerified or false) else v17.canUploadContacts or false);
end;
