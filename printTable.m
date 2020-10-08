function printTable(columns,varargin)

   maxLength = getLen(columns);
   for i = 1:length(varargin)
      if(length(columns)~=length(varargin{i})) 
          error('Размеры массив отличаются');
      end
      for j = 1:length(varargin{i})
          if(maxLength(j) < getLen(varargin{i}(j)))
            maxLength(j) = getLen(varargin{i}(j));
          end
      end
   end
   border = '+';
   columnTitle = '| ';
   for i = 1:length(columns)
      border = strcat(border,repmat('-', 1, maxLength(i)+2),'+');
      columnTitle = strcat(columnTitle, columns{i},string({repmat((' '),1,1+maxLength(i)-getLen(columns{i}))}),' |');
   end
   disp(border);
   disp(columnTitle);
   disp(border);
   
   line ='| ';
   
   for i = 1:length(varargin)
       for j = 1:length(varargin{i})
         line = strcat(line, varargin{i}(j),string({repmat((' '),1,1+maxLength(j)-getLen(varargin{i}(j)))}),' |');
       end
       disp(line);
       line = '| ';
   end
   disp(border);
end

