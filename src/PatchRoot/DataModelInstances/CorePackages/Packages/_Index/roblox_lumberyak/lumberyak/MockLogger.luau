local v0 = {
    Levels = {
        Error = "MockError", 
        Warning = "MockWarning", 
        Info = "MockInfo", 
        Debug = "MockDebug", 
        Trace = "MockTrace", 
        fromString = function()
            return "MockInfo";
        end
    }
};
v0.__index = v0;
v0.new = function()
    return (setmetatable({}, v0));
end;
v0.setParent = function()
end;
v0.setContext = function()
end;
v0.addSink = function()
end;
v0.error = function()
end;
v0.warning = function()
end;
v0.info = function()
end;
v0.debug = function()
end;
v0.trace = function()
end;
return v0;
