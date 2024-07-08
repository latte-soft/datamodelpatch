local v0 = require(script.Parent.Parent.dependencies);
local l_Roact_0 = v0.Roact;
local l_llama_0 = v0.llama;
return function(v3, v4)
    local v5 = l_Roact_0.PureComponent:extend("LoadingTimer");
    v5.init = function(v6)
        v6.loadingTime = {
            startTime = nil, 
            endTime = nil, 
            thresholdCanceled = false
        };
        v6.startThresholdTimer = function()
            if v4.loadingThreshold then
                delay(v4.loadingThreshold, function()
                    if not (((not v4.onReachingThreshold or v6.thresholdCanceled) or v6.loadingTime.endTime) or not v6.loadingTime.startTime) then
                        v6.stopTimer(true);
                        v4.onReachingThreshold(v6.getLoadingTime(), v6.props);
                    end;
                end);
                return ;
            else
                return ;
            end;
        end;
        v6.resetTimer = function()
            v6.loadingTime = {
                startTime = nil, 
                endTime = nil
            };
        end;
        v6.startTimer = function()
            v6.loadingTime.startTime = os.clock();
            v6.startThresholdTimer();
        end;
        v6.stopTimer = function(v7)
            if not v6.loadingTime.endTime then
                v6.loadingTime.endTime = os.clock();
                if not (not v4.onLoaded or v7) then
                    v4.onLoaded(v6.getLoadingTime(), v6.props);
                end;
                return ;
            else
                return ;
            end;
        end;
        v6.getLoadingTime = function()
            if not v6.loadingTime.endTime or not v6.loadingTime.startTime then
                return -1;
            else
                return v6.loadingTime.endTime - v6.loadingTime.startTime;
            end;
        end;
        v6.cancelThreshold = function()
            v6.thresholdCanceled = true;
        end;
    end;
    v5.render = function(v8)
        return l_Roact_0.createElement(v3, l_llama_0.Dictionary.join(v8.props, {
            loadingTimerProps = {
                startTimer = v8.startTimer, 
                stopTimer = v8.stopTimer, 
                resetTimer = v8.resetTimer, 
                getLoadingTime = v8.getLoadingTime, 
                cancelThreshold = v8.cancelThreshold
            }
        }));
    end;
    return v5;
end;
