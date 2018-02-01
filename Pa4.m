x=40;
y=40;
v = zeros(x,y)

left_b = 1;
right_b = 1;
top_b=0;
bottom_b =0;

top=0;
right=0
left=0
bottom=0

if top_b~='x'
      top=1;
end 

if left_b~='x'
      left=1;
end 

if right_b~='x'
      right=1;
end 

if bottom_b~='x'
      bottom=1;
end 



t_max=100;
t=0;

while t<t_max
    v_prev= v
    %iterate through the body of matrix (no edges)
    for i =2:x-1
        for j=2:y-1 
            v(i,j)=(v_prev(i-1,j)+v_prev(i+1,j)+v_prev(i,j-1)+v_prev(i,j+1))/4  ;
        end
    end
    
   % do each boundary 
   %top
   for j = 2:y-1
       if top_b~='x'
            v(1,j)=(v_prev(1,j-1)+v_prev(1,j+1)+top_b+v_prev(2,j))/4;
       else 
           
            v(1,j)=(v_prev(1,j-1)+v_prev(1,j+1)+v_prev(2,j))/3;       
       end
   end
   
   %bottom
      for j= 2:y-1
       if bottom_b~='x'
            v(x,j)=(v_prev(x,j-1)+v_prev(x,j+1)+bottom_b+v_prev(x-1,j))/4;
       else 
            v(x,j)=(v_prev(x,j-1)+v_prev(x,j+1)+v_prev(x-1,j))/3;
       end
      end
   
      
   %left
     for i = 2:x-1
       if left_b ~= 'x'
            v(i,1)=(v_prev(i-1,1)+v_prev(i+1,1)+left_b+v_prev(i,2))/4;
       else 
            v(i,1)=(v_prev(i-1,1)+v_prev(i+1,1)+v_prev(i,2))/3;
       end
     end
     
     for i = 2:x-1
       if right_b ~= 'x'
            v(i,y)=(v_prev(i-1,y)+v_prev(i+1,y)+right_b+v_prev(i,y-1))/4;
       else 
            v(i,y)=(v_prev(i-1,y)+v_prev(i+1,y)+v_prev(i,y-1))/3;
       end
     end
      
     %top left
     if top+left ==0
         v(1,1)=(v_prev(1,2)+v_prev(2,1))/2;
     elseif top==1 & left==0
         v(1,1)=(v_prev(1,2)+v_prev(2,1)+top_b)/3;
     elseif top==0 & left==1
         v(1,1)=(v_prev(1,2)+v_prev(2,1)+left_b)/3;
     else
         v(1,1)=(v_prev(1,2)+v_prev(2,1)+left_b+top_b)/4;
     end    
      %top right
           if top+right ==0
         v(1,y)=(v_prev(1,y-1)+v_prev(2,y))/2;
     elseif top==1 & right==0
         v(1,y)=(v_prev(1,y-1)+v_prev(2,y)+top_b)/3;
     elseif top==0 & right==1
         v(1,y)=(v_prev(1,y-1)+v_prev(2,y)+right_b)/3;
     else
         v(1,y)=(v_prev(1,y-1)+v_prev(2,y)+right_b+top_b)/4;
           end
         
         %bottom left
           if bottom+left ==0
         v(x,1)=(v_prev(x-1,1)+v_prev(x,2))/2;
     elseif bottom==1 & left==0
         v(x,1)=(v_prev(x-1,1)+v_prev(x,2)+bottom_b)/3;
     elseif bottom==0 & left==1
         v(x,1)=(v_prev(x-1,1)+v_prev(x,2)+left_b)/3;
     else
         v(x,1)=(v_prev(x-1,1)+v_prev(x,2)+bottom_b+left_b)/4;      
           end
        
         %bottom right
           if bottom+right ==0
         v(x,y)=(v_prev(x-1,y)+v_prev(x,y-1))/2;
     elseif bottom==1 & right==0
         v(x,y)=(v_prev(x-1,y)+v_prev(x,y-1)+bottom_b)/3;
     elseif bottom==0 & right==1
         v(x,y)=(v_prev(x-1,y)+v_prev(x,y-1)+right_b)/3;
     else
         v(x,y)=(v_prev(x-1,y)+v_prev(x,y-1)+bottom_b+right_b)/4;          
           end
    
         
    surf(v)
    pause(.1)
    t=t+1
end
[ex,ey]=gradient(v)
quiver(ex,ey)
hold on 
contour(v)