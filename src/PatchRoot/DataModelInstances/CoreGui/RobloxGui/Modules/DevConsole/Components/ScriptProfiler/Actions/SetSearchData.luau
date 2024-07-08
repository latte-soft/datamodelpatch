return require(script.Parent.Parent.Parent.Parent.Action)("ScriptProfiler" .. script.Name, function(v0, v1)
    return {
        isClient = v0, 
        state = v1
    };
end);
