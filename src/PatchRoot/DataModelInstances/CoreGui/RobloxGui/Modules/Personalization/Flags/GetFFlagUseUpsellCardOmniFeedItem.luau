game:DefineFastFlag("UseUpsellCardOmniFeedItem", false);
local v0 = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Flags.GetFFlagUseUIBloxButtonsUpsellCard);
return function()
    return game:GetFastFlag("UseUpsellCardOmniFeedItem") and v0();
end;
