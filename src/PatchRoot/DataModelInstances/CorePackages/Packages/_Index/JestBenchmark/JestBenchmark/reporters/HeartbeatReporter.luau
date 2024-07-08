local v0 = {};
local l_initializeReporter_0 = require(script.Parent.Reporter).initializeReporter;
local v2 = require(script.Parent.Parent.heartbeatModule);
v0.initializeHeartbeatReporter = function(v3, v4)
    local v5 = l_initializeReporter_0(v3, v4);
    local v6 = false;
    local v7 = nil;
    local v8 = 0;
    return {
        start = function(v9)
            v5.start(v9);
            v8 = v8 + 1;
            if not v6 then
                v6 = true;
                v7 = v2:Connect(function(v10)
                    if v8 > 0 then
                        v5.report(v10);
                    end;
                end);
            end;
        end, 
        stop = function()
            v8 = v8 - 1;
            v5.stop();
        end, 
        finish = function()
            if v7 then
                v7:Disconnect();
            end;
            return v5.finish();
        end, 
        report = function(_)
            error((("Attempted to call %*Reporter.report. This reporter handles reporting internally."):format(v3)));
        end
    };
end;
return v0;
