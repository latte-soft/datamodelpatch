local l_Symbol_0 = require(script.Parent.Parent.LuauPolyfill).Symbol;
local function _(v1)
    print("");
    print("");
    print(" ");
end;
return {
    meta = {
        inspectable = l_Symbol_0("inspectable"), 
        inspected = l_Symbol_0("inspected"), 
        name = l_Symbol_0("name"), 
        preview_long = l_Symbol_0("preview_long"), 
        preview_short = l_Symbol_0("preview_short"), 
        readonly = l_Symbol_0("readonly"), 
        size = l_Symbol_0("size"), 
        type = l_Symbol_0("type"), 
        unserializable = l_Symbol_0("unserializable")
    }, 
    createDehydrated = function(_, _, _, _, _)
        print("");
        print("");
        print(" ");
        error("unimplemented createDehydrated");
    end, 
    dehydrate = function(v8, _, _, _, _, v13)
        if v13 == nil then
            v13 = 0;
        end;
        return v8;
    end, 
    fillInPath = function(_, _, _, _)
        print("");
        print("");
        print(" ");
    end, 
    hydrate = function(v18, _, _)
        return v18;
    end
};
