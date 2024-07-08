local v0 = require(script.Parent.useGuiState);
return function(v1)
    return v0(v1) == Enum.GuiState.Press;
end;
