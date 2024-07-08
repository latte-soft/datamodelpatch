local l_Parent_0 = script.Parent.Parent.Parent;
local _ = require(l_Parent_0.Reducers.Root);
local _ = require(l_Parent_0.Common.GuiInset);
return function(v3)
    return {
        statusBarHeight = v3.TopBar.statusBarHeight, 
        screenSize = v3.ScreenSize, 
        globalGuiInset = v3.GlobalGuiInset
    };
end;
