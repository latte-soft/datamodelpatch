local v0 = require(script.Parent.GetFFlagLuaAppUseTooltipsFromSort);
local v1 = require(script.Parent.UIBlox.GetFFlagUIBloxSupportControlStateSelectedForTooltipHover);
game:DefineFastFlag("TenFootUiSupportSortHeaderTooltip2", false);
return function()
    return (v0() and v1()) and game:GetFastFlag("TenFootUiSupportSortHeaderTooltip2");
end;
