local v0 = require(script.Parent.GetFFlagShareInviteLinkContextMenuV1ABTestEnabled);
local v1 = require(script.Parent.GetFFlagShareInviteLinkContextMenuV3ABTestEnabled);
return function()
    return v0() or v1();
end;
