local v0 = game:DefineFastFlag("FriendCarouselHas10ftPolicies", false);
local l_GuiService_0 = game:GetService("GuiService");
return function()
    if not v0 then
        return false;
    else
        return l_GuiService_0:IsTenFootInterface();
    end;
end;
