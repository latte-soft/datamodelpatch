local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.LuaApp.AppPage);
local v2 = require(l_Modules_0.LuaApp.ArgCheck);
local v3 = require(l_Modules_0.LuaApp.Thunks.NavigateDown);
if not require(l_Modules_0.LuaApp.Flags.GetFFlagLuaAppUseWithLocalization)() then
    return function(v4, v5)
        assert(type(v4) == "string", string.format("OpenWebview thunk expects url to be a string, was %s", (type(v4))));
        assert(type(v5) == "string", string.format("OpenWebview thunk expects title to be a string, was %s", (type(string))));
        return function(v6)
            v6:dispatch(v3({
                name = v1.GenericWebPage, 
                detail = v4, 
                extraProps = {
                    title = v5
                }
            }));
        end;
    end;
else
    return function(v7, v8)
        v2.isType(v7, "string", "url");
        v2.isType(v8, "string", "titleKey");
        return function(v9)
            v9:dispatch(v3({
                name = v1.GenericWebPage, 
                detail = v7, 
                extraProps = {
                    titleKey = v8
                }
            }));
        end;
    end;
end;
