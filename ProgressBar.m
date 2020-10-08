classdef ProgressBar
    
    properties
       max_step;
       reverseStr = '';
    end
    
     properties(Constant)
       complete = '?';
       incomplete = '?';
    end
    
    methods
        function obj = ProgressBar(max_step)
            obj.max_step = max_step;
        end
        
        function obj = print(obj,current_step)
           percentDone = 100 * current_step / obj.max_step;
           if(percentDone > 100)
               error('percentDone > 100');
           end
           countComplete = floor(percentDone / 10);
           countInComplete = 10 - countComplete;
           msgCompleteM = repmat(obj.complete, 1, countComplete);
           msgInCompleteM = repmat(obj.incomplete, 1, countInComplete);
           msgInComplete = sprintf('%s', msgInCompleteM);
           msgComplete = sprintf('%s', msgCompleteM);
           msg = sprintf('%s%s %3.1f%%\n', msgComplete,msgInComplete,percentDone);
           fprintf('%s%s',obj.reverseStr, msg);
           obj.reverseStr = repmat(sprintf('\b'), 1, length(msg));
        end
    end
end

