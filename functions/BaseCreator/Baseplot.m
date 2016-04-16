%--------------------------------------------------------------------------
% Plot bases of GPS network
%--------------------------------------------------------------------------
% the format for the number of the station must be:
% for the first 1
% for the second 12 13 14 ...
% for the third  21 22 31 32 41 43 ...
%--------------------------------------------------------------------------
clc
clear all
format compact
format long

fid=0;
while fid < 1 
   filename=input('Open file coords: ', 's');
   [fid,message] = fopen(filename, 'r');
   if fid == -1
     disp(message)
   end
end
% format file of input data: code, X, Y , num of net
inpdata=textscan(fid,'%4s %12.4f %12.4f %.0f ','delimiter',',');
disp('Read input data...')
code=inpdata{1};
X=inpdata{2};
Y=inpdata{3};
num=inpdata{4};

m=0;k=-1;
inp=fopen(filename, 'r');
while m~=-1
    k=k+1;
    m=fgetl(inp);
    %m=feof(crd);
end

output=input('Give the name of the output file: ','s');
out=fopen(output,'w');
fprintf(out,'polyline\n');
disp('Create bases of the network...')
for i=1:k
    if num(i)==1
       for j=1:k
          if ((num(j)/10)>=1) && ((num(j)/10)<2)
             fprintf(out,'1 0\n');
             fprintf(out,'0 %.4f %.4f 0.0 0.0\n',X(i),Y(i));
             fprintf(out,'1 %.4f %.4f 0.0 0.0\n',X(j),Y(j));
          end
       end
    end
    if ((num(i)/10)<2) && ((num(i)/10)>1)
        if (num(i)-10)==2
           for j=1:k
              if  (num(j)/10)>=2 && (num(j)/10)<3
                 fprintf(out,'2 0\n');
                 fprintf(out,'0 %.4f %.4f 0.0 0.0\n',X(i),Y(i));
                 fprintf(out,'1 %.4f %.4f 0.0 0.0\n',X(j),Y(j));
              end
           end
        end
        if (num(i)-10)==3
           for j=1:k
              if  (num(j)/10)>=3 && (num(j)/10)<4
                 fprintf(out,'2 0\n');
                 fprintf(out,'0 %.4f %.4f 0.0 0.0\n',X(i),Y(i));
                 fprintf(out,'1 %.4f %.4f 0.0 0.0\n',X(j),Y(j));
              end
           end
        end
        if (num(i)-10)==4
           for j=1:k
              if  (num(j)/10)>=4 && (num(j)/10)<5
                 fprintf(out,'2 0\n');
                 fprintf(out,'0 %.4f %.4f 0.0 0.0\n',X(i),Y(i));
                 fprintf(out,'1 %.4f %.4f 0.0 0.0\n',X(j),Y(j));
              end
           end
        end
        
    end
    
    
    
    
end
fprintf(out,'END');
%--------------------------------------------------------------------------
disp('Finished...!!!')
fclose all;


















