function printTable(colums,varargin)

   maxLength = zeros(1,length(colums));
   if(length(colums)~=length(varargin))
       error('Размеры массив разные');
   end
   
   for i = 1:length(varargin)
      if(length(colums)~=length(varargin{i})) 
          error('Размеры массив разные');
      end
      maxLength(i) = max([strlength(colums{i}), strlength(varargin{i})]) + 2
   end
   
end

