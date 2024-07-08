local v0 = require(script.Parent.Parent.Parent.Flags.getFFlagPassNavigationToContactsRevoked);
local _ = require(script.ContactsRevokedAccessDialog);
if not v0() then
    return (require(script.ContactsRevokedAccessDialog));
else
    return (require(script.ContactsRevokedAccessDialogEntryPoint));
end;
