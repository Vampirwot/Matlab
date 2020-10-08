classdef LoadBar
    properties
        step = 0;
        text = '';
        reverseStr='';
    end
    
    methods
        function obj = LoadBar(text)
            obj.text = text;
        end
        
        function obj = nextStep(obj)
            obj.step = obj.step + 1;
            countDot = mod(obj.step,4);
            msg = [obj.text repmat('.', 1, countDot)];
            fprintf('%s%s',obj.reverseStr, msg);
            obj.reverseStr = repmat(sprintf('\b'), 1, length(msg));
        end
        
        function obj = end(obj)
            fprintf('\n');
        end
    end
end

