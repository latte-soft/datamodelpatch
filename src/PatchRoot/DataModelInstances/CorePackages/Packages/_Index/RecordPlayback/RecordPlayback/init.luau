local l_script_0 = script;
local v1 = require(l_script_0.ArtifactLoader);
local v2 = require(l_script_0.RecordPlayback);
local v3 = require(l_script_0.Resolver);
return {
    createRecordPlayback = function(v4)
        local v5 = v1.new((v3.new(v4.instanceParent, v4.fileSystemPath)));
        return function(v6)
            assert(typeof(v6) == "string", "location should be a string");
            return v2.new(v5, v6);
        end;
    end
};
