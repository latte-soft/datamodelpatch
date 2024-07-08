local v0 = {};
local l_initializeReporter_0 = require(script.Parent.Reporter).initializeReporter;
local function v3(v2)
    if #v2 == 0 then
        return 0;
    else
        return v2[#v2] - v2[1];
    end;
end;
v0.initializeSectionTimeReporter = function()
    local v4 = l_initializeReporter_0("SectionTime", v3);
    return {
        start = function(v5)
            v4.start(v5);
            v4.report(os.clock());
        end, 
        stop = function()
            v4.report(os.clock());
            v4.stop();
        end, 
        finish = v4.finish, 
        report = function(_)
            error("Attempted to call SectionTimeReporter.report. This reporter handles reporting internally.");
        end
    };
end;
return v0;
