game:DefineFastFlag("EnableUISoundAndHaptics5", false);
local l_FFlagUIBloxUseNewInteractable_0 = script.Parent.UIBlox.FFlagUIBloxUseNewInteractable;
return function()
    return l_FFlagUIBloxUseNewInteractable_0 and game:GetFastFlag("EnableUISoundAndHaptics5");
end;
