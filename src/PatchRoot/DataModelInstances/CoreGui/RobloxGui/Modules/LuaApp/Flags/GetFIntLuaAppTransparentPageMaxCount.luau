game:DefineFastInt("LuaAppTransparentPageMaxCount", 2);
return function()
    return (math.max(game:GetFastInt("LuaAppTransparentPageMaxCount"), 1));
end;
