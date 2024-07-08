game:DefineFastString("DebugDefaultPageOverride", "");
return function()
    local l_FVariable_0 = settings():GetFVariable("LuaAppDefaultPageOverride");
    if #l_FVariable_0 > 0 then
        return l_FVariable_0;
    else
        return game:GetFastString("DebugDefaultPageOverride");
    end;
end;
